CREATE TABLE tb_cliente

(

    nome VARCHAR (15) NOT NULL,

    cpf char (9),

    PRIMARY KEY (cpf),

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
