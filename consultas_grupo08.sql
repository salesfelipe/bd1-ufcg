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

CREATE OR REPLACE VIEW func_funcionarios_rest as
  SELECT funcao FROM restaurante
    LEFT OUTER JOIN servico_prestado ON restaurante.id_rest = servico_prestado.id_servico
    LEFT OUTER JOIN funcionario ON servico_prestado.cpf_func = funcionario.cpf
;

/* Q06 */

SELECT DISTINCT (f.cpf), f.nome, f.salario, f.data_nasc, f.funcao FROM funcionario f
JOIN (
       SELECT * FROM servico_prestado sp
       JOIN (
               SELECT * FROM servico s
               JOIN bar b
               ON b.id_bar = s.id_servico
            ) sb
       ON sp.id_servico = sb.id_servico
     ) spb
ON f.cpf = spb.cpf_func AND f.salario >= 3000

/* Q07 */

SELECT COUNT(DISTINCT c.cpf) FROM cliente c
INNER JOIN dependente d
ON c.cpf = d.titular AND c.sexo='F';

/* Q08 */

SELECT * FROM reserva
WHERE data_inicio = (
  SELECT MIN(data_inicio) FROM (SELECT * FROM reserva)
);

/* Q09 */

SELECT COUNT(DISTINCT r.id_quarto) FROM reserva r
INNER JOIN quarto q
ON q.id_quarto = r.id_quarto AND q.tipo = 'solteiro' AND EXTRACT(YEAR FROM r.data_inicio) = EXTRACT(YEAR FROM sysdate)

/* Q10 */

SELECT * FROM cliente c
JOIN hospedagem h
ON h.cpf_cliente = c.cpf
WHERE c.data_nascimento = (
  SELECT MAX(data_nascimento) FROM (SELECT * FROM cliente JOIN hospedagem ON cpf_cliente = cpf)
);

/* Q11 */

SELECT * FROM produto WHERE id_lavanderia IS NOT NULL AND nome LIKE '%Agua%';

/* Q12 */

SELECT * FROM (SELECT * FROM venda LEFT OUTER JOIN produto ON venda.id_produto = produto.id_produto WHERE produto.id_rest IS NOT NULL ORDER BY data ASC) WHERE ROWNUM <=1;


/* Q13 */

SELECT COUNT (DISTINCT c.cpf) FROM cliente c
INNER JOIN avaliacao a
ON a.cpf_cliente = c.cpf AND c.sexo = 'F'

/* Q14 */

SELECT nota
FROM avaliacao
ORDER BY nota ASC
