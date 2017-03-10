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

CREATE TABLE Tb_Endereco
(
    Id INT NOT NULL,
    Rua VARCHAR(50) NOT NULL,
    Numero CHAR(10) NOT NULL,
    Bairro VARCHAR(15) NOT NULL,
    Cep CHAR(8) NOT NULL,
    PRIMARY KEY (Id)
);

CREATE TABLE tb_dependente

(

    nome VARCHAR (15) NOT NULL,

    cpf char (9),

    cpf_cliente char (9),

    PRIMARY KEY (cpf, cpf_cliente),

    FOREIGN KEY (cpf_cliente) REFERENCES tb_cliente(cpf),

    data_de_nascimento DATE NOT NULL

  );

CREATE TABLE tb_funcionario
(
    nome VARCHAR(15) NOT NULL,

    cpf char(9),

    PRIMARY KEY(cpf),

    salario FLOAT(3),

    data_de_nascimento DATE NOT NULL,

    funcao VARCHAR(15) NOT NULL
);
