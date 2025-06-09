
SELECT * FROM Filmes;

--1 - Buscar o nome e ano dos filmes
SELECT Nome, Ano FROM Filmes;

--2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano FROM Filmes 
	ORDER BY Ano ASC;

--3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome, Ano, Duracao FROM Filmes 
	WHERE Nome = 'De Volta para o Futuro';

--4 - Buscar os filmes lançados em 1997
SELECT Nome, Ano, Duracao FROM Filmes
	WHERE Ano = 1997;

--5 - Buscar os filmes lançados APÓS o ano 2000
SELECT Nome, Ano, Duracao FROM Filmes
	WHERE Ano > 2000;

--6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT Nome, Ano, Duracao FROM Filmes
	WHERE Duracao > 100 AND Duracao < 150
	ORDER BY Duracao ASC;

--7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano AS Ano, 
	COUNT(*) AS Quantidade
	FROM Filmes
	GROUP BY Ano
	ORDER BY SUM(Duracao) DESC;

-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT * FROM dbo.Atores
	WHERE Genero = 'M';

--9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT * FROM dbo.Atores
	WHERE Genero = 'F'
	ORDER BY PrimeiroNome;

SELECT * FROM dbo.FilmesGenero;
SELECT * FROM dbo.Generos;

--10 - Buscar o nome do filme e o gênero
SELECT 
	f.nome AS Nome,
	g.Genero AS Genero
FROM FIlmes f
JOIN FilmesGenero fg ON f.Id = fg.IdFilme
JOIN Generos g on fg.IdGenero = g.Id;


--11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT 
	f.nome AS Nome,
	g.Genero AS Genero
FROM FIlmes f
JOIN FilmesGenero fg ON f.Id = fg.IdFilme
JOIN Generos g on fg.IdGenero = g.Id
	WHERE g.Genero = 'Mistério';

SELECT * FROM dbo.Atores;

SELECT * FROM dbo.ElencoFilme;


--12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT 
	f.nome AS Nome,
	a.PrimeiroNome,
	a.UltimoNome,
	e.Papel

FROM Filmes f
JOIN ElencoFilme e ON f.Id = e.IdFilme
JOIN Atores a ON a.Id = e.IdAtor;