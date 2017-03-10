/* Arquivo de criação das entidades principais do sistema! */

CREATE TABLE "Cliente"
(
         "CPF"                              CHAR(11) NOT NULL,
         "Nome"                             VARCHAR(100) NOT NULL,
         "Data_Nascimento"                  DATE NOT NULL,
         "Sexo"                             CHAR NOT NULL,
         "Email"                            VARCHAR(25) NOT NULL,
         "Endereco_Id"                      NUMBER NOT NULL,
         PRIMARY KEY ("CPF")
);

CREATE TABLE "Dependente"
(
         "CPF"                               CHAR(11) NOT NULL,
         "Nome"                              VARCHAR(100) NOT NULL,
         "Data_Nascimento"                   DATE NOT NULL,
         "CPF_Cliente"                       CHAR (11),
         FOREIGN KEY ("CPF_Cliente")         REFERENCES "Cliente"("CPF"),
         PRIMARY KEY ("CPF")
);

CREATE TABLE "Funcionario"
(
         "CPF"                              CHAR(11) NOT NULL,
         "Nome"                             VARCHAR(100) NOT NULL,
         "Data_Nascimento"                  DATE NOT NULL,
         "Funcao"                           VARCHAR(100) NOT NULL,
         "Salario"                          NUMBER(8,2) NOT NULL,
         PRIMARY KEY ("CPF")
);

CREATE TABLE "Quarto"
(
         "QuartoId"                                      NUMBER(3,0) NOT NULL,
         "Numero"                                        VARCHAR(4)  NOT NULL,
         "Tipo"                                          VARCHAR(25) NOT NULL,
         "Vista"                                         VARCHAR(25) NOT NULL,
         "Equipamentos"                                  VARCHAR(150) NOT NULL,
         "Diaria"                                        NUMBER NOT NULL,
         CONSTRAINT "Quarto Id"                          PRIMARY KEY ("QuartoId")
)

CREATE TABLE "Produto"
(
         "ProdutoId"                                      NUMBER NOT NULL,
         "Nome"                                          VARCHAR(100)  NOT NULL,
         "Tipo"                                          VARCHAR(25) NOT NULL,
         "Vista"                                         VARCHAR(25) NOT NULL,
         "Equipamentos"                                  VARCHAR(150) NOT NULL,
         "Diaria"                                        NUMBER NOT NULL,
         CONSTRAINT "Quarto Id"                          PRIMARY KEY ("QuartoId")
)
