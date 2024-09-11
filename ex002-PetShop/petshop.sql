/*Dada a correção da atividade de PetShop, crie um arquivo em linguagem SQL de acordo com as solicitações abaixo não esqueça de testar no XAMPP, anexe as 5 telas capturadas, anexe o link do GitHub com as linhas de código SQL e essa atividade como comentário nas linhas de código. 

Crie um banco de dados utilizando a linguagem SQL
Crie as 4 tabelas de cliente, veterinário, consulta e animal, contendo em cada uma das tabelas o seu atributo com seu respectivo datatype. (Capture a tela do XAMPP)
Realize a alteração do atributo da tabela cliente de nomecliente para nomecompleto (Capture a tela do XAMPP)
Realize a alteração do datatype motivo de (200) caracteres para (500) caracteres (Captura a tela do XAMPP)
delete o atributo nomeanimal da tabela animal, depois adicionei novamente o atributo com o nome: nomeanimalzinho
realize uma pesquisa na documentação de como insere dados em uma tabela existente, insira os dados "Ana Claudia Cunha" para nome da cliente, telefone 11999998888, e cpf 1144444411 na tabela do cliente. (Capture a tela do XAMPP)
Por fim, realize a exclusão dos dados da tabela cliente
Realize a exclusão de cada uma das tabelas
Realize a exclusão do banco de dados (Capture a tela do XAMPP)


Essa atividade pode ser feita em dupla, mas a entrega final é individual. */



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
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE,
    FOREIGN KEY (idVeterinario) REFERENCES Veterinario(idVeterinario),
    FOREIGN KEY (idAnimal) REFERENCES Animal(idAnimal)
);