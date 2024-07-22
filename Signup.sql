CREATE DATABASE user_management;
USE user_management;

CREATE TABLE signup (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE login (
    login_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    login_time DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES signup(user_id)
);


--CRUD OP

INSERT INTO signup (username, email, password_hash)
VALUES ('johndoe', 'johndoe@example.com', 'hashed_password');

INSERT INTO login (user_id)
VALUES (1);  


SELECT * FROM signup;

SELECT * FROM login WHERE user_id = 1;  

UPDATE signup
SET email = 'newemail@example.com'
WHERE user_id = 1; 

DELETE FROM login
WHERE user_id = 1;  
 














