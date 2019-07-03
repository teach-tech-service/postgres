DROP TABLE IF EXISTS Ksiazka_Autorzy;
DROP TABLE IF EXISTS Ksiazka;
DROP TABLE IF EXISTS Autorzy;
DROP TABLE IF EXISTS Gatunek;

CREATE TABLE Gatunek(
   gatunek_id serial PRIMARY KEY,
   nazwa_gatunku VARCHAR (100) NOT NULL
);

CREATE TABLE Ksiazka(
   ksiazka_id serial PRIMARY KEY,
   isbn VARCHAR (13) UNIQUE NOT NULL,
   tytul VARCHAR (100) NOT NULL,
   gatunek_ksiazki INTEGER,
   cena NUMERIC (7,2) NOT NULL,
   data_wydania DATE NOT NULL,
   FOREIGN KEY (gatunek_ksiazki) REFERENCES Gatunek(gatunek_id)
);

CREATE TABLE Autorzy(
   autor_id serial PRIMARY KEY,
   imie VARCHAR (100) NOT NULL,
   nazwisko VARCHAR (100) NOT NULL
);

CREATE TABLE Ksiazka_Autorzy (
  ksiazka_id int NOT NULL,
  autor_id int NOT NULL,
  PRIMARY KEY (ksiazka_id, autor_id),
  FOREIGN KEY (ksiazka_id) REFERENCES Ksiazka(ksiazka_id) ON UPDATE CASCADE,
  FOREIGN KEY (autor_id) REFERENCES Autorzy(autor_id) ON UPDATE CASCADE
);

