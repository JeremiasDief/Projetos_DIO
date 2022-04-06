-- CRIANDO O DATABASE COM O NOME DE 'SQL_DIO':

CREATE DATABASE 'SQL_DIO'
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;


-- CRIANDO AS TABELAS info_series E series_watched:

CREATE TABLE info_series
(
    id_serie serial NOT NULL,
    name character varying(30) NOT NULL,
    total_seasons integer NOT NULL,
    total_eps integer NOT NULL,
    original_release date NOT NULL,
    origin_country character varying(20),
    original_network character varying(20),
    PRIMARY KEY (id_serie)
);

CREATE TABLE series_watched
(
    id_watch serial NOT NULL,
    id_serie integer NOT NULL,
    last_season_watched integer NOT NULL,
    last_ep_watched integer NOT NULL,
    last_date date DEFAULT current_timestamp,
    PRIMARY KEY (id_watch),
    FOREIGN KEY (id_serie)
        REFERENCES info_series (id_serie)
);


-- INSERINDO DADOS NAS TABELAS CRIADAS:

INSERT INTO info_series (name, total_seasons, total_eps, original_release, origin_country, original_network) VALUES
    ('Peaky Blinders', 6, 36, '2013-09-12', 'United Kingdom', 'BBC'),
    ('Outlander', 6, 72, '2014-08-09', 'United Kingdom', 'Starz'),
    ('The Walking Dead', 11, 168, '2010-10-31', 'United States', 'AMC'),
    ('Narcos', 3, 30, '2015-08-28', 'United States', 'Netflix'),
    ('Game of Thrones', 8, 73, '2011-04-17', 'United States', 'HBO'),
    ('Friends', 10, 236, '1994-09-22', 'United States', 'NBC'),
    ('How I meet your Mother', 9, 208, '2005-09-19', 'United States', 'CBS'),
    ('Elite', 4, 32, '2018-10-05', 'Spain', 'Netflix'),
    ('The Wheel of Time', 1, 8, '2021-11-19', 'United States', 'Amazon Prime Video'),
    ('3%', 4, 33, '2016-11-25', 'Brazil', 'Netflix'),
    ('Lupin', 1, 10, '2021-01-08', 'France', 'Netflix'),
    ('Fear the Walking Dead', 7, 93, '2015-08-23', 'United States', 'AMC'),
    ('WandaVision', 1, 9, '2021-01-15', 'United States', 'Disney+'),
    ('The Mandalorian', 2, 16, '2019-11-12', 'United States', 'Disney+'),
    ('The Chestnut Man', 1, 6, '2021-09-29', 'Denmark', 'Netflix'),
    ('Dark', 3, 26, '2017-12-01', 'Germany', 'Netflix'),
    ('Breaking Bad', 5, 62, '2008-01-20', 'United States', 'AMC'),
    ('Invisible City', 1, 7, '2021-02-05', 'Brazil', 'Netflix'),
    ('Loki', 1, 6, '2021-06-09', 'United States', 'Disney+'),
    ('Two and a Half Men', 12, 262, '2003-09-22', 'United States', 'CBS');

INSERT INTO series_watched (id_serie, last_season_watched, last_ep_watched, last_date) VALUES
    (17, 5, 62, '2016-09-12'),
    (5, 8, 73, '2019-05-19'),
    (7, 9, 198, '2022-03-31'),
    (2, 6, 70, '2022-04-02'),
    (1, 6, 36, '2022-04-04'),
    (3, 11, 168, current_timestamp()),
    (16, 3, 26, '2020-07-24'),
    (6, 8, 194, '2021-10-08'),
    (20, 12, 262, '2018-03-17'),
    (18, 1, 7, '2021-05-30');


-- ALGUMAS QUERYS PARA AS TABELAS CRIADAS:

-- Selecionando todas as colunas da tabela info_series
SELECT * FROM info_series;

-- Selecionando todas as colunas da tabela series_watched
SELECT * FROM series_watched;

-- Selecionando todas as colunas da tabela info_series que o país de origem é igual a "United States"
SELECT * FROM info_series WHERE origin_country = 'United States';

-- Contando o número de séries da tabela info_series onde o país de origem é diferente de "United States"
SELECT count(id_serie) AS qtd_diff_USA FROM info_series WHERE origin_country != 'United States';

-- Contando o número de séries agrupadas pela rede de televisão e ordenando da maior pra menor
SELECT count(id_serie) AS qtd, original_network AS qtd from info_series 
GROUP BY original_network 
ORDER BY count(id_serie) DESC, original_network ASC;

-- Juntando todas as colunas das tabelas info_series e series_watched ligadas pelo id_serie
SELECT * FROM info_series AS inf
INNER JOIN series_watched AS wat
    ON inf.id_serie = wat.id_serie;
    
/* Selecionando os nomes das séries assistidas, o número de eps assistidos e a data do último ep assitido
e ordenando por data de forma decrescente */
SELECT
    inf.name,
    wat.last_ep_watched,
    wat.last_date
FROM info_series AS inf
INNER JOIN series_watched AS wat
    ON inf.id_serie = wat.id_serie
ORDER BY wat.last_date DESC;

-- Somando o número de episódios assistidos agrupados pela rede de televisão e ordenando do maior pro menor
SELECT
    inf.original_network,
    sum(wat.last_ep_watched) as total_eps_watched
FROM info_series AS inf
INNER JOIN series_watched AS wat
    ON inf.id_serie = wat.id_serie
GROUP BY inf.original_network
ORDER BY total_eps_watched DESC;

-- Retornando o número de episódios que faltam para assistir todos os episódios lançados das séries assistidas
SELECT
    inf.name,
    (inf.total_eps - wat.last_ep_watched) as remaining_eps
FROM info_series AS inf
INNER JOIN series_watched AS wat
    ON inf.id_serie = wat.id_serie
ORDER BY remaining_eps DESC;