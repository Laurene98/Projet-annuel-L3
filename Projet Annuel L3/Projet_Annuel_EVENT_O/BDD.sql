/*SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE Note DROP FOREIGN KEY fk_idService_Not;

DROP TABLE IF EXISTS Choix;
DROP TABLE IF EXISTS Panier;
DROP TABLE IF EXISTS Utilisateur;
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS Note;
DROP TABLE IF EXISTS Produit;*/

Create table Utilisateur(
    idUtilisateur integer primary key auto_increment not null,
    Nom varchar(20) null, 
    Prenom varchar(20) null,
    Email varchar(255) not null,
    Mdp varchar(20) null,
    identifie boolean not null
);

/*SET FOREIGN_KEY_CHECKS=1;*/


create table Service(
    idService integer primary key auto_increment not null,
    NomC varchar(20) not null,
    PrenomC varchar(20) not null,
    EmailC varchar(255) not null,
    NomS varchar(20) not null,
    CategorieS varchar(20) not null,
    TypeTransport varchar(20) null,
    Capacite integer null,
    Localisation varchar(20) null,
    Parking boolean null,
    Gastronomie varchar(20) null,
    Regime varchar(20) null,
    Candidature boolean not null,
    Suggestion boolean not null 
);

create table Produit(
    idProduit integer primary key auto_increment not null,
    NomP varchar(20) not null,
    Prix integer not null,
    Couleur varchar(20) not null,
    Theme varchar(20) not null,
    Ballon boolean not null,
    Motif varchar(20) not null, 
    Taille varchar(20) not null,
    Suggestion boolean not null
);

create table Panier(
    idPanier integer primary key auto_increment not null,
    valide boolean not null,
    idUtilisateur integer not null,
    constraint fk_idUtilisateur_Pan
        foreign key (idUtilisateur)
        references Utilisateur (idUtilisateur)
);

create table Choix(
    Quantite integer not null,
    idPanier integer not null,
    constraint fk_idPanier_Cho
        foreign key (idPanier)
        references Panier (idPanier),
    idProduit integer not null,
    constraint fk_idProduit_Cho
        foreign key (idProduit)
        references Produit (idProduit)

);

create table Note(
    idNote integer primary key auto_increment not null,
    Note integer not null,
    idProduit integer null,
    constraint fk_idProduit_Not
        foreign key (idProduit)
        references Produit (idProduit),
    idService integer null,
    constraint fk_idService_Not
        foreign key (idService)
        references Service (idService),
    idUtilisateur integer null,
    constraint fk_idUtilisateur_Not
        foreign key (idUtilisateur)
        references Utilisateur (idUtilisateur)
);

create table Commentaire(
    idCommentaire integer primary key auto_increment not null,
    idProduit integer null,
    constraint fk_idProduit_Com
        foreign key (idProduit)
        references Produit (idProduit),
    idService integer null,
    constraint fk_idService_Com
        foreign key (idService)
        references Service (idService),
    idUtilisateur integer null,
    constraint fk_idUtilisateur_Com
        foreign key (idUtilisateur)
        references Utilisateur (idUtilisateur)
);

create table Photos(
    idPhoto integer primary key auto_increment not null,
    Photo blob not null,
    idCommentaire integer not null,
    constraint fk_idCommentaire_Pho
        foreign key (idCommentaire)
        references Commentaire (idcommentaire)
);

create table Favoris(
    idProduit integer null,
    constraint fk_idProduit_Fav
        foreign key (idProduit)
        references Produit (idProduit),
    idService integer null,
    constraint fk_idService_Fav
        foreign key (idService)
        references Service (idService),
    idUtilisateur integer null,
    constraint fk_idUtilisateur_Fav
        foreign key (idUtilisateur)
        references Utilisateur (idUtilisateur)
);

create table Conformite(
    idProduit integer null,
    constraint fk_idProduit_Con
        foreign key (idProduit)
        references Produit (idProduit),
    idService integer null,
    constraint fk_idService_Con
        foreign key (idService)
        references Service (idService),
    idUtilisateur integer null,
    constraint fk_idUtilisateur_Con
        foreign key (idUtilisateur)
        references Utilisateur (idUtilisateur)
);

create table Recommandation(
    idProduit integer null,
    constraint fk_idProduit_Rec
        foreign key (idProduit)
        references Produit (idProduit),
    idService integer null,
    constraint fk_idService_Rec
        foreign key (idService)
        references Service (idService),
    idUtilisateur integer null,
    constraint fk_idUtilisateur_Rec
        foreign key (idUtilisateur)
        references Utilisateur (idUtilisateur)
);