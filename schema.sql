/* Arquivo de criação das entidades principais do sistema! */

CREATE TABLE cliente
(
         cpf                                            CHAR(11) NOT NULL,
         Nome                                           VARCHAR(100) NOT NULL,
         data_nascimento                                DATE NOT NULL,
         sexo                                           CHAR NOT NULL,
         email                                          VARCHAR(25) NOT NULL,
         rua                                            VARCHAR(50) NOT NULL,
         numero                                         VARCHAR(10) NOT NULL,
         bairro                                         VARCHAR(20) NOT NULL,
         cep                                            CHAR (8),
         PRIMARY KEY ( cpf )
);

CREATE TABLE  dependente
(
         cpf                                            CHAR(11) NOT NULL,
         nome                                           VARCHAR(100) NOT NULL,
         data_nascimento                                DATE NOT NULL,
         cpf_cliente                                    CHAR (11) NOT NULL,
         FOREIGN KEY ( cpf_cliente )                    REFERENCES  cliente ( cpf ),
         PRIMARY KEY ( cpf )
);

CREATE TABLE  funcionario
(
         cpf                                           CHAR(11) NOT NULL,
         nome                                          VARCHAR(100) NOT NULL,
         data_nascimento                               DATE NOT NULL,
         funcao                                        VARCHAR(100) NOT NULL,
         salario                                       NUMBER(8,2) NOT NULL,
         PRIMARY KEY ( cpf )
);

CREATE TABLE  quarto
(
          quarto_id                                    NUMBER NOT NULL,
          numero                                       VARCHAR(4)  NOT NULL,
          tipo                                         VARCHAR(25) NOT NULL,
          vista                                        VARCHAR(25) NOT NULL,
          equipamentos                                 VARCHAR(150) NOT NULL,
          diaria                                       NUMBER(8,2) NOT NULL,
          PRIMARY KEY ( quarto_id )
);

CREATE TABLE  produto
(
          produto_id                                   NUMBER NOT NULL,
          nome                                         VARCHAR(100)  NOT NULL,
          descricao                                    VARCHAR(100) NOT NULL,
          valor                                        NUMBER(8,2) NOT NULL,
          PRIMARY KEY ( produto_id )
);

CREATE TABLE  reserva
(
          reserva_id                                   NUMBER NOT NULL,
          data_inicio                                  DATE NOT NULL,
          data_fim                                     DATE  NOT NULL,
          cpf_cliente                                  CHAR(11) NOT NULL,
          quarto_id                                    NUMBER NOT NULL,
          FOREIGN KEY ( cpf_cliente )                  REFERENCES  cliente ( cpf ),
          FOREIGN KEY ( quarto_id )                    REFERENCES  quarto ( quarto_id ),
          PRIMARY KEY ( reserva_id )
);

CREATE TABLE  hospedagem
(
          hospedagem_id                                NUMBER NOT NULL,
          data_inicio                                  DATE NOT NULL,
          data_fim                                     DATE  NOT NULL,
          cpf_cliente                                  CHAR(11) NOT NULL,
          quarto_id                                    NUMBER NOT NULL,
          FOREIGN KEY ( cpf_cliente )                  REFERENCES  cliente ( cpf ),
          FOREIGN KEY ( quarto_id )                    REFERENCES  quarto ( quarto_id ),
          PRIMARY KEY ( hospedagem_id )
);

CREATE TABLE servico
(
          servico_id                                   NUMBER NOT NULL,
          valor                                        NUMBER(8,2) NOT NULL,
          PRIMARY KEY ( servico_id )
);

CREATE TABLE  avaliacao
(
          avaliacao_id                                 NUMBER NOT NULL,
          nota                                         NUMBER NOT NULL,
          comentario                                   VARCHAR(100),
          cpf_cliente                                  CHAR(11) NOT NULL,
          servico_id                                   NUMBER NOT NULL,
          FOREIGN KEY ( cpf_cliente )                  REFERENCES  cliente ( cpf ),
          FOREIGN KEY ( servico_id )                   REFERENCES  servico ( servico_id ),
          PRIMARY KEY ( avaliacao_id )
);

CREATE TABLE  venda
(
          venda_id                                     NUMBER,
          data                                         DATE NOT NULL,
          quantidade                                   NUMBER NOT NULL,
          produto_id                                   NUMBER NOT NULL,
          quarto_id                                    NUMBER NOT NULL,
          FOREIGN KEY ( produto_id )                   REFERENCES  produto ( produto_id ),
          FOREIGN KEY ( quarto_id )                    REFERENCES  quarto ( quarto_id ),
          PRIMARY KEY ( venda_id )
);

CREATE TABLE  alocacao
(
          funcionario_cpf                              CHAR(11) NOT NULL,
          servico_id                                   NUMBER(3) NOT NULL,
          FOREIGN KEY ( funcionario_cpf )              REFERENCES  funcionario ( cpf ),
          FOREIGN KEY ( servico_id )                   REFERENCES  servico ( servico_id ),
          PRIMARY KEY ( funcionario_cpf , servico_id )
);
