USE TwitchDB;
GO

INSERT INTO [User] (Username, Email, Password) VALUES 
('GamerPro', 'pro@email.com', 'pass123'),
('ChillViewer', 'chill@email.com', 'pass456'),
('SpeedRunner', 'speed@email.com', 'pass789');

INSERT INTO Category (Name, Description) VALUES 
('Just Chatting', 'IRL conversations'),
('Elden Ring', 'Action RPG'),
('Minecraft', 'Sandbox game');

INSERT INTO Channel (UserID, Bio, IsPartnered, TotalFollowers) VALUES 
(1, 'Pro gamer here', 1, 15000),
(3, 'Gotta go fast', 0, 800);

INSERT INTO Subscription (UserID, ChannelID, Tier, Price) VALUES 
(2, 1, 1, 4.99),
(3, 1, 2, 9.99),
(1, 2, 1, 4.99);

INSERT INTO Emote (ChannelID, EmoteCode, ImageURL) VALUES 
(1, 'ProChamp', 'http://img.com/e1'),
(2, 'SpeedZoom', 'http://img.com/e2');

INSERT INTO Stream (ChannelID, CategoryID, Title, ViewCount) VALUES 
(1, 2, 'No hit run!', 5000),
(2, 3, 'Building a castle', 150);

INSERT INTO ChatMessage (StreamID, UserID, Content) VALUES 
(1, 2, 'Insane dodge!'),
(1, 3, 'Wow!'),
(2, 1, 'Nice blocks.');

INSERT INTO Clip (UserID, StreamID, Duration, VideoURL) VALUES 
(2, 1, 30, 'http://clip.com/1'),
(1, 2, 15, 'http://clip.com/2');