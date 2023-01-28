CREATE TABLE cotaparlamentarinputdata (
  codlegislatura int DEFAULT NULL,
  datemissao text,
  idedocumento int DEFAULT NULL,
  idecadastro text,
  indtipodocumento int DEFAULT NULL,
  nucarteiraparlamentar text,
  nudeputadoid int DEFAULT NULL,
  nulegislatura int DEFAULT NULL,
  numano int DEFAULT NULL,
  numespecificacaosubcota int DEFAULT NULL,
  numlote int DEFAULT NULL,
  nummes int DEFAULT NULL,
  numparcela int DEFAULT NULL,
  numressarcimento text,
  numsubcota int DEFAULT NULL,
  sgpartido text,
  sguf text,
  txnomeparlamentar text,
  txtcnpjcpf text,
  txtdescricao text,
  txtdescricaoespecificacao text,
  txtfornecedor text,
  txtnumero text,
  txtpassageiro text,
  txttrecho text,
  vlrdocumento float DEFAULT NULL,
  vlrglosa float DEFAULT NULL,
  vlrliquido float DEFAULT NULL,
  vlrrestituicao text
);

CREATE TABLE dim_fornecedor (
    cpf_cnpj TEXT PRIMARY KEY,
    nome TEXT
);

CREATE TABLE dim_parlamentar (
    idParlamentar INT PRIMARY KEY,
    nome TEXT,
    uf TEXT
);

CREATE TABLE dim_candidatura (
	id SERIAL PRIMARY KEY,
   	codLegislatura INT,
    	idParlamentar INT,
    	siglaPartido TEXT,
    	anoLegislatura INTEGER,
	
	CONSTRAINT FK_candidatura_parlamentar FOREIGN KEY(idParlamentar)
        REFERENCES dim_parlamentar(idParlamentar)
);

CREATE TABLE dim_despesa (
    id SERIAL PRIMARY KEY,
    cpfCnpjFornecedor TEXT REFERENCES dim_fornecedor(cpf_cnpj) NOT NULL,
    idParlamentar INT REFERENCES dim_parlamentar(idParlamentar) NOT NULL,
    valorDocumento float,
    valorGlosa float,
    valorLiquido float,
    descricao TEXT,
    dataEmissao TEXT,
    anoDespesa INT,
);

CREATE TABLE fato_gastos (
    id SERIAL PRIMARY KEY,
	nomeParlamentar TEXT,
	uf TEXT,
    totalGastos float
);