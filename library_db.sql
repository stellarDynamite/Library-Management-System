

CREATE TABLE Librarian (
    librarian_id INT PRIMARY KEY,
    librarian_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

ALTER TABLE Borrows
ADD COLUMN librarian_id INT;

ALTER TABLE Borrows
ADD CONSTRAINT fk_borrow_librarian
FOREIGN KEY (librarian_id)
REFERENCES Librarian(librarian_id);

CREATE TABLE Fine (
    fine_id INT PRIMARY KEY,
    borrow_id INT NOT NULL,
    amount DECIMAL(8,2) NOT NULL,
    status VARCHAR(20),

    FOREIGN KEY (borrow_id)
        REFERENCES Borrows(borrow_id)
);

CREATE DATABASE library_management_system;
USE library_management_system;

CREATE TABLE Publisher (
    pub_id INT PRIMARY KEY,
    pub_name VARCHAR(100) NOT NULL,
    address VARCHAR(200)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DECIMAL(8,2),
    available_copies INT,
    pub_id INT,

    FOREIGN KEY (pub_id)
    REFERENCES Publisher(pub_id)
);


SHOW TABLES;
