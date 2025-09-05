PRAGMA foreign_keys = ON;

-- Tabela Participante
CREATE TABLE Participante (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT
);

-- Tabela Evento
CREATE TABLE Evento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    local TEXT NOT NULL,
    data TEXT NOT NULL
);

-- Tabela Inscricao (associativa Evento x Participante)
CREATE TABLE Inscricao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_evento INTEGER NOT NULL,
    id_participante INTEGER NOT NULL,
    data_inscricao TEXT,
    status TEXT,
    FOREIGN KEY (id_evento) REFERENCES Evento(id) ON DELETE CASCADE,
    FOREIGN KEY (id_participante) REFERENCES Participante(id) ON DELETE CASCADE
);

-- Tabela Pagamento (1:1 com Inscricao)
CREATE TABLE Pagamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_inscricao INTEGER UNIQUE,
    valor REAL,
    data_pagamento TEXT,
    status TEXT,
    FOREIGN KEY (id_inscricao) REFERENCES Inscricao(id) ON DELETE CASCADE
);

-- Inserts de Participante
INSERT INTO Participante (nome, email, telefone) VALUES
('João Silva', 'joao@email.com', '34999990001'),
('Maria Oliveira', 'maria@email.com', '34999990002'),
('Carlos Santos', 'carlos@email.com', '34999990003');

-- Inserts de Evento
INSERT INTO Evento (nome, descricao, local, data) VALUES
('Seminário de Tecnologia', 'Evento sobre tendências em TI', 'Auditório A', '2025-09-10'),
('Workshop de Banco de Dados', 'Oficina prática de modelagem e SQL', 'Laboratório 3', '2025-09-15');

-- Inserts de Inscricao
INSERT INTO Inscricao (id_evento, id_participante, data_inscricao, status) VALUES
(1, 1, '2025-09-01', 'confirmada'),
(1, 2, '2025-09-01', 'confirmada'),
(2, 2, '2025-09-02', 'confirmada'),
(2, 3, '2025-09-03', 'cancelada');

-- Inserts de Pagamento (um por inscrição)
INSERT INTO Pagamento (id_inscricao, valor, data_pagamento, status) VALUES
(1, 100.00, '2025-09-01', 'pago'),
(2, 100.00, '2025-09-01', 'pago'),
(3, 150.00, '2025-09-02', 'pendente'),
(4, 150.00, '2025-09-03', 'cancelado');
