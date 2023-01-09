SELECT * FROM [Curso]
SELECT * FROM [Categoria]

BEGIN TRANSACTION
    DELETE FROM
        [Curso]
    WHERE 
        [CategoriaId] = 3
COMMIT

BEGIN TRANSACTION
    DELETE FROM
        [Categoria]
    WHERE 
        [Id] = 3
COMMIT