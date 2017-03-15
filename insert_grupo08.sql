/* Comando de insercao de rows em cliente */

INSERT INTO cliente (cpf, nome, data_nascimento, sexo, rua, numero, bairro, cep, email)
  SELECT '01123367787', 'Joao Matheus', TO_DATE('30/03/1990', 'dd/mm/yyyy'), 'M', 'Rua do Sol', 30, 'Santa Rosa', '58417333', 'joaomatheus@email.com' FROM dual
  UNION ALL SELECT '01213232323', 'Maria Joaquina', TO_DATE('20/10/1995', 'dd/mm/yyyy'), 'F', 'Avenida Almirante Barroso', 14, 'Cruzeiro', '58433234', 'mariajoaquina@email.com' FROM dual
  UNION ALL SELECT '04343432223', 'Lucia Maria', TO_DATE('23/08/1980', 'dd/mm/yyyy'), 'F', 'Rua Sinha Alves', 92, 'Liberdade', '58545234', 'luciamaria@email.com' FROM dual

/* Comando de insercao de rows em dependente */

INSERT INTO dependente (cpf, titular, nome, data_nasc)
  SELECT '04738748878', '01213232323', 'Marina Luiza', TO_DATE('20/01/1998', 'dd/mm/yyyy') FROM dual
  UNION ALL SELECT '12345623489', '01213232323', 'Mauro Souza', TO_DATE('10/10/1975', 'dd/mm/yyyy') FROM dual
  UNION ALL SELECT '98712376545', '01123367787', 'Joao Luis', TO_DATE('26/08/1970', 'dd/mm/yyyy') FROM dual

/* Comando de insercao de rows em servico */

INSERT INTO servico (id_servico, valor)
  SELECT 1, 25 FROM dual
  UNION ALL SELECT 2, 30 FROM dual
  UNION ALL SELECT 3, 10 FROM dual
  UNION ALL SELECT 4, 36 FROM dual

/* Comando de insercao de rows em frigobar */

INSERT INTO frigobar (id_frigobar)
  VALUES (1);

/* Comando de insercao de rows em produto */

INSERT INTO produto (id_produto, nome, descricao, valor, id_lavanderia, id_frigobar, id_rest, id_bar)
  VALUES (1, 'Queijo', 'Queijo Qualho', 8.00, NULL, 1, NULL, NULL);
