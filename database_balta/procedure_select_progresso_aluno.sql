CREATE OR ALTER PROCEDURE spStudentProgress
(
    @StudentId UNIQUEIDENTIFIER
)
AS
    SELECT 
        [Student].[Name] AS [Student],
        [Course].[Title] AS [Course],
        [StudentCourse].[Progress] AS [Progress],
        [StudentCourse].[LastUpdateDate]
    FROM
        [StudentCourse]
        INNER JOIN [Student] ON [StudentCourse].[StudentId] = [Student].[Id]
        INNER JOIN [Course] ON [StudentCourse].[CourseId] = [Course].[Id]
    WHERE
        [StudentCourse].[StudentId] = @StudentId
        AND
            [StudentCourse].[Progress] < 100
        AND
            [StudentCourse].[Progress] > 0
    GROUP BY 
        [Student].[Name],
        [Course].[Title],
        [StudentCourse].[Progress],
        [StudentCourse].[LastUpdateDate]