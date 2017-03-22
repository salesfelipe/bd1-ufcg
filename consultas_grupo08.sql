/* Q01 */
SELECT id_frigobar, COUNT(DISTINCT id_produto) AS numeroProdutos FROM produto WHERE id_frigobar IS NOT NULL GROUP BY id_frigobar;

/* Q02 */

SELECT nome FROM hospedagem h
JOIN cliente c ON h.cpf_cliente = c.cpf
JOIN quarto q ON q.id_quarto = h.id_quarto WHERE q.diaria = (SELECT MIN(diaria) FROM quarto);

/* Q03 */

CREATE OR REPLACE VIEW equipamentos as SELECT equipamento FROM equipamento;

/* Q04 */

SELECT id_servico, media FROM
  (
    SELECT id_servico,
      (
        SELECT AVG(nota) FROM avaliacao WHERE id_servico = a.id_servico GROUP BY id_servico
      )
    as media FROM avaliacao a GROUP BY id_servico
  )
WHERE media =
  (
    SELECT MIN(media) FROM
      (
        SELECT id_servico,
          (
            SELECT AVG(nota) FROM avaliacao WHERE id_servico = av.id_servico GROUP BY id_servico
          )
        as media FROM avaliacao av GROUP BY id_servico
      )
  )
;

/* Q05 */

CREATE OR REPLACE VIEW funcao_funcionarios_restaurante as
  SELECT funcao FROM restaurante
    LEFT OUTER JOIN servico_prestado ON restaurante.id_rest = servico_prestado.id_servico
    LEFT OUTER JOIN funcionario ON servico_prestado.cpf_func = funcionario.cpf
;

/* Q08 */

SELECT COUNT(DISTINCT c.cpf) FROM cliente c
INNER JOIN dependente d
ON c.cpf = d.titular AND c.sexo='F';

/* Q10 */

SELECT COUNT(DISTINCT r.id_quarto) FROM reserva r
INNER JOIN quarto q
ON q.id_quarto = r.id_quarto AND q.tipo = 'solteiro' AND EXTRACT(YEAR FROM r.data_inicio) = EXTRACT(YEAR FROM sysdate)

/* Q11 */

SELECT * FROM cliente c
JOIN hospedagem h
ON h.cpf_cliente = c.cpf
WHERE c.data_nascimento = (
  SELECT MAX(data_nascimento) FROM (SELECT * FROM cliente JOIN hospedagem ON cpf_cliente = cpf)
);

/* Q14 */

SELECT COUNT (DISTINCT c.cpf) FROM cliente c
INNER JOIN avaliacao a
ON a.cpf_cliente = c.cpf AND c.sexo = 'F'

/* Q15 */

SELECT nota
FROM avaliacao
ORDER BY nota ASC
