CREATE TABLE tb_cliente

(

    nome VARCHAR (15) NOT NULL,

    cpf char (9),

    PRIMARY KEY (cpf),
    
    id_endereco INT,
    
    FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id_endereco),

    data_de_nascimento DATE NOT NULL,

    sexo CHAR
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

CREATE TABLE tb_endereco

(
    id_endereco INT,
    
    PRIMARY KEY (id_endereco),
    
    rua VARCHAR(25) NOT NULL,
    
    bairro VARCHAR(25) NOT NULL,
    
    cep INT NOT NULL,
    
    numero INT NOT NULL
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