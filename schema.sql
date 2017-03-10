/* Arquivo de criação das entidades principais do sistema! */


CREATE TABLE TB_Cliente
(
         Cpf                                            CHAR(11) NOT NULL,
         Nome                                           VARCHAR(100) NOT NULL,
         Data_Nascimento                                DATE NOT NULL,
         Sexo                                           CHAR NOT NULL,
         Email                                          VARCHAR(25) NOT NULL,
         Rua                                            VARCHAR(50) NOT NULL,
         Numero                                         CHAR(10) NOT NULL,
         Bairro                                         VARCHAR(20) NOT NULL,
         Cep                                            CHAR(8),
         PRIMARY KEY (Cpf)
);

CREATE TABLE TB_Telefone_Cliente
(
         Numero_Telefone                                CHAR(13) NOT NULL,
         Cpf_Cliente                                    CHAR(11) NOT NULL,
         FOREIGN KEY (Cpf_Cliente)                      REFERENCES TB_Cliente (Cpf),
         PRIMARY KEY (Numero_Telefone, Cpf_Cliente)
);

CREATE TABLE TB_Dependente
(
         Cpf                                            CHAR(11) NOT NULL,
         Nome                                           VARCHAR(100) NOT NULL,
         Data_Nascimento                                DATE NOT NULL,
         Cpf_Cliente                                    CHAR(11) NOT NULL,
         PRIMARY KEY (Cpf, Cpf_Cliente),
         FOREIGN KEY (Cpf_Cliente) REFERENCES TB_Cliente(Cpf)
);

CREATE TABLE TB_Funcionario
(
         Cpf                                           CHAR(11) NOT NULL,
         Nome                                          VARCHAR(100) NOT NULL,
         Data_Nascimento                               DATE NOT NULL,
         Funcao                                        VARCHAR(100) NOT NULL,
         Salario                                       DECIMAL(8,2) NOT NULL,
         PRIMARY KEY (Cpf)
);

CREATE TABLE TB_Quarto
(
          Id                                           INT NOT NULL,
          Numero                                       CHAR(4)  NOT NULL,
          Tipo                                         VARCHAR(25) NOT NULL,
          Vista                                        VARCHAR(25) NOT NULL,
          Diaria                                       DECIMAL(8,2) NOT NULL,
          PRIMARY KEY (Id)
);

CREATE TABLE TB_Equipamento_Quarto
(
          Nome_Equipamento                             VARCHAR(150) NOT NULL,
          Quarto_Id                                    INT NOT NULL,
          FOREIGN KEY (Quarto_Id)                      REFERENCES TB_Quarto(Id),
          PRIMARY KEY (Quarto_Id, Nome_Equipamento)
);

CREATE TABLE TB_Reserva
(
          Id                                           INT NOT NULL,
          Data_Inicio                                  DATE NOT NULL,
          Data_Fim                                     DATE  NOT NULL,
          Cpf_Cliente                                  CHAR(11) NOT NULL,
          Quarto_Id                                    INT NOT NULL,
          FOREIGN KEY (Cpf_Cliente)                    REFERENCES TB_Cliente (Cpf),
          FOREIGN KEY (Quarto_Id)                      REFERENCES TB_Quarto (Id),
          PRIMARY KEY (Id)
);

CREATE TABLE TB_Hospedagem
(
          Id                                           INT NOT NULL,
          Data_Inicio                                  DATE NOT NULL,
          Data_Fim                                     DATE NOT NULL,
          Cpf_Cliente                                  CHAR(11) NOT NULL,
          Quarto_Id                                    INT NOT NULL,
          FOREIGN KEY (Cpf_Cliente)                    REFERENCES TB_Cliente (Cpf),
          FOREIGN KEY (Quarto_Id)                      REFERENCES TB_Quarto (Id),
          PRIMARY KEY (Id)
);

CREATE TABLE TB_Servico
(
          Id                                           INT NOT NULL,
          Valor                                        DECIMAL(8,2) NOT NULL,
          PRIMARY KEY (Id)
);

CREATE TABLE TB_Avaliacao
(
          Id                                           INT NOT NULL,
          Nota                                         INT NOT NULL,
          Comentario                                   VARCHAR(100),
          Cpf_Cliente                                  CHAR(11) NOT NULL,
          Servico_Id                                   INT NOT NULL,
          FOREIGN KEY (Cpf_Cliente)                    REFERENCES TB_Cliente (Cpf),
          FOREIGN KEY (Servico_Id)                     REFERENCES TB_Servico (Id),
          PRIMARY KEY (Id)
);


CREATE TABLE TB_Servico_Prestado_Funcionario
(
          Funcionario_Cpf                              CHAR(11) NOT NULL,
          Servico_Id                                   INT NOT NULL,
          FOREIGN KEY (Funcionario_Cpf)                REFERENCES TB_Funcionario (Cpf),
          FOREIGN KEY (Servico_Id)                     REFERENCES TB_Servico (Id),
          PRIMARY KEY (Funcionario_Cpf , Servico_Id)
);

CREATE TABLE TB_Passeio_Turistico
(
        Id                                             INT NOT NULL,
        Servico_Id                                     INT NOT NULL,
        FOREIGN KEY (Servico_Id)                       REFERENCES TB_Servico (Id),
        PRIMARY KEY (Id)
);

CREATE TABLE TB_Lavanderia
(
        Id                                             INT NOT NULL,
        Servico_Id                                     INT NOT NULL,
        FOREIGN KEY (Servico_Id)                       REFERENCES TB_Servico (Id),
        PRIMARY KEY (Id)
);

CREATE TABLE TB_Frigobar
(
        Id                                             INT NOT NULL,
        Servico_Id                                     INT NOT NULL,
        FOREIGN KEY (Servico_Id)                       REFERENCES TB_Servico (Id),
        PRIMARY KEY (Id)
);

CREATE TABLE TB_Restaurante
(
        Id                                             INT NOT NULL,
        Servico_Id                                     INT NOT NULL,
        FOREIGN KEY (Servico_Id)                       REFERENCES TB_Servico (Id),
        PRIMARY KEY (Id)
);

CREATE TABLE TB_Estacionamento
(
        Id                                             INT NOT NULL,
        Servico_Id                                     INT NOT NULL,
        FOREIGN KEY (Servico_Id)                       REFERENCES TB_Servico (Id),
        PRIMARY KEY (Id)
);

CREATE TABLE TB_Bar
(
        Id                                             INT NOT NULL,
        Servico_Id                                     INT NOT NULL,
        FOREIGN KEY (Servico_Id)                       REFERENCES TB_Servico (Id),
        PRIMARY KEY (Id)
);

CREATE TABLE TB_Produto
(
          Id                                           INT NOT NULL,
          Nome                                         VARCHAR(100)  NOT NULL,
          Descricao                                    VARCHAR(100) NOT NULL,
          Valor                                        DECIMAL(8,2) NOT NULL,
          Lavanderia_Id                                INT,
          Frigobar_Id                                  INT,
          Restaurante_Id                               INT,
          Bar_Id                                       INT,
          FOREIGN KEY (Lavanderia_Id)                  REFERENCES TB_Lavanderia (Id),
          FOREIGN KEY (Frigobar_Id)                    REFERENCES TB_Frigobar (Id),
          FOREIGN KEY (Restaurante_Id)                REFERENCES TB_Restaurante (Id),
          FOREIGN KEY (Bar_Id )                       REFERENCES TB_Bar (Id),
          PRIMARY KEY (Id)
);

CREATE TABLE TB_Venda
(
          Id                                           INT,
          Data                                         DATE NOT NULL,
          Quantidade                                   INT NOT NULL,
          Produto_Id                                   INT NOT NULL,
          Quarto_Id                                    INT NOT NULL,
          FOREIGN KEY (Produto_Id)                     REFERENCES TB_Produto (Id),
          FOREIGN KEY (Quarto_Id)                      REFERENCES TB_Quarto (Id),
          PRIMARY KEY (Id)
);
