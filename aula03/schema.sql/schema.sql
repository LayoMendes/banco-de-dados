-- Ativa foreign keys no inicio do script
PRAGMA foreign_keys = NO;

--cria tabela de usuario

CREATE TABLE usuario(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL,
    senha INTEGER NOT NULL
);