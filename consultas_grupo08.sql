SELECT COUNT(DISTINCT c.cpf) FROM cliente c
INNER JOIN dependente d
ON c.cpf = d.titular AND c.sexo='F'
