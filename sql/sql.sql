-- Création de la base de données
CREATE DATABASE EcoleMaternelle;
USE EcoleMaternelle;

-- Table des Enseignants
CREATE TABLE Enseignantscloud (
    enseignant_id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_prise_fonction DATE NOT NULL,
    telephone VARCHAR(20),
    email VARCHAR(100),
    diplome VARCHAR(100)
);

-- Table des Classes
CREATE TABLE Classescloud (
    classe_id INT PRIMARY KEY AUTO_INCREMENT,
    nom_classe VARCHAR(10) NOT NULL, -- TPS, PS, MS, GS
    capacite INT NOT NULL,
    enseignant_id INT,
    FOREIGN KEY (enseignant_id) REFERENCES Enseignantscloud(enseignant_id)
);

-- Table des Responsables
CREATE TABLE Responsablescloud (
    responsable_id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    lien_enfant VARCHAR(20) NOT NULL, -- Père, Mère, Tuteur...
    adresse VARCHAR(200),
    telephone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    profession VARCHAR(100)
);

-- Table des Enfants
CREATE TABLE Enfantscloud (
    enfant_id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE NOT NULL,
    lieu_naissance VARCHAR(100),
    sexe CHAR(1), -- M/F
    adresse VARCHAR(200) NOT NULL,
    date_inscription DATE NOT NULL,
    photo LONGBLOB, -- Stockage de la photo (facultatif)
    classe_id INT,
    responsable1_id INT NOT NULL,
    responsable2_id INT,
    FOREIGN KEY (classe_id) REFERENCES Classescloud(classe_id),
    FOREIGN KEY (responsable1_id) REFERENCES Responsablescloud(responsable_id),
    FOREIGN KEY (responsable2_id) REFERENCES Responsablescloud(responsable_id)
);

-- Table des Inscriptions
CREATE TABLE Inscriptionscloud (
    inscription_id INT PRIMARY KEY AUTO_INCREMENT,
    enfant_id INT NOT NULL,
    date_depot DATE NOT NULL,
    statut ENUM('en cours', 'validé', 'refusé') NOT NULL,
    certificat_naissance BOOLEAN DEFAULT FALSE,
    carnet_sante BOOLEAN DEFAULT FALSE,
    justificatif_domicile BOOLEAN DEFAULT FALSE,
    observations TEXT,
    FOREIGN KEY (enfant_id) REFERENCES Enfantscloud(enfant_id)
);

-- Table des Présences
CREATE TABLE Presencescloud (
    presence_id INT PRIMARY KEY AUTO_INCREMENT,
    enfant_id INT NOT NULL,
    date DATE NOT NULL,
    present BOOLEAN DEFAULT TRUE,
    motif_absence VARCHAR(100),
    FOREIGN KEY (enfant_id) REFERENCES Enfantscloud(enfant_id),
    UNIQUE KEY (enfant_id, date) 
);
CREATE TABLE abandonsCloud (
    abandon_id INT PRIMARY KEY AUTO_INCREMENT,
    enfant_id INT NOT NULL,
    date_abandon DATE NOT NULL,
    statut ENUM('transferer', 'exclu', 'decedé') NOT NULL,
    carnet_sante BOOLEAN DEFAULT FALSE,
    observations TEXT,
    FOREIGN KEY (enfant_id) REFERENCES Enfantscloud(enfant_id)
);

CREATE USER 'Responsable'@'gmail.com' IDENTIFIED BY '0000000R';
--Example:



--Incription Enseignants
INSERT INTO Enseignantscloud( nom, prenom, date_prise_fonction, email, diplome)
VALUE("ali","attyallah","2025-05-06","admisacademy@gmail.com","Master 2");

--Insertion des classes
INSERT INTO Classescloud(classe_id, nom_classe, capacite, enseignant_id)
VALUE("2", "TPS","25", enseignant_id);

--Inserer le responsable de l'enfant
INSERT INTO Responsablescloud (responsable_id, nom, prenom, lien_enfant, adresse, telephone, email, profession)
VALUE ("1","attyallah","ali","pere","mongo","0023562727307","aliattyallahali@gmzil.com","cultivateur");

INSERT INTO Enfantscloud (enfant_id, nom, prenom, date_naissance, lieu_naissance, sexe, adresse, date_inscription, photo, classe_id, responsable1_id)
VALUE ("01", "ali", "attyallah", "2022-05-25", "Bandaro", "M", "mongo", "2025-03-25", "jpg", "1", "1");

-- pour l'inscription
INSERT INTO Inscriptionscloud(inscription_id, enfant_id, date_depot, statut, certificat_naissance, carnet_sante, justificatif_domicile, observations)
VALUE("01", "01", "2025-01-05","validé", "1","1","1", "ok");

--Liste de presences
INSERT INTO Presencescloud(presence_id, enfant_id, date, present, motif_absence)
VALUE ("1","1","2025-02-25","1", "malade");

--Liste des abandon
INSERT INTO abandonsloud(abandon_id, enfant_id, date_abandon, statut, carnet_sante, observations)
VALUE ("1","1", "2025-03-12", "transferer", "1", "ok");