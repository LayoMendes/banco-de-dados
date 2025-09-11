PRAGMA foreign_keys = NO;

CREATE TABLE participantes (
    participante_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT
);

CREATE TABLE eventos (
    evento_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    evento_local TEXT NOT NULL,
    evento_data TEXT NOT NULL
);


CREATE TABLE pagamentos (
    pagamento_id INTEGER PRIMARY KEY AUTOINCREMENT,
    valor REAL NOT NULL CHECK(valor > 0),
    pagamento_data TEXT NOT NULL,
    pagamento_status TEXT,
    inscricao_id INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (inscricao_id) REFERENCES inscricoes(inscricao_id) ON DELETE SET NULL
);

CREATE TABLE inscricoes (
    inscricao_id INTEGER PRIMARY KEY AUTOINCREMENT,
    evento_id INTEGER NOT NULL,
    participante_id INTEGER NOT NULL,
    inscricao_data TEXT,
    inscricao_status TEXT,
    FOREIGN KEY (evento_id) REFERENCES eventos(evento_id) ON DELETE SET NULL
    FOREIGN KEY (participante_id) REFERENCES participantes(participante_id) ON DELETE SET NULL
);

INSERT INTO participantes (nome, email, telefone)
VALUES 
        ('Fabio', 'fabiosoares123@gmail.com', '(34) 99515-8613'),
        ('Manuela', 'manugomes@outlook.com', '(31) 94515-6456'),
        ('Cesar', 'cesarcarvalho54@yahoo.com', '(34) 94561-5487');

INSERT INTO eventos (nome, descricao, evento_local, evento_data)
VALUES 
        ('Seminario', 'Neymar: Experiência da escala 1x364', 'Casa da Anitta', '2025-06-25'),
        ('Workshop', 'Neymar ensina como enganar milionários árabes', 'Arena MRV', '2026-01-01');

INSERT INTO inscricoes (inscricao_data, inscricao_status, evento_id, participante_id)
VALUES 
        ('2025-05-04', 'confirmada', 1, 2),
        ('2025-05-04', 'cancelada', 2, 2),
        ('2025-12-25', 'confirmada', 1, 3),
        ('2025-01-02', 'confirmada', 2, 1);

INSERT INTO pagamentos (valor, pagamento_data, pagamento_status, inscricao_id)
VALUES
        (125.00, '2025-05-04', 'confirmado', 1),
        (100.00, '2025-05-04', 'cancelado', 2),
        (125.00, '2025-12-25', 'confirmado', 3),
        (125.00, '2025-01-02', 'confirmado', 4);