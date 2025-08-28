-- Ativa foreign keys no inicio do script
PRAGMA foreign_keys = NO;

--cria tabela de usuario

CREATE TABLE usuario(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL,
    senha INTEGER NOT NULL
);

-- tabela cliente 

CREATE TABLE cliente(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT NOT NULL,
    usuario_id INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
);

--TABELA PRODUTO
CREATE TABLE produto(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    preco REAL NOT NULL CHECK (preco >= 0)
);

CREATE TABLE venda(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    data TEXT NOT NULL,
    usuario_id INTEGER NOT NULL,
    cliente_id INTEGER NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE SET NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE SET NULL

    );

-- TABELA VENDA_PRODUT tabela associativa para N:M produto <-> venda

CREATE TABLE venda_produto(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario REAL NOT NULL CHECK (preco_unitario >= 0),
   -- PRIMARY KEY (venda_id, produto_id), 
    FOREIGN KEY (venda_id) REFERENCES venda(id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produto(id) ON DELETE CASCADE,

 )

--usuario

INSERT INTO usuario (nome, email, senha) VALUES ('Rafael', 'rafael@unipam', 'leafar');
INSERT INTO usuario (nome, email, senha) VALUES ('Layo', 'layo@unipam', 'leafar');
INSERT INTO usuario (nome, email, senha) VALUES ('Ana Clara Silva Dias', 'muiezinha@unipam', 'leafar');
INSERT INTO usuario (nome, email, senha) VALUES ('pretinha', 'pretinha@unipam', 'leafar');

--insere cliente

INSERT INTO cliente (nome, telefone, usuario_id) VALUES ('Rafael Marinho', '999999', 1);
INSERT INTO cliente (nome, telefone, usuario_id) VALUES ('Layo Mendes', '999999', 2);
INSERT INTO cliente (nome, telefone, usuario_id) VALUES ('Ana Clara', '999999', 3);
INSERT INTO cliente (nome, telefone, usuario_id) VALUES ('Pret', '999999', 4);

--insere produtos

INSERT INTO produto (nome, descricao, preco) VALUES ('Arroz 5kg', 'tipo bomzinho', 70.00);
INSERT INTO produto (nome, descricao, preco) VALUES ('Aptamil Premium', '800g', 110.00);
INSERT INTO produto (nome, descricao, preco) VALUES ('Neocate', '400g', 188.50);
INSERT INTO produto (nome, descricao, preco) VALUES ('Fortini Plus', '400g', 110.00);


--inserir vendas

INSERT INTO venda (data, usuario_id, cliente_id) VALUES ('27-08-2025', 1, 1);
INSERT INTO venda (data, usuario_id, cliente_id) VALUES ('28-08-2025', 2, 2);
INSERT INTO venda (data, usuario_id, cliente_id) VALUES ('29-08-2025', 3, 3);
INSERT INTO venda (data, usuario_id, cliente_id) VALUES ('30-08-2025', 4, 4);
