PRAGMA foreign_keys = NO;

CREATE TABLE usuarios (
    usuario_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_usuario TEXT NOT NULL,
    email TEXT NOT NULL,
    senha TEXT NOT NULL
);

CREATE TABLE clientes (
    cliente_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_cliente TEXT NOT NULL,
    usuario_id INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) ON DELETE CASCADE
);

CREATE TABLE produtos(
    produto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_produto TEXT NOT NULL,
    descricao TEXT,
    preco REAL NOT NULL CHECK(preco > 0)
);

CREATE TABLE vendas(
    venda_id INTEGER PRIMARY KEY AUTOINCREMENT,
    data_venda TEXT NOT NULL,
    usuario_id INTEGER NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id) ON DELETE SET NULL
);

CREATE TABLE produto_venda(
    venda_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CHECK(quantidade > 0),
    preco_unitario INTEGER NOT NULL CHECK(preco_unitario > 0),
    PRIMARY KEY (venda_id, produto_id),
    FOREIGN KEY (venda_id) REFERENCES vendas(venda_id) ON DELETE CASCADE,
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id) ON DELETE CASCADE
);

INSERT INTO usuarios (nome_usuario, email, senha)
VALUES 
        ('John', 'johndoe123@example.com', 'admin'),
        ('Jack', 'jacksparrow123@example.com', 'jack123'),
        ('Mary', 'maryonacross123@example.com', 'mary798');

INSERT INTO clientes (nome_cliente, usuario_id)
VALUES 
        ('John Doe', 1),
        ('Jack Sparrow', 2),
        ('Mary Poppins', 3);

INSERT INTO produtos (nome_produto, descricao, preco)
VALUES 
        ('Cafe', 'Cafe caro e ruim', 50.00),
        ('Papel Higienico', 'gfdgds', 78.96),
        ('Carne de Jamanta', 'Carne contrabandeada', 4564.56),
        ('Feijao Carioca', 'Feijao com municao 7.62mm', 8.50);

INSERT INTO vendas (data_venda, usuario_id)
VALUES 
        ('2026-08-23', 2),
        ('2026-06-31', 3),
        ('2028-09-07', 1);

INSERT INTO produto_venda (venda_id, produto_id, quantidade, preco_unitario)
VALUES 
        (1, 2, 8, 50.00),
        (2, 3, 2, 15.00),
        (3, 2, 8, 50.00);