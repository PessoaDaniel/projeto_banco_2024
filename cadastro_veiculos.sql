create database if not exists cadastro_veiculos charset utf8mb4 collate utf8mb4_0900_ai_ci;
use cadastro_veiculos;
create table if not exists veiculo (
chassi varchar(30) primary key,
renavan int,
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
complemento text(300),
cidade_id int,
foreign key (cidade_id) references cidade(id)
);
create table if not exists responsavel (
cpf int(15) primary key,
nome varchar(255),
data_nascimento date,
endereco_id int,
foreign key (endereco_id) references endereco(id)
);
create table if not exists telefone(
 id int primary key,
 telefone varchar(255),
 cpf_responsavel int(15),
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
create table historico(
id int primary key,
dataRegesitro datetime,
cpf_responsavel int,
chassi_veiculo varchar(30),
foreign key (cpf_responsavel) references responsavel(cpf),
foreign key (chassi_veiculo) references veiculo(chassi)
);