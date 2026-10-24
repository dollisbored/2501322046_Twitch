USE TwitchDB;
GO

CREATE FUNCTION fn_GetChannelRevenue (@ChanID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN (SELECT ISNULL(SUM(Price), 0) FROM Subscription WHERE ChannelID = @ChanID);
END;
GO

CREATE FUNCTION fn_GetUserMessageCount (@UsrID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    SELECT @Count = COUNT(*) FROM ChatMessage WHERE UserID = @UsrID;
    RETURN @Count;
END;
GO

CREATE PROCEDURE sp_StartStream 
    @ChanID INT, @CatID INT, @StreamTitle VARCHAR(200)
AS
BEGIN
    INSERT INTO Stream (ChannelID, CategoryID, Title, ViewCount)
    VALUES (@ChanID, @CatID, @StreamTitle, 0);
END;
GO

CREATE PROCEDURE sp_ChannelReport 
    @ChanID INT
AS
BEGIN
    SELECT 
        u.Username, c.TotalFollowers, c.IsPartnered, 
        dbo.fn_GetChannelRevenue(@ChanID) AS TotalRevenue
    FROM Channel c
    JOIN [User] u ON c.UserID = u.UserID
    WHERE c.ChannelID = @ChanID;
END;
GO

CREATE TRIGGER trg_PreventNegativePrice
ON Subscription
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE Price < 0)
    BEGIN
        RAISERROR ('Subscription price cannot be negative.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

CREATE TRIGGER trg_SimulateViewerActivity
ON ChatMessage
AFTER INSERT
AS
BEGIN
    UPDATE Stream
    SET ViewCount = ViewCount + 1
    FROM Stream s
    INNER JOIN inserted i ON s.StreamID = i.StreamID;
END;
GO