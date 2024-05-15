DELIMITER $$
	CREATE PROCEDURE cadastrar_veiculo (
		IN chassi VARCHAR (30),
		IN renavan VARCHAR(15),
		IN placa VARCHAR(15),
		IN cor VARCHAR(15),
		IN quilometragem INT,
		IN descricao	TEXT,
		IN situacao ENUM('disponivel', 'indisponivel')	 
	)
	BEGIN
		INSERT INTO  `veiculo` (
		chassi,
		renavan,
		placa,
		cor,
		quilometragem,
		descricao,
		situacao
		) VALUES (
		chassi,
		renavan,
		placa,
		cor,
		quilometragem,
		descricao,
		situacao
		);
	END $$ 
DELIMITER ; 

DELIMITER $$
	CREATE PROCEDURE buscar_telefone_responsavel(IN cpf VARCHAR(15), OUT telefone_r VARCHAR(255))
	BEGIN
		SELECT telefone INTO telefone_r  FROM telefone WHERE cpf_responsavel = cpf;
	END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cadastrar_modelo(INOUT  preco_m FLOAT)
BEGIN
	SET @id_m = 0;
	SELECT codigo INTO @id_m FROM modelo ORDER BY codigo DESC LIMIT 1;
	INSERT INTO modelo (codigo, preco) VALUES (@id_m + 1, preco_m); 
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE 
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE cadastrar_marca_10_1(
IN  nome1 VARCHAR(255),
IN  nome2 VARCHAR(255),
IN  nome3 VARCHAR(255),
IN  nome4 VARCHAR(255),
IN  nome5 VARCHAR(255),
IN  nome6 VARCHAR(255),
IN  nome7 VARCHAR(255),
IN  nome8 VARCHAR(255),
IN  nome9 VARCHAR(255),
IN  nome10 VARCHAR(255)
)
BEGIN
	SET @id_marca = 0;
	SELECT codigo INTO @id_marca FROM marca ORDER BY codigo DESC LIMIT 1;
	INSERT INTO marca(codigo, nome, modelo_id) VALUES 
	(@id_m + 1, nome1, 1),
	(@id_m + 2, nome2, 1),
	(@id_m + 3, nome3, 1),
	(@id_m + 4, nome4, 1),
	(@id_m + 5, nome5, 1),
	(@id_m + 6, nome6, 1),
	(@id_m + 7, nome7, 1),
	(@id_m + 8, nome8, 1),
	(@id_m + 9, nome9, 1),	
	(@id_m + 10, nome10, 1); 
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE 
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE contar_veiculos(OUT qtd INT)
BEGIN
SELECT COUNT(*) INTO qtd FROM veiculo;
END $$
DELIMITER ;

/*call  cadastrar_veiculo('dadas5454', '45454444454', 'xxxx1544',  '0xff000000', 10, 'palio novo', 'disponivel');*/

/*SET @telefone = '';
CALL buscar_telefone_responsavel('12345678901', @telefone);
SELECT @telefone; */

/*set @preco_modelo = 3200;
call cadastrar_modelo(@preco_modelo); */

/*call  cadastrar_marca_10_1(
'mol1',
'mol2',
'mol3',
'mol4',
'mol5',
'mol6',
'mol7',
'mol8',
'mol9',
'mol10'
);*/

/*set @qtd_veiculos = 0;
call  contar_veiculos(@qtd_veiculos);
select @qtd_veiculos;*/
