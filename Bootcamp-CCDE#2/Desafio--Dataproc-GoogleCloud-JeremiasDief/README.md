# Projeto: Criando um Ecossistema Hadoop Totalmente Gerenciado com Google Cloud

## Autor: Jeremias Diefenthaler

### Aula: Criando um Ecossistema Hadoop Totalmente Gerenciado com Google Cloud - Digital Innovation One
### Professor: Marcelo Marques
#### Tecnologia: Big Data, Hadoop, Google Cloud
#### Data: 15/04/2022
-----------------------------------------
## Objetivos do desafio:
- Criar um ecossistema Big Data utilizando as ferramentas do Google Cloud;
- Criar um sistema de Cluster a partir do Dataproc API;
- Criar um Job para ser executado pelo cluster criado anteriormente.
-----------------------------------------
## Descrição

### Passo a passo para a execução deste desafio:
 - Criar uma conta no Gmail (pode utilizar uma já existente, ou criar uma nova);
 - Conhecer e dar um overview nas principais ferramentas do GCP (Google Cloud Platform);
 - Criar um novo projeto no GCP (meu projeto: desafio-dataproc-jeremias-dief);
 - Ativar o período de teste gratuito de 90 dias;
 - Criar um orçamento e alertas de budget;
 - Conhecer e entender a criação de uma nova instância de VM na Compute Engine API, e ativar esta API;
 - Ativar o Dataproc API;
 - Criar um Bucket no Cloud Storage (meu bucket: desafio-dataproc-jdief);
 - Criar um Cluster com 3 "Worker nodes" no Dataproc (meu cluster: cluster-desafio-dataproc-jdief);

 <p align="center"><img src="./Tela pós criação do cluster.png" width="1000"></p>

 - Criar um Job inicial de exemplo para teste do Cluster (job SparkPi);
 - Abrir o Cloud Shell;
    - No Cloud Shell:
        - Dar um "git clone" do repositório disponibilizado pelo Professor (link: https://github.com/marcelomarques05/dio-desafio-dataproc ;
        - Atualizar o arquivo ```contador.py``` com o nome do meu Bucket pelo "vim";
        - Copiar os arquivos ```contador.py``` e ```livro.txt``` para o meu Bucket;

         <p align="center"><img src="./Tela comandos Cloud Shell.png"></p>

        - Minimizar o Cloud Shell;
 - Criar um novo Job, tipo PySpark, passando o arquivo ```contador.py``` para rodar o contador de palavras no ```livro.txt``` (meu job: job-desafio-jeremiasdief);

 <p align="center"><img src="./Tela criando o job.png" width="1000"></p>

 - Verificar o novo diretório criado dentro do meu Bucket, chamado ```resultado```, que contém o arquivo resultante do Job: ```part-00000```;
 - Deste arquivo resultando, verificar as 10 palavras que mais se repetem dentro do arquivo ```livro.txt``` e salvá-las em um novo arquivo chamado ```resultado.txt```.

### __*Os dois arquivos resultantes do desafio (```part-00000``` e ```resultado.txt```) se encontram dentro da pasta ```resultado``` deste repositório.*__

-----------------------------------------
-----------------------------------------


## README.md disponibilizado pelo Professor

### Digital Innovation One

Código criado para utilização junto a plataforma da Digital Innovation One

<p align="center"><img src="./DIO.png" width="500"></p>

### Desafio GCP Dataproc

O desafio faz parte do curso na plataforma da Digital Innovation One:

__*Criando um ecossistema Hadoop totalmente gerenciado com Google Cloud Platform*__

O desafio consiste em efetuar um processamento de dados utilizando o produto Dataproc do GCP. Esse processamento irá efetuar a contagem das palavras de um livro e informar quantas vezes cada palavra aparece no mesmo.

---

#### Etapas do Desafio

1. Criar um bucket no Cloud Storage
1. Atualizar o arquivo ```contador.py``` com o nome do Bucket criado nas linhas que contém ```{SEU_BUCKET}```.
1. Fazer o upload dos arquivos ```contador.py``` e ```livro.txt``` para o bucket criado (instruções abaixo)
    - https://cloud.google.com/storage/docs/uploading-objects

1. Utilizar o código em um cluster Dataproc, executando um Job do tipo PySpark chamando ```gs://{SEU_BUCKET}/contador.py```
1. O Job irá gerar uma pasta no bucket chamada ```resultado```. Dentro dessa pasta o arquivo ```part-00000``` irá conter a lista de palavras e quantas vezes ela é repetida em todo o livro.

#### Entrega do Resultado

1. Criar um repositório no GitHub.
2. Criar um arquivo chamado ```resultado.txt```. Dentro desse arquivo, colocar as 10 palavras que mais são usadas no livro, de acordo com o resultado do Job.
3. Inserir os arquivo ```resultado.txt``` e ```part-00000``` no repositório e informar na plataforma da Digital Innovation One.

---

#### Considerações Finais

NOTA: Se o Job mostrar um WARN de Interrupt, basta ignorar. Existe um bug no Hadoop que é conhecido. Isso não impacta no processamento.

Qualquer outra dúvida, informação ou sugestão, fique a vontade para entrar em contato.

marcelo@smarques.com
