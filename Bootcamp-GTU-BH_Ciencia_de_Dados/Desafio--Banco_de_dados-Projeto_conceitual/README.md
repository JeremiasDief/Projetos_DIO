# Projeto: Projeto Conceitual de um Banco de Dados de um E-commerce

## Autor: Jeremias Diefenthaler

### Aula: Banco de Dados
### Professora: Juliana Mascarenhas
#### Tecnologia: SQL (para este projeto foi utilizado o MySQL Workbench)
#### Data: 01/11/2022
-----------------------------------------
## Objetivos do desafio:
- Desenvolver na prática o conhecimento adquirido nas aulas de Banco de Dados;
- Criar um diagrama EER (modelo entidade relacionamento estendido);
- Criar e disponibilizar o repositório no GitHub.
-----------------------------------------
## Narrativas

 - Entidades:
   - Criar ao menos as entidades ```Pedido```, ```Cliente```, ```Produto```, ```Fornecedor```, ```Estoque```.

 - Em ```Produto```:
   - Os produtos são vendidos por uma única plataforma online, contudo, estes podem ter vendedores distintos;
   - Cada produto possui um fornecedor;
   - Um ou mais produtos podem compor um pedido.

 - Em ```Cliente```:
   - O cliente pode se cadastrar no site com seu CPF ou CNPJ;
   - O endereço do cliente irá determinar o valor do frete;
   - Um cliente pode comprar mais de um pedido, e este tem um período de carência para devolução do produto.

 - Em ```Pedido```:
   - Os pedidos são criados por clientes e possuem informações de compra, endereço e status da entrega;
   - Um produto ou mais compõem o pedido;
   - O pedido pode ser cancelado.

---------------------------------------------

### A imagem do diagrama criado pode ser visto no arquivo "Diagrama_EER-Ecommerce.png" junto deste repositório.
