/* Comando de insercao de rows em cliente */

INSERT INTO cliente (        cpf,             nome,                     data_nascimento,  sexo,                         rua, numero , bairro       , cep       , email)
  SELECT           '01123367787', 'Joao Matheus'  , TO_DATE('30/03/1990', 'dd/mm/yyyy'), 'M'  , 'Rua do Sol'               , 30     , 'Santa Rosa' , '58417333', 'joaomatheus@email.com'   FROM dual
  UNION ALL SELECT '01213232323', 'Maria Joaquina', TO_DATE('20/10/1995', 'dd/mm/yyyy'), 'F'  , 'Avenida Almirante Barroso', 14     , 'Cruzeiro'   , '58433234', 'mariajoaquina@email.com' FROM dual
  UNION ALL SELECT '04343432223', 'Lucia Maria'   , TO_DATE('23/08/1980', 'dd/mm/yyyy'), 'F'  , 'Rua Sinha Alves'          , 92     , 'Liberdade'  , '58545234', 'luciamaria@email.com'    FROM dual
  UNION ALL SELECT '00000000004', 'Cliente 4'     , TO_DATE('23/08/2004', 'dd/mm/yyyy'), 'M'  , 'Rua do cliente 4'         , 4      , 'Bairro 4 '  , '00000004', 'cliente4@email.com'      FROM dual
  UNION ALL SELECT '00000000005', 'Cliente 5'     , TO_DATE('23/08/2005', 'dd/mm/yyyy'), 'F'  , 'Rua da cliente 5'         , 5      , 'Bairro 5 '  , '00000005', 'cliente5@email.com'      FROM dual
;

/* Comando de insercao de rows em dependente */

INSERT INTO dependente (          cpf,       titular,           nome             ,                          data_nasc)
  SELECT                '04738748878', '01213232323', 'Marina Luiza'             , TO_DATE('20/01/1998', 'dd/mm/yyyy') FROM dual
  UNION ALL SELECT      '12345623489', '01213232323', 'Mauro Souza'              , TO_DATE('10/10/1975', 'dd/mm/yyyy') FROM dual
  UNION ALL SELECT      '98712376545', '01123367787', 'Joao Luis'                , TO_DATE('26/08/1970', 'dd/mm/yyyy') FROM dual
  UNION ALL SELECT      '10000000004', '00000000004', 'Dependente 1 do Cliente 4', TO_DATE('26/08/2005', 'dd/mm/yyyy') FROM dual
  UNION ALL SELECT      '10000000005', '00000000004', 'Dependente 2 do Cliente 4', TO_DATE('26/08/2006', 'dd/mm/yyyy') FROM dual
;

/* Comando de insercao de rows em funcionários */

INSERT INTO funcionario (         cpf,           nome                   , salario    ,                      data_nasc    , funcao)
  SELECT                '20000000001', 'Funcionario 1 Marina Luiza'     ,     10.1   ,TO_DATE('20/01/1998', 'dd/mm/yyyy'), 'Carregador' FROM dual
  UNION ALL SELECT      '20000000002', 'Funcionario 2 Mauro Souza'      ,     11.2   ,TO_DATE('10/10/1975', 'dd/mm/yyyy'), 'Atendente'  FROM dual
  UNION ALL SELECT      '20000000003', 'Funcionario 3 Joao Luis'        ,     12.3   ,TO_DATE('26/08/1970', 'dd/mm/yyyy'), 'Caixa'      FROM dual
  UNION ALL SELECT      '20000000004', 'Funcionario 4'                  ,     13.4   ,TO_DATE('26/08/2005', 'dd/mm/yyyy'), 'Gerente'    FROM dual
  UNION ALL SELECT      '20000000005', 'Funcionario 5'                  ,     13.5   ,TO_DATE('26/08/2006', 'dd/mm/yyyy'), 'ADPT'       FROM dual
;

/* Comando de insercao de rows em Quarto */

INSERT INTO quarto ( id_quarto , numero,    tipo      , vista     , diaria )
  SELECT               1       ,   1   ,   'suite'    , 'topper'  , 4.2 FROM dual
  UNION ALL SELECT     2       ,   2   ,   'solteiro' , 'cool'    , 2.2 FROM dual
  UNION ALL SELECT     3       ,   3   ,   'suite'    , 'topper'  , 4.2 FROM dual
  UNION ALL SELECT     4       ,   4   ,   'solteiro' , 'ruim'    , 1.2 FROM dual
  UNION ALL SELECT     5       ,   5   ,   'suite'    , 'topper'  , 4.2 FROM dual
;

/* Comando de insercao de rows em servico */

INSERT INTO servico ( id_servico, valor)
  SELECT                1       , 25 FROM dual
  UNION ALL SELECT      2       , 30 FROM dual
  UNION ALL SELECT      3       , 10 FROM dual
  UNION ALL SELECT      4       , 36 FROM dual
  UNION ALL SELECT      5       , 50 FROM dual
;

/* Comando de insercao de rows em hospedagem */

INSERT INTO hospedagem (            data_inicio          ,                 data_fim           ,  cpf_cliente      , id_quarto )
  SELECT              TO_DATE('16/03/2017', 'dd/mm/yyyy'), TO_DATE('21/03/2017', 'dd/mm/yyyy'), '01123367787'     , 1 FROM dual
  UNION ALL SELECT    TO_DATE('16/03/2017', 'dd/mm/yyyy'), TO_DATE('21/03/2017', 'dd/mm/yyyy'), '01123367787'     , 2 FROM dual
  UNION ALL SELECT    TO_DATE('16/03/2017', 'dd/mm/yyyy'), TO_DATE('23/03/2017', 'dd/mm/yyyy'), '00000000004'     , 3 FROM dual
  UNION ALL SELECT    TO_DATE('16/03/2017', 'dd/mm/yyyy'), TO_DATE('24/03/2017', 'dd/mm/yyyy'), '00000000005'     , 4 FROM dual
  UNION ALL SELECT    TO_DATE('16/03/2017', 'dd/mm/yyyy'), TO_DATE('25/03/2017', 'dd/mm/yyyy'), '04343432223'     , 5 FROM dual
;


/* Comando de insercao de rows em avaliacao */

INSERT INTO avaliacao (id_servico, cpf_cliente, nota, comentario)
  SELECT 1, '01213232323', 8, NULL FROM dual
  UNION ALL SELECT 1, '04343432223', 5, NULL FROM dual
  UNION ALL SELECT 2, '01213232323', 10, NULL FROM dual
  UNION ALL SELECT 2, '01123367787', 7.5, NULL FROM dual

/* Comando de insercao de rows em frigobar */

INSERT INTO frigobar (id_frigobar)
  VALUES (1);

/* Comando de insercao de rows em produto */

INSERT INTO produto (id_produto, nome, descricao, valor, id_lavanderia, id_frigobar, id_rest, id_bar)
  VALUES (1, 'Queijo', 'Queijo Qualho', 8.00, NULL, 1, NULL, NULL);
