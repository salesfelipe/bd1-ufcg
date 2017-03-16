CREATE TABLE cliente (
    cpf CHAR(11),
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE,
    sexo CHAR(1),
    rua VARCHAR(100),
    numero NUMBER,
    bairro VARCHAR(30),
    cep CHAR(8),
    email VARCHAR(40), 
    PRIMARY KEY (CPF)
);
 
CREATE TABLE dependente (
    cpf CHAR(11),
    titular CHAR(11),
    nome VARCHAR(50) NOT NULL,
    data_nasc DATE,
    PRIMARY KEY (cpf, titular),
    FOREIGN KEY (titular) REFERENCES cliente(cpf) ON DELETE CASCADE
);
 
CREATE TABLE funcionario (
    cpf CHAR(11),
    nome VARCHAR(50) NOT NULL,
    salario NUMBER(9, 2),
    data_nasc DATE,
    funcao VARCHAR(20),
    PRIMARY KEY (cpf)
);

CREATE TABLE quarto (
    id_quarto NUMBER,
    numero NUMBER NOT NULL,
    tipo VARCHAR(20),
    vista VARCHAR(10),
    diaria NUMERIC(9, 2),
    PRIMARY KEY(id_quarto)
);

CREATE TABLE servico (
    id_servico NUMBER,
    valor NUMBER(9, 2) NOT NULL,
    PRIMARY KEY (id_servico)
);

CREATE TABLE hospedagem (	
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    cpf_cliente CHAR(11),
    id_quarto NUMBER, 
    PRIMARY KEY (cpf_cliente, id_quarto),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf) ON DELETE CASCADE,
    FOREIGN KEY (id_quarto) REFERENCES quarto(id_quarto)
);
 
CREATE TABLE reserva (	
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    cpf_cliente CHAR(11),
    id_quarto NUMBER,
    PRIMARY KEY (cpf_cliente, id_quarto),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf) ON DELETE CASCADE,
    FOREIGN KEY (id_quarto) REFERENCES quarto(id_quarto)
);
 
CREATE TABLE servico_prestado (
    cpf_func CHAR(11),
    id_servico NUMBER,
    PRIMARY KEY (cpf_func, id_servico),
    FOREIGN KEY (cpf_func) REFERENCES funcionario(cpf) ON DELETE CASCADE,
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico) ON DELETE CASCADE
);

CREATE TABLE lavanderia (
   id_lavanderia NUMBER,
   PRIMARY KEY (id_lavanderia),
   FOREIGN KEY (id_lavanderia) REFERENCES servico(id_servico) ON DELETE CASCADE
);
 
CREATE TABLE frigobar (
   id_frigobar NUMBER,
   PRIMARY KEY (id_frigobar),
   FOREIGN KEY (id_frigobar) REFERENCES servico(id_servico) ON DELETE CASCADE
);
 
CREATE TABLE restaurante (
   id_rest NUMBER,
   PRIMARY KEY (id_rest),
   FOREIGN KEY (id_rest) REFERENCES servico(id_servico) ON DELETE CASCADE
);
 
CREATE TABLE bar (
   id_bar NUMBER,
   PRIMARY KEY (id_bar),
   FOREIGN KEY (id_bar) REFERENCES servico(id_servico) ON DELETE CASCADE
);

CREATE TABLE produto (
    id_produto NUMBER,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(200),
    valor NUMBER(9, 2) NOT NULL, 
    id_lavanderia NUMBER,
    id_frigobar NUMBER,
    id_rest NUMBER,
    id_bar NUMBER,
    PRIMARY KEY (id_produto),
    FOREIGN KEY (id_lavanderia) REFERENCES lavanderia(id_lavanderia) ON DELETE SET NULL,
    FOREIGN KEY (id_frigobar) REFERENCES frigobar(id_frigobar) ON DELETE SET NULL,
    FOREIGN KEY (id_rest) REFERENCES restaurante(id_rest) ON DELETE SET NULL,
    FOREIGN KEY (id_bar) REFERENCES bar(id_bar) ON DELETE SET NULL);

CREATE TABLE venda (
    id_produto NUMBER,
    id_quarto NUMBER,
    quantidade NUMBER,
    data DATE, 
    PRIMARY KEY (id_produto, id_quarto),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_quarto) REFERENCES quarto(id_quarto) ON DELETE CASCADE
);

CREATE TABLE avaliacao (
    id_servico NUMBER,
    cpf_cliente CHAR(11),
    nota NUMBER,
    comentario VARCHAR(200),
    PRIMARY KEY (id_servico, cpf_cliente),
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico) ON DELETE CASCADE,
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf)
);

CREATE TABLE telefone (
    telefone VARCHAR(20),
    cpf_cliente CHAR(11),
    PRIMARY KEY (telefone, cpf_cliente),    
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf) ON DELETE CASCADE
);
 
CREATE TABLE equipamento (
    equipamento VARCHAR(20),
    id_quarto NUMBER,
    PRIMARY KEY (equipamento, id_quarto),
    FOREIGN KEY (id_quarto) REFERENCES quarto(id_quarto) ON DELETE CASCADE
);

CREATE TABLE passeio_turistico (
   id_passeio NUMBER,
   PRIMARY KEY (id_passeio),
   FOREIGN KEY (id_passeio) REFERENCES servico(id_servico) ON DELETE CASCADE
);
 
CREATE TABLE estacionamento (
   id_estacionamento NUMBER,
   PRIMARY KEY (id_estacionamento),
   FOREIGN KEY (id_estacionamento) REFERENCES servico(id_servico) ON DELETE CASCADE
);
 