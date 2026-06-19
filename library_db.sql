

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
-- Created Member and Borrows tables to library database
CREATE TABLE Member (
    memb_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    memb_type VARCHAR(30),
    memb_date DATE,
    expiry_date DATE
);

CREATE TABLE Borrows (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,

    memb_id INT,
    book_id INT,

    issue_date DATE,
    due_date DATE,
    return_date DATE,

    FOREIGN KEY (memb_id)
    REFERENCES Member(memb_id),

    FOREIGN KEY (book_id)
    REFERENCES Books(book_id)
);


CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);



SHOW TABLES;
