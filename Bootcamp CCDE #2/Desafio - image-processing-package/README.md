# Projeto: Pacote de Processamento de Imagens
## Autora do Projeto Original: Karina Kato
### Aula: Descomplicando a criação de pacotes de processamento de imagens em Python - Digital Innovation One
#### Tecnologia: Python
#### Data: 05/04/2022
-----------------------------------------
### Objetivos do desafio:
- Aprender a criar um pacote de processamento de imagens;
- Disponibilizá-lo no repositório PyPi (neste caso somente utilizarei o Test PyPi para fins de simulação);
- Criar e disponibilizar o repositório no GitHub.
-----------------------------------------
### Descrição
O pacote "image_processing-test-JeremiasDief" é usado para:

- Módulo "Processing":
  - Correspondência de histograma;
  - Similaridade estrutural;
  - Redimensionar imagem.

- Módulo "Utils":
  - Ler imagem;
  - Salvar imagem;
  - Plotar imagem;
  - Resultado do gráfico;
  - Plotar histograma.
---------------------------------------------
## Passo a passo da configuração para hospedar um pacote em Python no ambiente de testes Test Pypi

- [x] Instalação das últimas versões de "setuptools" e "wheel"

```
python -m pip install --user --upgrade setuptools wheel
```
- [x] Tenha certeza que o diretório no terminal seja o mesmo do arquivo "setup.py"

```
C:\Users\Usuario\Documents\Projetos DIO\Projetos_DIO\Bootcamp CCDE #2\Desafio - image-processing-package-JeremiasDief> python setup.py sdist bdist_wheel
```

- [x] Após completar a instalação, verifique se as pastas abaixo foram adicionadas ao projeto:
  - [x] build;
  - [x] dist;
  - [x] image_processing_test-JeremiasDief.egg-info.

- [x] Basta subir os arquivos, usando o Twine, para o Test Pypi:

```
python -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*
```

- [x] Após rodar o comando acima no terminal, será pedido para inserir o usuário e senha. Feito isso, o projeto estará hospedado no Test Pypi.

#### O objetivo deste desafio não é postar o pacote do projeto no meu perfil do PyPi, pois o mesmo pertence à Karina Kato.
#### O Test PyPi, como o próprio nome diz, é apenas um ambiente de testes, por isso é utilizado para simular o upload de um projeto no ambiente PyPi. Para que o projeto fique disponível como um pacote público é necessário hospedá-lo na conta pessoal do prórpio PyPi.
----------------------------------------------------
## Instalação local, após hospedagem no Test Pypi

- [x] Instalação do Pacote

Use o gerenciador de pacotes ```pip install -i https://test.pypi.org/simple/ image-processing-test-JeremiasDief``` para instalar image-processing-test-JeremiasDief

-------------------------------------------------
## Como usar em qualquer projeto

```python
from image-processing-test-JeremiasDief.processing import combination

combination.find_difference(image1, image2)
```
<img width="auto" src="https://github.com/JeremiasDief/Projetos_DIO/blob/main/Bootcamp%20CCDE%20%232/Desafio%20-%20image-processing-package/image-processing-test-JeremiasDief.png">

## Autor (quem hospedou o projeto no Test Pypi)
Jeremias Diefenthaler, baseado na publicação de HenriqueMAP

## Licença
[MIT](https://choosealicense.com/licenses/mit/)
