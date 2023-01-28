INSERT INTO dim_fornecedor(cpf_cnpj,nome)
SELECT txtcnpjcpf, MIN(txtfornecedor) as txtfornecedor
FROM cotaparlamentarinputdata
GROUP BY txtcnpjcpf;

INSERT INTO dim_parlamentar(idParlamentar,nome, uf)
SELECT nudeputadoid, txnomeparlamentar, sguf 
FROM cotaparlamentarinputdata
GROUP BY nudeputadoid, txnomeparlamentar, sguf;

INSERT INTO dim_candidatura(codLegislatura,idParlamentar, siglaPartido, anoLegislatura)
SELECT codlegislatura, nudeputadoid, sgpartido, nulegislatura 
FROM cotaparlamentarinputdata
GROUP BY nulegislatura, codlegislatura, nudeputadoid, sgpartido;


INSERT INTO dim_despesa(cpfCnpjFornecedor,idParlamentar, valorDocumento, valorGlosa, valorLiquido, descricao, dataEmissao, anoDespesa)
SELECT txtcnpjcpf,nudeputadoid,vlrdocumento,vlrglosa,vlrliquido,txtdescricao,datemissao, numano 
FROM cotaparlamentarinputdata;

INSERT INTO fato_gastos(nomeParlamentar,uf, totalGastos)
SELECT p.nome, p.uf, SUM(d.valorDocumento)
FROM dim_despesa d
INNER JOIN dim_parlamentar p
ON d.idParlamentar = p.idParlamentar
GROUP BY p.nome, p.uf
ORDER BY SUM(d.valorDocumento) DESC;
