create database Lab13;

use Lab13;

CREATE TABLE words (
    id INT AUTO_INCREMENT PRIMARY KEY,
    noun VARCHAR(255),
    adjective VARCHAR(255)
);

INSERT INTO words (noun, adjective) VALUES
('cat', 'cute'),
('dog', 'loyal'),
('car', 'fast'),
('tree', 'tall'),
('book', 'interesting'),
('phone', 'smart'),
('house', 'big'),
('lake', 'calm'),
('computer', 'powerful'),
('shirt', 'colorful');

Deli