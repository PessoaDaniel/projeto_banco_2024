
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
	INNER JOIN veiculo_modelo vm ON vm.codigo_modelo = m.codigo
	INNER JOIN veiculo v ON vm.veiculo_chassi = v.chassi
	WHERE v.chassi IN (veiculo1, veiculo2);
RETURN soma;

END


// DELIMITER ;

DELIMITER //

CREATE FUNCTION media_precos ()
RETURNS FLOAT DETERMINISTIC
BEGIN
DECLARE media FLOAT;
SELECT AVG(m.preco) INTO media FROM modelo m;

return media;

end;



// Delimiter ;