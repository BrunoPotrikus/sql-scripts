SELECT TOP 2 [Id], [Nome] FROM [Curso] WHERE [CategoriaId] = 3

SELECT TOP 100 [Nome] FROM [Categoria]

-- Buscando os priomeiros 100 dados da base, porém exibindo apenas quem possui nomes diferentes
SELECT DISTINCT TOP 100 [Nome] FROM [Categoria]

-- Buscando os primeiros 100 dados, mas exibindo apenas os da categoria 1 
SELECT TOP 100 [Id], [Nome], [CategoriaId] FROM [Curso] WHERE [CategoriaId] = 1

-- Busacando dados por atributos específicos
SELECT TOP 100 [Id], [Nome], [CategoriaId] FROM [Curso] WHERE [CategoriaId] != 1 OR [Id] = 1

-- Exibindo dados de forma ordenada, crescente ou decrescente
SELECT TOP 100 [Id], [Nome], [CategoriaId] FROM [Curso] ORDER BY [Nome] DESC

-- Buscando o último dados que foi inserido na base
SELECT TOP 100 MAX([Id]) FROM [Categoria]

-- Somando o Id dos 100 primeiros dados (Sum é útil para somas de preços, por exemplo)
SELECT TOP 100 SUM([Id]) FROM [Categoria]

-- Buscando dados usando apenas parte do nome (Contém a palavra)
SELECT * FROM [Curso] WHERE [Nome] LIKE '%Fundamentos%' 

-- Buscando dados usando apenas parte do nome (Começa com a palavra)
SELECT * FROM [Curso] WHERE [Nome] LIKE 'Fundamentos%' 

-- Buscando dados usando apenas parte do nome (Termina com a palavra)
SELECT * FROM [Curso] WHERE [Nome] LIKE '%Fundamentos' 

-- Buscando vários dados utilizando o mesmo atributo
SELECT * FROM [Curso] WHERE [Id] IN (1, 3)

-- Buscando dados dentro de um determinado intervalo
SELECT * FROM [Curso] WHERE [Id] BETWEEN 1 AND 2

-- Atribuindo nome à colunas, útil para evitar conflitos entre tabelas
SELECT TOP 100 [Id] AS [Codigo], [Nome] FROM [Curso]

-- Exibindo total de dados inseridos, renomeando a coluna com o resultado
SELECT TOP 100 COUNT([Id]) AS [Total] FROM [Curso]

-- Juntando duas tabelas através da chave estrangeira CategoriaId
SELECT 
    [Curso].[Id],
    [Curso].[Nome],
    [Categoria].[Id] AS Categoria,
    [Categoria].[Nome]
 FROM [Curso] INNER JOIN [Categoria] ON [Curso].[CategoriaId] = [Categoria].[Id]

-- Juntando tabelas trazendo todos os itens da primeira tabela
 SELECT 
    [Curso].[Id],
    [Curso].[Nome],
    [Categoria].[Id] AS Categoria,
    [Categoria].[Nome]
 FROM [Curso] LEFT JOIN [Categoria] ON [Curso].[CategoriaId] = [Categoria].[Id]

 -- Juntando tabelas trazendo todos os itens da primeira tabela (Curso) e da segunda(Categoria) apenas se ela existir
 SELECT 
    [Curso].[Id],
    [Curso].[Nome],
    [Categoria].[Id] AS Categoria,
    [Categoria].[Nome]
 FROM [Curso] LEFT JOIN [Categoria] ON [Curso].[CategoriaId] = [Categoria].[Id]
 
 -- Juntando tabelas trazendo todos os itens da segunda tabela (Categoria) e da primeira(Curso) apenas se ela existir
 SELECT 
    [Curso].[Id],
    [Curso].[Nome],
    [Categoria].[Id] AS Categoria,
    [Categoria].[Nome]
 FROM [Curso] RIGHT JOIN [Categoria] ON [Curso].[CategoriaId] = [Categoria].[Id]

 -- Juntando tabelas trazendo todos os itens das duas tabelas
 SELECT 
    [Curso].[Id],
    [Curso].[Nome],
    [Categoria].[Id] AS Categoria,
    [Categoria].[Nome]
 FROM [Curso] FULL JOIN [Categoria] ON [Curso].[CategoriaId] = [Categoria].[Id]

  -- Juntando tabelas trazendo todos os itens das duas tabelas (Igual ao FULL JOIN)
 SELECT 
    [Curso].[Id],
    [Curso].[Nome],
    [Categoria].[Id] AS Categoria,
    [Categoria].[Nome]
 FROM [Curso] FULL OUTER JOIN [Categoria] ON [Curso].[CategoriaId] = [Categoria].[Id]

-- Agrupando duas tabelas utilizando UNION, através do uso de 2 SELECT, um para cada tabela
 SELECT 
    *
 FROM [Curso]

 UNION

SELECT 
    *
 FROM [Categoria]

 -- Agrupando duas tabelas utilizando UNION, através do uso de 2 SELECT, um para cada tabela,
 -- porém com uso so ALL, que irá realizar a função DISTINCT, ou seja, não irá retornar elementos duplicados
 SELECT 
    *
 FROM [Curso]

 UNION ALL

SELECT 
    *
 FROM [Categoria]

-- Juntando dados de duas tabelas e agrupando os dados de uma delas, agrupando essas informações com GROUP BY, útil para exibir a quantidade de um determinado item
 SELECT TOP 100
   [Categoria].[Id],
   [Categoria].[Nome],
   COUNT([Curso].[CategoriaId]) AS [Cursos]
 FROM [Categoria] INNER JOIN [Curso] ON [Categoria].[Id] = [Curso].[CategoriaId]
 GROUP BY
   [Categoria].[Id],
   [Categoria].[Nome],
   [Curso].[CategoriaId]

-- Filtrando dados com GROUP BY
-- Nesse caso, filtrando categorias que possuam mais de 1 curso cadstrado
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

-- Selecionando dados utilizando uma VIEW criada
SELECT * FROM viewCountCursosPorCategoria WHERE [Nome] = 'Backend'