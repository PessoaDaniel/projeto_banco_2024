
DELIMITER //

CREATE FUNCTION consultar_renavan (chassi_veiculo VARCHAR(45))
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	DECLARE renavan_n VARCHAR (25);
        
SELECT renavan INTO renavan_n FROM veiculo v WHERE v.chassi = chassi_veiculo;

RETURN renavan_n;

END;


// DELIMITER ;


DELIMITER //

CREATE FUNCTION somar_precos (veiculo1 VARCHAR(45) , veiculo2 VARCHAR(45))
RETURNS FLOAT DETERMINISTIC
BEGIN
	DECLARE soma FLOAT;
	SELECT SUM(m.preco) INTO soma FROM modelo m 
	inner join veiculo_modelo vm on vm.codigo_modelo = m.codigo
	inner join veiculo v on vm.veiculo_chassi = v.chassi
	where v.chassi in (veiculo1, veiculo2);
return soma;

end


// Delimiter ;

Delimiter //

create function media_precos ()
returns float deterministic
begin
declare media float;
select avg(m.preco) into media from modelo m;

return media;

end;



// Delimiter ;