

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

SHOW TABLES;
