CREATE TABLE [app].[Moderation] (
    [Id]                INT              NOT NULL PRIMARY KEY CLUSTERED ([Id] ASC),
    [Category1]         DECIMAL (18, 17) NULL,
    [Category2]         DECIMAL (18, 17) NULL,
    [Category3]         DECIMAL (18, 17) NULL,
    [ReviewRecommended] BIT              NULL,
    [ProfaneTerms]      NVARCHAR (MAX)   NULL,
    [BannedWords]       NVARCHAR(MAX)   NULL,
    CONSTRAINT [FK_Moderation_Entry] FOREIGN KEY ([Id]) REFERENCES [app].[Entry] ([Id])
);
