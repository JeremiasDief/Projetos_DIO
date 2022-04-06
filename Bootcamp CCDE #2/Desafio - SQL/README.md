# Projeto: Modelo de um Banco de Dados em SQL para o controle de séries televisivas assistidas

## Autor: Jeremias Diefenthaler

### Aula: MySql - Como modelar um banco de controle de séries assistidas - Digital Innovation One
### Professora: Nathally Souza
#### Tecnologia: SQL (para este projeto foi utilizado o SGBD PostgreSQL, através do PgAdmin 4)
#### Data: 06/04/2022
-----------------------------------------
## Objetivos do desafio:
- Desenvolver na prática o conhecimento adquirido nas aulas de SQL;
- Criar tabelas e inserir dados para um controle de séries de televisão assistidas;
- Criar e disponibilizar o repositório no GitHub.

- Plus: Comandos diversos manipulando os dados das tabelas e trazendo algumas informações mais detalhadas.
-----------------------------------------
## Descrição

### É importante ressaltar que os comandos de SQL aqui utilizados foram feitos no SGBD PostgreSQL, e que podem variar para outros SGBD's. Porém, a essência e objetivos dos comandos SQL seguem a mesma lógica em todos os SGBD's relacionais. 

- [x] Primeiramente foi criado um Database de nome "SQL_DIO"

- Comando utilizado: ```CREATE DATABASE```

- [x] Foram criadas duas tabelas com as seguintes colunas:

- info_series
  - id_serie como chave primária
  - name
  - total_seasons
  - total_eps
  - original_release
  - origin_country
  - original_network

- series_watched
  - id_watch como chave primária
  - id_serie como chave estrangeira, relacionada com a id_serie da tabela info_series
  - last_season_watched
  - last_ep_watched
  - last_date

- Comando utilizado: ```CREATE TABLE```

- [x] Após a criação, foram inseridos dados nas tabelas, respeitando o tipo de dado de cada coluna

- Comando utilizado: ```INSERT INTO```

- [x] Por fim, os seguintes comandos foram utilizados para manipulação dos dados:

- ```SELECT```;
- ```WHERE```;
- ```COUNT```;
- ```GROUP BY```;
- ```ORDER BY (ASC e DESC)```;
- ```INNER JOIN```.
---------------------------------------------
### Tipos de dados utilizados na criação das tabelas e suas diferenças para o MySQL:

- [x] ```SERIAL``` - incrementa numeração de colunas de forma automática, como por exemplo para as chaves primárias "id's"
  - Diferença para o MySQL: no MySQL se utiliza um formato ```INT``` (número inteiro) e se coloca a opção ```AUTO_INCREMENT```

- [x] ```CHARACTER VARYING(30)``` - Utilizado para dados tipo texto, limitando a 30 caracteres (neste caso)
  - Diferença para o MySQL: no MySQL se utiliza este tipo na forma ```VARCHAR(30)```

- [x] ```INTEGER``` - Utilizado para dados numéricos
  - Diferença para o MySQL: no MySQL se utiliza este tipo na forma ```INT```

- [x] ```DATE``` - Utilizado para dados do tipo data
  - Diferença para o MySQL: no MySQL é o mesmo comando
---------------------------------------------

### Imagem do diagrama relacional entre as entidades (tabelas)
<img width="auto" src="https://github.com/JeremiasDief/Projetos_DIO/blob/main/Bootcamp%20CCDE%20%232/Desafio%20-%20image-processing-package/image-processing-test-JeremiasDief.png">

---------------------------------------------

### Os comandos utilizados para a criação das tabelas, inserção de dados e as manipulações realizadas podem ser vistas no arquivo ".sql" junto deste repositório.
