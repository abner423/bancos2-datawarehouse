# Data warehouse sobre cota parlamentar

Para que funcione o banco é necessário ter o csv que será nosso input de dados e servirá de carga para alimentar o modelo. Devido ao tamanho do arquivo, disponibilizei no meu drive pessoal que pode ser acessado no seguinte link:

https://drive.google.com/drive/folders/1TXCgGfFWsR6aN62gZmNn6vNZGPdi2JWI?usp=sharing

## Como utilizar ??

### Instale o Postgres
Primeiramente, a tecnologia utilizada para construir o modelo de datawarehouse com 1 datamart foi o POSTGRES. Logo os Scripts disponibilizados podem ter alguma diferença de sintaxe caso opte por utilizar em outra tecnologia.

### Rode os scripts referentes a criação das tabelas
É necessário a criação das tabelas porque lá terá as tabelas dimensões que irão gerar a tabela fato que será nosso data mart de apenas 1 tabela. Note que uma das tabelas está totalmente desnormalizada que servirá apenas para receber os dados que serão carregados do nosso CSV

### Rode os scripts referentes aos inserts no banco
Após a carga do csv, ele pega os dados da tabela desnormalizada e alimenta as tabelas de dimensões e logo em seguida já alimenta a nossa tabela fato, e então temos um data warehouse simples implementado.
