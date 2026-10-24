--- tuka razbira se ima CREATE TABLE TwitchDB; GO
--- naloji mi se da prenapisha vsichkite neshta, za da gi zapazq kato .sql file-ove, koito da moga da pratq

USE TwitchDB;
GO

CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE Category (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255)
);

CREATE TABLE Channel (
    ChannelID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES [User](UserID),
    Bio VARCHAR(255),
    IsPartnered BIT,
    TotalFollowers INT
);

CREATE TABLE Subscription (
    SubID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES [User](UserID),
    ChannelID INT FOREIGN KEY REFERENCES Channel(ChannelID),
    Tier INT,
    Price DECIMAL(5,2)
);

CREATE TABLE Emote (
    EmoteID INT IDENTITY(1,1) PRIMARY KEY,
    ChannelID INT FOREIGN KEY REFERENCES Channel(ChannelID),
    EmoteCode VARCHAR(50),
    ImageURL VARCHAR(255)
);

CREATE TABLE Stream (
    StreamID INT IDENTITY(1,1) PRIMARY KEY,
    ChannelID INT FOREIGN KEY REFERENCES Channel(ChannelID),
    CategoryID INT FOREIGN KEY REFERENCES Category(CategoryID),
    Title VARCHAR(200),
    ViewCount INT
);

CREATE TABLE ChatMessage (
    MessageID INT IDENTITY(1,1) PRIMARY KEY,
    StreamID INT FOREIGN KEY REFERENCES Stream(StreamID),
    UserID INT FOREIGN KEY REFERENCES [User](UserID),
    Content VARCHAR(500),
    TimeStamp DATETIME DEFAULT GETDATE()
);

CREATE TABLE Clip (
    ClipID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES [User](UserID),
    StreamID INT FOREIGN KEY REFERENCES Stream(StreamID),
    Duration INT,
    VideoURL VARCHAR(255)
);