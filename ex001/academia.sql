-- Criando o banco de dados para o sistema da academia
CREATE DATABASE SistemaAcademia;

-- Utilizando o banco de dados que acabamos de criar
USE SistemaAcademia;

-- Criando a tabela de clientes
CREATE TABLE Clientes (
    CPF CHAR(14) PRIMARY KEY, -- CPF do cliente (chave primária) - Definindo como CHAR com tamanho fixo para garantir formatação consistente.
    Nome VARCHAR(255) NOT NULL, -- Nome completo do cliente, obrigatório.
    DataNascimento DATE NOT NULL, -- Data de nascimento do cliente, obrigatória.
    Email VARCHAR(255) UNIQUE NOT NULL, -- Endereço de email do cliente, único e obrigatório.
    Telefone VARCHAR(20), -- Telefone do cliente, pode ser nulo.
    Endereco VARCHAR(255), -- Endereço completo do cliente, pode ser nulo.
    DataCadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data e hora do cadastro, preenchido automaticamente com a data e hora atual.
);

-- Criando a tabela de planos 
CREATE TABLE Planos (
    ID INT AUTO_INCREMENT PRIMARY KEY, -- ID do plano (chave primária, autoincremental)
    Nome VARCHAR(255) UNIQUE NOT NULL, -- Nome do plano, único e obrigatório.
    Descricao TEXT, -- Descrição detalhada do plano, pode ser longo.
    PrecoMensal DECIMAL(10,2) NOT NULL, -- Preço mensal do plano, obrigatório, com duas casas decimais.
    DuracaoMeses INT DEFAULT 1 -- Duração do plano em meses, com valor padrão de 1 mês.
);

-- Criando a tabela de matrículas, relacionando clientes com planos
CREATE TABLE Matriculas (
    ID INT AUTO_INCREMENT PRIMARY KEY, -- ID da matrícula (chave primária, autoincremental)
    ClienteCPF CHAR(14) NOT NULL, -- CPF do cliente matriculado, obrigatório.
    PlanoID INT NOT NULL, -- ID do plano escolhido, obrigatório.
    DataMatricula TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data e hora da matrícula, preenchido automaticamente.
    DataVencimento DATE NOT NULL, -- Data de vencimento da mensalidade.
    Ativo BOOLEAN DEFAULT TRUE, -- Status da matrícula (ativo ou inativo), com valor padrão "ativo".

    -- Definindo as chaves estrangeiras para garantir a integridade referencial
    FOREIGN KEY (ClienteCPF) REFERENCES Clientes(CPF),
    FOREIGN KEY (PlanoID) REFERENCES Planos(ID)
);

-- Criando a tabela de instrutores
CREATE TABLE Instrutores (
    ID INT AUTO_INCREMENT PRIMARY KEY, -- ID do instrutor (chave primária, autoincremental)
    Nome VARCHAR(255) NOT NULL, -- Nome completo do instrutor, obrigatório.
    Especialidade VARCHAR(255), -- Especialidade do instrutor.
    CREFF VARCHAR(20) UNIQUE -- Número do registro profissional (CREFF), único, se aplicável. 
);

-- Criando a tabela de modalidades
CREATE TABLE Modalidades (
    ID INT AUTO_INCREMENT PRIMARY KEY, -- ID da modalidade (chave primária, autoincremental)
    Nome VARCHAR(255) UNIQUE NOT NULL, -- Nome da modalidade, único e obrigatório.
    Descricao TEXT -- Descrição da modalidade. 
);

-- Criando tabela para relacionar instrutores a modalidades que eles podem ministrar
CREATE TABLE InstrutoresModalidades (
    InstrutorID INT NOT NULL,
    ModalidadeID INT NOT NULL,
    PRIMARY KEY (InstrutorID, ModalidadeID), -- Chave primária composta 
    FOREIGN KEY (InstrutorID) REFERENCES Instrutores(ID), -- Garantindo integridade referencial
    FOREIGN KEY (ModalidadeID) REFERENCES Modalidades(ID) 
);