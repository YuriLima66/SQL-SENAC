-- Cria o banco de dados
CREATE DATABASE ClinicaVeterinaria;

-- Usa o banco de dados
USE ClinicaVeterinaria;

-- Cria a tabela Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nomeCliente VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    cpf VARCHAR(14) UNIQUE NOT NULL
);

-- Cria a tabela Veterinario
CREATE TABLE Veterinario (
    idVeterinario INT AUTO_INCREMENT PRIMARY KEY,
    nomeVeterinario VARCHAR(255) NOT NULL,
    especialidade VARCHAR(255)
);

-- Cria a tabela Animal
CREATE TABLE Animal (
    idAnimal INT AUTO_INCREMENT PRIMARY KEY,
    nomeAnimal VARCHAR(255) NOT NULL,
    raca VARCHAR(255),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Cria a tabela Consulta
CREATE TABLE Consulta (
    idConsulta INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idVeterinario INT,
    idAnimal INT,
    dataConsulta DATE,
    motivo VARCHAR(200),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idVeterinario) REFERENCES Veterinario(idVeterinario),
    FOREIGN KEY (idAnimal) REFERENCES Animal(idAnimal)
);