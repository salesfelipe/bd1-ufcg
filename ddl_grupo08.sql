CREATE TABLE TB_Cliente
(
    Cpf VARCHAR(11) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Sexo CHAR NOT NULL,
    Endereco_Id INT NOT NULL,
    PRIMARY KEY (Cpf),
    FOREIGN KEY (Endereco_Id) REFERENCES TB_Endereco (Id)
);

CREATE TABLE TB_Endereco
(
    Id INT NOT NULL,
    Rua VARCHAR(50) NOT NULL,
    Numero CHAR(10) NOT NULL,
    Bairro VARCHAR(15) NOT NULL,
    Cep CHAR(8) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE TB_Dependente
(
    Nome VARCHAR (100) NOT NULL,
    Cpf CHAR(11) NOT NULL,
    Cpf_Cliente CHAR(11) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    PRIMARY KEY (Cpf, Cpf_Cliente),
    FOREIGN KEY (Cpf_Cliente) REFERENCES TB_Cliente(Cpf),

  );

CREATE TABLE TB_Funcionario
(
    Nome VARCHAR(100) NOT NULL,
    Cpf CHAR(11) NOT NULL,
    Salario DECIMAL(8,2) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Funcao_Id INT NOT NULL,
    PRIMARY KEY(Cpf),
    FOREIGN KEY (Funcao_Id) REFERENCES TB_Funcao(Id)
);
