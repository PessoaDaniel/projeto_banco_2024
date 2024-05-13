CREATE DATABASE IF NOT EXISTS cadastro_veiculos CHARSET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE cadastro_veiculos;
CREATE TABLE IF NOT EXISTS veiculo (
chassi VARCHAR(30) PRIMARY KEY,
renavan VARCHAR(25),
placa VARCHAR(15),
cor VARCHAR(15),
data_fabricacao DATE,
quilometragem INT,
descricao TEXT(500),
situacao ENUM('disponivel', 'indisponivel')
);
CREATE TABLE IF NOT EXISTS estado(
id INT PRIMARY KEY,
nome VARCHAR(255),
unidade_federativa VARCHAR(2)
);
CREATE TABLE IF NOT EXISTS cidade(
id INT PRIMARY KEY,
nome VARCHAR(255),
estado_id INT,
FOREIGN KEY (estado_id) REFERENCES estado(id)
);
CREATE TABLE IF NOT EXISTS endereco (
id INT PRIMARY KEY,
logradouro VARCHAR(255),
numero VARCHAR(255),
bairro VARCHAR(255),
complemento TEXT(300),
cidade_id INT,
FOREIGN KEY (cidade_id) REFERENCES cidade(id)
);
CREATE TABLE IF NOT EXISTS responsavel (
cpf VARCHAR(15) PRIMARY KEY,
nome VARCHAR(255),
data_nascimento DATE,
endereco_id INT,
FOREIGN KEY (endereco_id) REFERENCES endereco(id)
);
CREATE TABLE IF NOT EXISTS telefone(
 id INT PRIMARY KEY,
 telefone VARCHAR(255),
 cpf_responsavel VARCHAR(15),
 FOREIGN KEY (cpf_responsavel) REFERENCES responsavel(cpf)
);
CREATE TABLE IF NOT EXISTS modelo(
codigo INT PRIMARY KEY,
preco FLOAT
);
CREATE TABLE IF NOT EXISTS marca(
codigo INT PRIMARY KEY,
nome VARCHAR(255),
modelo_id INT, 
FOREIGN KEY (modelo_id) REFERENCES modelo(codigo)
);
CREATE TABLE IF NOT EXISTS veiculo_modelo(
veiculo_chassi VARCHAR(30),
codigo_modelo INT,
FOREIGN KEY (veiculo_chassi) REFERENCES veiculo(chassi),
FOREIGN KEY (codigo_modelo) REFERENCES modelo(codigo)
);
CREATE TABLE IF NOT EXISTS historico(
dataRegesitro DATETIME,
cpf_responsavel VARCHAR(15),
chassi_veiculo VARCHAR(30) PRIMARY KEY,
FOREIGN KEY (cpf_responsavel) REFERENCES responsavel(cpf),
FOREIGN KEY (chassi_veiculo) REFERENCES veiculo(chassi)
);
INSERT INTO veiculo 
   (chassi, renavan, placa, cor, data_fabricacao, quilometragem, descricao, situacao) 
VALUES
	('Z9A3B7Y6M2P1Q8R5', 12345678901, 'ABC1234', '0xff112233', '2005-08-15', 123, 'Lorem ipsum dolor sit amet', 'disponivel'),
    ('ABC123456789', '12345678901', 'ABC1234', '0xff112233', '2005-08-15', 123, 'Lorem ipsum dolor sit amet', 'disponivel'),
    ('XYZ234567890', '23456789012', 'XYZ9876', '0xff445566', '1999-11-23', 456, 'Lorem ipsum', 'indisponivel'),
    ('DEF345678901', '34567890123', 'DEF5432', '0xff778899', '2012-04-30', 789, 'Lorem ipsum dolor', 'disponivel'),
    ('GHI456789012', '45678901234', 'GHI6789', '0xffaabbcc', '1985-07-10', 234, 'Lorem ipsum dolor sit', 'indisponivel'),
    ('JKL567890123', '56789012345', 'JKL9876', '0xffddeeff', '2019-10-05', 567, 'Lorem ipsum dolor sit amet', 'disponivel'),
    ('MNO678901234', '67890123456', 'MNO6543', '0xff001122', '2000-12-20', 890, 'Lorem ipsum dolor sit', 'indisponivel'),
    ('PQR789012345', '78901234567', 'PQR7654', '0xff334455', '1993-06-28', 123, 'Lorem ipsum', 'disponivel'),
    ('STU890123456', '89012345678', 'STU8765', '0xff667788', '2007-03-17', 456, 'Lorem ipsum dolor', 'indisponivel'),
    ('VWX901234567', '90123456789', 'VWX5432', '0xff99aabb', '2015-08-03', 789, 'Lorem ipsum dolor sit amet', 'disponivel'),
    ('YZA012345678', '21098765432', 'YZA9876', '0xffccddee', '1998-09-12', 234, 'Lorem ipsum', 'indisponivel'),
    ('BCD123456789', '32109876543', 'BCD7654', '0xff445566', '2002-11-05', 567, 'Lorem ipsum dolor sit', 'disponivel'),
    ('EFG234567890', '43210987654', 'EFG8765', '0xff778899', '2011-04-15', 890, 'Lorem ipsum dolor sit', 'indisponivel'),
    ('HIJ345678901', '54321098765', 'HIJ6543', '0xffaabbcc', '1987-07-25', 123, 'Lorem ipsum', 'disponivel'),
    ('KLM456789012', '65432109876', 'KLM5432', '0xffddeeff', '2023-10-30', 456, 'Lorem ipsum dolor', 'indisponivel');
    
INSERT 
	INTO estado (id, nome, unidade_federativa) 
VALUES
(1, 'Acre', 'AC'),
(2, 'Alagoas', 'AL'),
(3, 'Amapá', 'AP'),
(4, 'Amazonas', 'AM'),
(5, 'Bahia', 'BA'),
(6, 'Ceará', 'CE'),
(7, 'Distrito Federal', 'DF'),
(8, 'Espírito Santo', 'ES'),
(9, 'Goiás', 'GO'),
(10, 'Maranhão', 'MA'),
(11, 'Mato Grosso', 'MT'),
(12, 'Mato Grosso do Sul', 'MS'),
(13, 'Minas Gerais', 'MG'),
(14, 'Pará', 'PA'),
(15, 'Paraíba', 'PB'),
(16, 'Paraná', 'PR'),
(17, 'Pernambuco', 'PE'),
(18, 'Piauí', 'PI'),
(19, 'Rio de Janeiro', 'RJ'),
(20, 'Rio Grande do Norte', 'RN'),
(21, 'Rio Grande do Sul', 'RS'),
(22, 'Rondônia', 'RO'),
(23, 'Roraima', 'RR'),
(24, 'Santa Catarina', 'SC'),
(25, 'São Paulo', 'SP'),
(26, 'Sergipe', 'SE'),
(27, 'Tocantins', 'TO');

INSERT INTO cidade (id, nome, estado_id)
VALUES 
    (1, 'ABREU E LIMA', 17),
    (2, 'AFRÂNIO', 17),
    (3, 'AGRESTINA', 17),
    (4, 'ÁGUA PRETA', 17),
    (5, 'ÁGUAS BELAS', 17),
    (6, 'ALAGOINHA', 17),
    (7, 'ALIANÇA', 17),
    (8, 'ALTINHO', 17),
    (9, 'AMARAJI', 17),
    (10, 'ANGELIM', 17),
    (11, 'ARARIPINA', 17),
    (12, 'ARCOVERDE', 17),
    (13, 'BARRA DE GUABIRABA', 17),
    (14, 'BARRA DE SÃO MIGUEL', 17),
    (15, 'BELÉM DE MARIA', 17),
    (16, 'BELÉM DE SÃO FRANCISCO', 17),
    (17, 'BELO JARDIM', 17),
    (18, 'BETÂNIA', 17),
    (19, 'BEZERROS', 17),
    (20, 'BODOCÓ', 17),
    (21, 'BOM CONSELHO', 17),
    (22, 'BOM JARDIM', 17),
    (23, 'BONITO', 17),
    (24, 'BREJÃO', 17),
    (25, 'BREJINHO', 17),
    (26, 'BREJO DA MADRE DE DEUS', 17),
    (27, 'BUENOS AIRES', 17),
    (28, 'BUIQUE', 17),
    (29, 'CABO DE SANTO AGOSTINHO', 17),
    (30, 'CABROBÓ', 17),
    (31, 'CACHOEIRINHA', 17),
    (32, 'CAETÉS', 17),
    (33, 'CALÇADO', 17),
    (34, 'CALUMBI', 17),
    (35, 'CAMARAGIBE', 17),
    (36, 'CAMOCIM DE SÃO FÉLIX', 17),
    (37, 'CAMUTANGA', 17),
    (38, 'CANHOTINHO', 17),
    (39, 'CAPOEIRAS', 17),
    (40, 'CARNAÍBA', 17),
    (41, 'CARNAUBEIRA DA PENHA', 17),
    (42, 'CARPINA', 17),
    (43, 'CARUARU', 17),
    (44, 'CASINHAS', 17),
    (45, 'CATENDE', 17),
    (46, 'CEDRO', 17),
    (47, 'CHA GRANDE', 17),
    (48, 'CHA DE ALEGRIA', 17),
    (49, 'CHA DE CRUZES', 17),
    (50, 'CONDADO', 17);
    
    INSERT INTO 
    endereco (id, logradouro, numero, bairro, complemento, cidade_id) 
    VALUES
    (1, 'Rua da Aurora', '123', 'Bairro das Flores', 'Apartamento 101', 35),
    (2, 'Avenida Recife', '456', 'Bairro do Recife', 'Casa Azul', 43),
    (3, 'Rua do Futuro', '789', 'Bairro da Esperança', 'Sobrado', 43),
    (4, 'Travessa da Alegria', '321', 'Bairro da Alegria', 'Edifício Primavera', 25),
    (5, 'Rua das Flores', '654', 'Bairro das Rosas', 'Casa Amarela', 18),
    (6, 'Avenida Boa Viagem', '987', 'Bairro de Boa Viagem', 'Bloco B', 29),
    (7, 'Rua dos Palmares', '111', 'Bairro dos Palmares', 'Condomínio Sol Nascente', 47),
    (8, 'Avenida Caxangá', '222', 'Bairro da Caxangá', 'Casa Verde', 37),
    (9, 'Rua do Sol', '333', 'Bairro do Sol', 'Casa Branca', 23),
    (10, 'Travessa do Amor', '444', 'Bairro do Amor', 'Apartamento do Amor', 40),
    (11, 'Avenida Conde da Boa Vista', '555', 'Bairro da Boa Vista', 'Condomínio Monte Verde', 43),
    (12, 'Rua da Esperança', '666', 'Bairro da Esperança', 'Casa do Sol', 36),
    (13, 'Rua do Progresso', '777', 'Bairro do Progresso', 'Casa da Montanha', 44),
    (14, 'Avenida Guararapes', '888', 'Bairro dos Guararapes', 'Casa da Praia', 43),
    (15, 'Rua da Paz', '999', 'Bairro da Paz', 'Condomínio Portal da Paz', 19),
    (16, 'Avenida Agamenon Magalhães', '1010', 'Bairro da Magalhães', 'Casa da Colina', 43),
    (17, 'Rua do Recanto', '1111', 'Bairro do Recanto', 'Casa do Lago', 42),
    (18, 'Travessa da Saudade', '1212', 'Bairro da Saudade', 'Condomínio da Saudade', 27),
    (19, 'Avenida Kennedy', '1313', 'Bairro Kennedy', 'Casa do Bosque', 43),
    (20, 'Rua da Liberdade', '1414', 'Bairro da Liberdade', 'Casa dos Sonhos', 15),
    (21, 'Rua do Encanto', '1515', 'Bairro do Encanto', 'Edifício do Encanto', 8),
    (22, 'Avenida 15 de Novembro', '1616', 'Bairro 15 de Novembro', 'Casa da Felicidade', 43),
    (23, 'Travessa da Felicidade', '1717', 'Bairro da Felicidade', 'Casa da Alegria', 3),
    (24, 'Rua do Sorriso', '1818', 'Bairro do Sorriso', 'Casa do Arco-Íris', 11),
    (25, 'Avenida do Amor', '1919', 'Bairro do Amor', 'Casa do Coração', 1),
    (26, 'Rua da Amizade', '2020', 'Bairro da Amizade', 'Casa da Amizade', 43),
    (27, 'Rua das Estrelas', '2121', 'Bairro das Estrelas', 'Casa da Lua', 43),
    (28, 'Avenida da Harmonia', '2222', 'Bairro da Harmonia', 'Casa da Harmonia', 9),
    (29, 'Rua da Serenidade', '2323', 'Bairro da Serenidade', 'Casa da Serenidade', 22),
    (30, 'Travessa da Tranquilidade', '2424', 'Bairro da Tranquilidade', 'Casa da Tranquilidade', 43),
    (31, 'Avenida da Esperança', '2525', 'Bairro da Esperança', 'Casa da Esperança', 21),
    (32, 'Rua da Felicidade', '2626', 'Bairro da Felicidade', 'Casa da Felicidade', 16),
    (33, 'Rua da Harmonia', '2727', 'Bairro da Harmonia', 'Casa da Harmonia', 7),
    (34, 'Avenida da Amizade', '2828', 'Bairro da Amizade', 'Casa da Amizade', 43),
    (35, 'Rua da Tranquilidade', '2929', 'Bairro da Tranquilidade', 'Casa da Tranquilidade', 43),
    (36, 'Travessa da Paz', '3030', 'Bairro da Paz', 'Casa da Paz', 43),
    (37, 'Avenida do Progresso', '3131', 'Bairro do Progresso', 'Casa do Progresso', 20),
    (38, 'Rua da União', '3232', 'Bairro da União', 'Casa da União', 43),
    (39, 'Rua do Equilíbrio', '3333', 'Bairro do Equilíbrio', 'Casa do Equilíbrio', 43),
    (40, 'Travessa da Solidariedade', '3434', 'Bairro da Solidariedade', 'Casa da Solidariedade', 43),
    (41, 'Avenida da Prosperidade', '3535', 'Bairro da Prosperidade', 'Casa da Prosperidade', 28),
    (42, 'Rua da Felicidade', '3636', 'Bairro da Felicidade', 'Casa da Felicidade', 43),
    (43, 'Rua do Progresso', '3737', 'Bairro do Progresso', 'Casa do Progresso', 43),
    (44, 'Travessa da Esperança', '3838', 'Bairro da Esperança', 'Casa da Esperança', 43),
    (45, 'Avenida da Paz', '3939', 'Bairro da Paz', 'Casa da Paz', 6);
  INSERT INTO responsavel (cpf, nome, data_nascimento, endereco_id) 
  VALUES 
  (12345678901, 'Monkey D. Luffy', '1997-05-05', 1),
    (23456789012, 'Roronoa Zoro', '1997-11-11', 2),
    (34567890123, 'Nami', '1998-07-03', 3),
    (45678901234, 'Usopp', '1998-04-01', 4),
    (56789012345, 'Sanji', '1997-03-02', 5),
    (67890123456, 'Tony Tony Chopper', '1999-12-24', 6),
    (78901234567, 'Nico Robin', '1998-02-06', 7),
    (89012345678, 'Franky', '1998-08-30', 8),
    (90123456789, 'Brook', '1997-09-03', 9),
    (10234567890, 'Portgas D. Ace', '1997-01-01', 10),
    (12345678910, 'Naruto Uzumaki', '1999-10-10', 11),
    (23456789101, 'Sasuke Uchiha', '1999-07-23', 12),
    (34567891012, 'Sakura Haruno', '1999-03-28', 13),
    (45678910123, 'Kakashi Hatake', '1998-09-15', 14),
    (56789101234, 'Goku', '1979-04-16', 15);
    
    INSERT INTO telefone (id, telefone, cpf_responsavel)
    VALUES
	(1, '+5599988776655', 12345678901),
    (2, '+5599887766554', 23456789012),
    (3, '+5599776655443', 34567890123),
    (4, '+5599665544332', 45678901234),
    (5, '+5599554433221', 56789012345),
    (6, '+5599443322110', 67890123456),
    (7, '+5599332211009', 78901234567),
    (8, '+5599221100998', 89012345678),
    (9, '+5599110099887', 90123456789),
    (10, '+5599009988776', 10234567890);
    
    
    INSERT INTO marca (codigo, nome) VALUES
    (1, 'Toyota'),
    (2, 'Honda'),
    (3, 'Ford'),
    (4, 'Chevrolet'),
    (5, 'Volkswagen');
    
    INSERT INTO modelo (codigo, preco) VALUES
    (1, 35000.0),
    (2, 28000.0),
    (3, 40000.0),
    (4, 32000.0),
    (5, 30000.0),
    (6, 38000.0),
    (7, 26000.0),
    (8, 42000.0),
    (9, 34000.0),
    (10, 32000.0);
    
    INSERT INTO veiculo_modelo (veiculo_chassi, codigo_modelo) VALUES
    ('Z9A3B7Y6M2P1Q8R5', 1),
    ('ABC123456789', 2),
    ('XYZ234567890', 3),
    ('DEF345678901', 4),
    ('GHI456789012', 5),
    ('JKL567890123', 6),
    ('MNO678901234', 7),
    ('PQR789012345', 8),
    ('STU890123456', 9),
    ('VWX901234567', 10),
    ('YZA012345678', 1),
    ('BCD123456789', 2),
    ('EFG234567890', 3),
    ('HIJ345678901', 4),
    ('KLM456789012', 5);
    
INSERT INTO historico (dataRegesitro, cpf_responsavel, chassi_veiculo)
VALUES
    ('2024-01-01 08:00:00', '12345678901', 'Z9A3B7Y6M2P1Q8R5'),
    ( '2024-01-02 10:30:00', '23456789012', 'ABC123456789'),
    ('2024-01-03 13:15:00', '34567890123', 'XYZ234567890'),
    ('2024-01-04 15:45:00', '45678901234', 'DEF345678901'),
    ('2024-01-05 17:20:00', '56789012345', 'GHI456789012');

    