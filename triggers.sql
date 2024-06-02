DELIMITER //
	CREATE TRIGGER update_status_veiculo AFTER INSERT ON historico
	FOR EACH ROW
	BEGIN 
	UPDATE veiculo SET situacao = CASE
	WHEN situacao = 'disponivel' THEN 'indisponivel'
	WHEN situacao = 'indisponivel' THEN 'disponivel' 	
	END
	WHERE chassi = new.chassi_veiculo;
	END // 
DELIMITER ;