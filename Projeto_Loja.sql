CREATE DATABASE Projeto_Loja;
USE Projeto_Loja;

CREATE TABLE clientes(
	idcliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	cliente VARCHAR(40),
	estado VARCHAR(2),
	sexo VARCHAR(1),
	status VARCHAR(20)
);

CREATE TABLE vendedores(
	idvendedor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nome VARCHAR(50)
);

CREATE TABLE produtos(
	idproduto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	produto VARCHAR (100),
	preco NUMERIC (10,2)
);

CREATE TABLE vendas(
	idvenda INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	data DATE,
	total NUMERIC (10,2),
	idvendedor INT NOT NULL,
	idcliente INT NOT NULL,
	INDEX fk_idvendedor_rel (idvendedor),
	INDEX fk_idcliente_rel (idcliente),
	CONSTRAINT fk_idvendedor FOREIGN KEY (idvendedor) REFERENCES  vendedores(idvendedor) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT fk_idcliente FOREIGN KEY (idcliente) REFERENCES clientes(idcliente) ON UPDATE NO ACTION ON DELETE NO ACTION
);

create table itensvenda(
	quantidade int,
	valorunitario numeric (10,2),
	valortotal numeric (10,2),
	desconto numeric (10,2),
	idproduto int,
	idvenda int,
	
	foreign key (idproduto) references produtos(idproduto),
	foreign key (idvenda) references vendas(idvenda)
	);	


select COUNT(*) FROM vendas 
LEFT JOIN vendedores ON (vendas.idvendedor = vendedores.idvendedor);

SELECT COUNT(*) FROM vendas WHERE total >6000; 

SELECT cliente,status FROM clientes ORDER BY cliente DESC,status;

SELECT cliente, sexo, status FROM clientes WHERE status IN ('Silver','Platinum');

SELECT cliente, sexo, status FROM clientes WHERE cliente LIKE '%AN%';

SELECT * FROM vendas WHERE total BETWEEN 6000 AND 9000;

SELECT nome,total FROM vendas, vendedores 
WHERE vendas.idvendedor = vendedores.idvendedor;


