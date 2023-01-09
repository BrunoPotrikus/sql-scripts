SELECT * FROM [Categoria]

BEGIN TRANSACTION
    UPDATE
        [Categoria]
    SET
        [Nome] = 'Backend'
    WHERE
        [Id] = 1
COMMIT

UPDATE [categoria] SET [Nome] = '' WHERE [Nome] = 