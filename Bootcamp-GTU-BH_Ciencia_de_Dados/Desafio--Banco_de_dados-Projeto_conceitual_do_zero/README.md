# Projeto: Projeto Conceitual, do zero, de um Banco de Dados de uma Oficina Mecânica

## Autor: Jeremias Diefenthaler

### Aula: Banco de Dados
### Professora: Juliana Mascarenhas
#### Tecnologia: SQL (para este projeto foi utilizado o MySQL Workbench)
#### Data: 03/11/2022
-----------------------------------------
## Objetivos do desafio:
- Desenvolver na prática o conhecimento adquirido nas aulas de Banco de Dados;
- Criar o esquema conceitual do zero para o contexto de uma oficina mecânica com base na narrativa fornecida;
- Criar e disponibilizar o repositório no GitHub.
-----------------------------------------
## Narrativas

 - Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica;
 - Clientes levam seus veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas;
 - Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS (Ordem de Serviço) com data de entrega;
 - A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra;
 - O valor de cada peça também irá compor a OS;
 - O cliente autoriza a execução dos serviços;
 - A mesma equipe avalia e executa os serviços;
 - Os mecânicos possuem código, nome, endereço e especialidade;
 - Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos;
 - Uma OS pode ser composta por vários serviços, e um mesmo serviço pode estar contido em mais de uma OS;
 - Uma OS pode ter vários tipos de peças, e uma peça pode estar presente em mais de uma OS.

---------------------------------------------

### A imagem do diagrama criado pode ser visto no arquivo "Diagrama_EER-Oficina_Mecanica.png" junto deste repositório.
