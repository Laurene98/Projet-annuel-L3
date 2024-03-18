CREATE TABLE Adherents (
    nom             VARCHAR (20),
    prenom          VARCHAR (20),
    fin_adhesion    DATE,
    PRIMARY KEY (nom, prenom)
);

CREATE TABLE Salles (
    numero          INTEGER         PRIMARY KEY,
    etage           INTEGER         NOT NULL,
    capacite        INTEGER
);

CREATE TABLE Activites (
    nom             VARCHAR (20),
    jour            VARCHAR (8),
    duree           NUMERIC        NOT NULL,
    heure           TIME           NOT NULL,
    salle           INTEGER        REFERENCES Salles(numero),
    PRIMARY KEY (nom, jour)
);

CREATE TABLE Inscriptions (
    nom             VARCHAR (20),
    prenom          VARCHAR (20),
    activite        VARCHAR (20),
    jour            VARCHAR (8),
    PRIMARY KEY (nom, prenom, activite, jour),
    FOREIGN KEY (nom, prenom) REFERENCES Adherents(nom, prenom),
    FOREIGN KEY (activite, jour) REFERENCES Activites(nom, jour)
);
