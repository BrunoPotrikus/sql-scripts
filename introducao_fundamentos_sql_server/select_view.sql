-- Criando um VIEW de uma query
CREATE OR ALTER VIEW viewCountCursosPorCategoria AS
   SELECT TOP 100
      [Categoria].[Id],
      [Categoria].[Nome],
      COUNT([Curso].[CategoriaId]) AS [Cursos]
   FROM [Categoria] INNER JOIN [Curso] ON [Categoria].[Id] = [Curso].[CategoriaId]
   GROUP BY
      [Categoria].[Id],
      [Categoria].[Nome],
      [Curso].[CategoriaId]
   HAVING
      COUNT([Categoria].[Id]) > 1