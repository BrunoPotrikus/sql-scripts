CREATE OR ALTER PROCEDURE [spListaCursos] 
    @Categoria NVARCHAR(60)
AS 

    DECLARE @CategoriaId INT
    SET @CategoriaId = (SELECT TOP 1 [Id] FROM [Categoria] WHERE [Nome] = @Categoria)

    SELECT * FROM [Curso] WHERE [CategoriaId] = @CategoriaId 

    DROP PROCEDURE [spListaCursos]