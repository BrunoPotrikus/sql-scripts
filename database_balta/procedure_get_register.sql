CREATE OR ALTER PROCEDURE [spGetCourseByCategory]
(
    @CategoryId UNIQUEIDENTIFIER
)
AS
    SELECT * FROM [Course] WHERE [CategoryId] = @CategoryId