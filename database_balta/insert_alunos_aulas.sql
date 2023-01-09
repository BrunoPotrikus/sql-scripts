SELECT * FROM [Course]
SELECT * FROM [Student]
SELECT * FROM [StudentCourse]

INSERT INTO
    [Student]([Id], [Name], [Email], [Document], [Phone], [Birthdate], [CreateDate])
VALUES
(
    NEWID(),
    'Bruno Potrikus',
    'bruno@email.com',
    '01234567890',
    '12345678',
    GETDATE(),
    GETDATE()
)

INSERT INTO
    [StudentCourse]([CourseId], [StudentId], [Progress],[Favorite], [StartDate], [LastUpdateDate])
VALUES
(
    '5f5a33f8-4ff3-7e10-cc6e-3fa000000000',
    '794eb3ec-5df7-4db3-8773-5a45ea95ce7e',
    50,
    0,
    '2022-05-17 10:25:28',
    GETDATE()
)