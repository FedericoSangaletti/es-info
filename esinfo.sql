CREATE TABLE clienti (
    cod_fiscale VARCHAR(16) PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    indirizzo VARCHAR(255)
);

CREATE TABLE ordini (
    numero SERIAL PRIMARY KEY ,
    tipo VARCHAR(50),
    cod_fiscale_cliente CHAR(16),
    data TIMESTAMP DEFAULT current_time,
    FOREIGN KEY (cod_fiscale_cliente) REFERENCES clienti(cod_fiscale)
);

CREATE TABLE pizze (
    nome VARCHAR(50) PRIMARY KEY
);

CREATE TABLE ingredienti (
    nome VARCHAR(50) PRIMARY KEY
);

CREATE TABLE ordini_pizze (
    nome_pizza VARCHAR(100),
    numero_ordine SERIAL,
    FOREIGN KEY (nome_pizza) REFERENCES pizze(nome),
    FOREIGN KEY (numero_ordine) REFERENCES ordini(numero),
    PRIMARY KEY (nome_pizza, numero_ordine)
);

CREATE TABLE pizze_ingredienti (
    nome_pizza VARCHAR(100),
    nome_ingrediente VARCHAR(50),
    FOREIGN KEY (nome_pizza) REFERENCES pizze(nome),
    FOREIGN KEY (nome_ingrediente) REFERENCES ingredienti(nome),
    PRIMARY KEY (nome_pizza, nome_ingrediente)
);






SELECT cod_fiscale_cliente from ordini;
SELECT cod_fiscale_cliente from clienti join ordini on clienti.cod_fiscale = ordini.cod_fiscale_cliente
where ordini.data = 2023-10-24;
