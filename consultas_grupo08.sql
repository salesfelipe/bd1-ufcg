/* Q08 */

SELECT COUNT(DISTINCT c.cpf) FROM cliente c
INNER JOIN dependente d
ON c.cpf = d.titular AND c.sexo='F';

/* Q11 */

SELECT * FROM cliente c
JOIN hospedagem h
ON h.cpf_cliente = c.cpf
WHERE c.data_nascimento = (
  SELECT MAX(data_nascimento) FROM (SELECT * FROM cliente JOIN hospedagem ON cpf_cliente = cpf)
);

/* Q15 */

SELECT nota
FROM avaliacao
ORDER BY nota ASC
