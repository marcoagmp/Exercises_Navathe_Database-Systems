--
-- Estrutura da tabela `BORROWER`
--
CREATE TABLE BORROWER (
    Card_no INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(20)
);

--
-- Estrutura da tabela `PUBLISHER`
--
CREATE TABLE PUBLISHER (
    Name VARCHAR(100) PRIMARY KEY,
    Address VARCHAR(255),
    Phone VARCHAR(20)
);

--
-- Estrutura da tabela `LIBRARY_BRANCH`
--
CREATE TABLE LIBRARY_BRANCH (
    Branch_id INT PRIMARY KEY,
    Branch_name VARCHAR(100),
    Address VARCHAR(255)
);

--
-- Estrutura da tabela `BOOK`
--
CREATE TABLE BOOK (
    Book_id INT PRIMARY KEY,
    Title VARCHAR(255),
    Publisher_name VARCHAR(100),
    FOREIGN KEY (Publisher_name) 
        REFERENCES PUBLISHER(Name) 
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

--
-- Estrutura da tabela `BOOK_AUTHORS`
--
CREATE TABLE BOOK_AUTHORS (
    Book_id INT,
    Author_name VARCHAR(100),
    PRIMARY KEY (Book_id, Author_name),
    FOREIGN KEY (Book_id) 
        REFERENCES BOOK(Book_id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

--
-- Estrutura da tabela `BOOK_COPIES`
--
CREATE TABLE BOOK_COPIES (
    Book_id INT,
    Branch_id INT,
    No_of_copies INT,
    PRIMARY KEY (Book_id, Branch_id),
    FOREIGN KEY (Book_id) 
        REFERENCES BOOK(Book_id) 
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (Branch_id) 
        REFERENCES LIBRARY_BRANCH(Branch_id) 
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

--
-- Estrutura da tabela `BOOK_LOANS`
--
CREATE TABLE BOOK_LOANS (
    Book_id INT,
    Branch_id INT,
    Card_no INT,
    Date_out DATE,
    Due_date DATE,
    PRIMARY KEY (Book_id, Branch_id, Card_no),
    FOREIGN KEY (Book_id) 
        REFERENCES BOOK(Book_id) 
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (Branch_id) 
        REFERENCES LIBRARY_BRANCH(Branch_id) 
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (Card_no) 
        REFERENCES BORROWER(Card_no) 
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
