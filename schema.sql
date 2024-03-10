-- Create the Database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS Library;

-- Use the Library Database
USE Library;

-- Create the Books Table
CREATE TABLE Books (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  publication_year INT,
  genre VARCHAR(100)
);

-- Create the Authors Table
CREATE TABLE Authors (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

-- Create a Foreign Key relationship between Books and Authors (Optional)
ALTER TABLE Books
  ADD CONSTRAINT fk_author
  FOREIGN KEY (author) REFERENCES Authors(id);

-- Additional Tables (You can add more tables based on your needs)
CREATE TABLE Borrowers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  contact_info VARCHAR(255)
);

CREATE TABLE Loans (
  id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT NOT NULL,
  borrower_id INT NOT NULL,
  loan_date DATE,
  return_date DATE,
  FOREIGN KEY (book_id) REFERENCES Books(id),
  FOREIGN KEY (borrower_id) REFERENCES Borrowers(id)
);
