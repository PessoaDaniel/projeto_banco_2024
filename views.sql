SELECT e.nome FROM estado e;
select rs.nome, rs.cpf, rs.data_nascimento from responsavel rs;


select c.nome as 'cidade', e.bairro  as 'bairro', es.nome as 'estado', es.unidade_federativa as 'UF' 
from endereco e 
 inner join cidade c on c.id = e.cidade_id
 inner join estado es on es.id = c.estado_id;

 
 select v.placa as 'Placa veículo', h.cpf_responsavel 'CPF do contratante', v.descricao as 'Descricao veículo', r.nome  as 'Nome do contratante'
 from veiculo v 
 inner join historico h on v.chassi = h.chassi_veiculo 
 inner join responsavel r on r.cpf = h.cpf_responsavel;

 
 select v.descricao as "Veículo", placa as 'Placa Veículo', m.codigo  as 'Código Modelo' from veiculo v 
 inner join veiculo_modelo vm on vm.veiculo_chassi = v.chassi
  inner join modelo m on m.codigo = vm.codigo_modelo;

  
  create view view_1 as 
  select h.*, v.descricao from historico h
  inner join veiculo v on v.chassi = h.chassi_veiculo
  where h.dataRegesitro between '2022-01-01' and '2024-10-10';

  
  create view view_2 as 
  select date_format(dataRegesitro, '%d de %M de %Y') as 'data_aluguel',
  r.nome as 'Responsável'
  from historico h inner join responsavel r on h.cpf_responsavel = r.cpf where h.dataRegesitro between '2022-01-01' and '2024-10-10';

  
  create view view_3 as 
  select  upper(r.nome) as 'cliente', t.telefone as 'telefone_contato' 
  from responsavel r inner join telefone t on t.cpf_responsavel = r.cpf;  