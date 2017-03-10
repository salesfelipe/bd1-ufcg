/* Arquivo de criação das entidades principais do sistema! */

CREATE TABLE "Cliente"
(
         "CPF"                                          CHAR(11) NOT NULL,
         "Nome"                                         VARCHAR(100) NOT NULL,
         "Data_Nascimento"                              DATE NOT NULL,
         "Sexo"                                         CHAR NOT NULL,
         "Email"                                        VARCHAR(25) NOT NULL,
         "Endereco_Id"                                  NUMBER NOT NULL,
         PRIMARY KEY ("CPF")
         FOREIGN KEY ("Endereco_Id")                    REFERENCES "Endereco"("Endereco_Id"),
);

CREATE TABLE "Endereco"
(
        "Endereco_Id"                                    NUMBER
         "Rua"                                           VARCHAR(50) NOT NULL,
         "Numero"                                        VARCHAR(10) NOT NULL,
         "Bairro"                                        VARCHAR(20) NOT NULL,
         "Cep"                                           CHAR (8),
         PRIMARY KEY ("Endereco_Id")
);


CREATE TABLE "Dependente"
(
         "CPF"                                           CHAR(11) NOT NULL,
         "Nome"                                          VARCHAR(100) NOT NULL,
         "Data_Nascimento"                               DATE NOT NULL,
         "CPF_Cliente"                                   CHAR (11),
         FOREIGN KEY ("CPF_Cliente")                     REFERENCES "Cliente"("CPF"),
         PRIMARY KEY ("CPF")
);

CREATE TABLE "Funcionario"
(
         "CPF"                                          CHAR(11) NOT NULL,
         "Nome"                                         VARCHAR(100) NOT NULL,
         "Data_Nascimento"                              DATE NOT NULL,
         "Funcao"                                       VARCHAR(100) NOT NULL,
         "Salario"                                      NUMBER(8,2) NOT NULL,
         PRIMARY KEY ("CPF")
);

CREATE TABLE "Quarto"
(
         "Quarto_Id"                                                 NUMBER(3) NOT NULL,
         "Numero"                                                    VARCHAR(4)  NOT NULL,
         "Tipo"                                                      VARCHAR(25) NOT NULL,
         "Vista"                                                     VARCHAR(25) NOT NULL,
         "Equipamentos"                                              VARCHAR(150) NOT NULL,
         "Diaria"                                                    NUMBER(8,2) NOT NULL,
         PRIMARY KEY ("Quarto_Id")
);

CREATE TABLE "Produto"
(
         "Produto_Id"                                                 NUMBER NOT NULL,
         "Nome"                                                       VARCHAR(100)  NOT NULL,
         "Descricao"                                                  VARCHAR(100) NOT NULL,
         "Valor"                                                      NUMBER(8,2) NOT NULL,
         PRIMARY KEY ("Produto_Id")
)

CREATE TABLE "Reserva"
(
         "Data_Inicio"                                                 DATE NOT NULL,
         "Data_Fim"                                                    DATE  NOT NULL,
         "Cliente_CPF"                                                 CHAR(11) NOT NULL,
         "Quarto_Id"                                                   NUMBER(3) NOT NULL,
         PRIMARY KEY ("Cliente_CPF","Quarto_Id")
)

CREATE TABLE "Hospedagem"
(
         "Data_Inicio"                                                 DATE NOT NULL,
         "Data_Fim"                                                    DATE  NOT NULL,
         "Cliente_CPF"                                                 CHAR(11) NOT NULL,
         "Quarto_Id"                                                   NUMBER NOT NULL,
         PRIMARY KEY ("Cliente_CPF","Quarto_Id")
)

CREATE TABLE "Avaliacao"
(
         "Nota"                                                        NUMBER(2) NOT NULL,
         "Comentario"                                                  VARCHAR(100),
         "Cliente_CPF"                                                 CHAR(11) NOT NULL,
         "Servico_Id"                                                  NUMBER(1) NOT NULL,
         PRIMARY KEY ("Cliente_CPF","Servico_Id")
)

/* Vou nem fazer propaganda mai! */

CREATE TABLE "Venda"
(
         "Data"                                                        DATE NOT NULL,
         "Quantidade"                                                  NUMBER NOT NULL,
         "Produto_Id"                                                  NUMBER NOT NULL,
         "Quarto_Id"                                                   NUMBER(3) NOT NULL,
         PRIMARY KEY ("Produto_Id","Quarto_Id")
)

CREATE TABLE "Alocacao"
(
         "Funcionario_CPF"                                             CHAR(11) NOT NULL,
         "Servico_Id"                                                  NUMBER(3) NOT NULL,
         PRIMARY KEY ("Funcionario_CPF","Servico_Id")
)
