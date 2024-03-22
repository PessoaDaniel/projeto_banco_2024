create database if not exists cadastro_veiculos charset utf8mb4 collate utf8mb4_0900_ai_ci;
use cadastro_veiculos;
create table if not exists veiculo (
chassi varchar(30) primary key,
renavan varchar(25),
placa varchar(15),
cor varchar(15),
data_fabricacao date,
quilometragem int,
descricao text(500),
situacao enum('disponivel', 'indisponivel')
);
create table if not exists estado(
id int primary key,
nome varchar(255),
unidade_federativa varchar(2)
);
create table if not exists cidade(
id int primary key,
nome varchar(255),
estado_id int,
foreign key (estado_id) references estado(id)
);
create table if not exists endereco (
id int primary key,
logradouro varchar(255),
numero varchar(255),
bairro varchar(255),
complemento text(300),
cidade_id int,
foreign key (cidade_id) references cidade(id)
);
create table if not exists responsavel (
cpf varchar(15) primary key,
nome varchar(255),
data_nascimento date,
endereco_id int,
foreign key (endereco_id) references endereco(id)
);
create table if not exists telefone(
 id int primary key,
 telefone varchar(255),
 cpf_responsavel varchar(15),
 foreign key (cpf_responsavel) references responsavel(cpf)
);
create table if not exists marca(
codigo int primary key,
nome varchar(255)
);
create table if not exists modelo(
codigo int primary key,
preco float,
marca_id int,
foreign key (marca_id) references marca(codigo)
);
create table if not exists veiculo_modelo(
veiculo_chassi varchar(30),
codigo_modelo int,
foreign key (veiculo_chassi) references veiculo(chassi),
foreign key (codigo_modelo) references modelo(codigo)
);
create table if not exists historico(
id int primary key,
dataRegesitro datetime,
cpf_responsavel varchar(15),
chassi_veiculo varchar(30),
foreign key (cpf_responsavel) references responsavel(cpf),
foreign key (chassi_veiculo) references veiculo(chassi)
);
insert into veiculo 
   (chassi, renavan, placa, cor, data_fabricacao, quilometragem, descricao, situacao) 
values
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
    
insert 
	into estado (id, nome, unidade_federativa) 
values
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

insert into cidade (id, nome, estado_id)
values 
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
    
    insert into 
    endereco (id, logradouro, numero, bairro, complemento, cidade_id) 
    values
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
  insert into responsavel (cpf, nome, data_nascimento, endereco_id) 
  values 
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