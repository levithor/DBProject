DROP DATABASE IF EXISTS topgym;
CREATE DATABASE IF NOT EXISTS topgym;
USE topgym;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS 
	customer,
	membership,
    employee,
    equipment,
    gym,
    class,
    signup,
    attendance;

CREATE TABLE membership (
    membership_type	VARCHAR(50)		NOT NULL,
	membership_price	INT			NOT NULL,
    PRIMARY KEY (membership_type)
);

CREATE TABLE customer (
    customer_id     INT				NOT NULL AUTO_INCREMENT,
    first_name      VARCHAR(50)		NOT NULL,
    last_name		VARCHAR(50)		NOT NULL,
    contact			VARCHAR(50)		NOT NULL,
	membership_type	VARCHAR(50)		NOT NULL,
	age				INT				NOT NULL CHECK (age >= 10),
	gender			VARCHAR(50)		NOT NULL,
	FOREIGN KEY (membership_type)	REFERENCES membership (membership_type)	ON DELETE CASCADE,
    PRIMARY KEY (customer_id)
);

CREATE TABLE gym (
    gym_id				INT			NOT NULL AUTO_INCREMENT,
    address				VARCHAR(100)NOT NULL,
    PRIMARY KEY (gym_id)
);
-- salary should be consistent with the role example like a janitor makes 30000 so all janitor should make that much etc
-- multiple employees should have the same gym id because we want there to be multiple workers at each gym
-- roles are cashier(40000 fixed salary), janitor(30000 fixed salary), manager(60000 fixed salary), trainer(50000 fixed salary) people with that role will have that salary
CREATE TABLE employee (
    employee_id			INT			NOT NULL AUTO_INCREMENT,
    first_name			VARCHAR(50)	NOT NULL,
    last_name			VARCHAR(50)	NOT NULL,
    start_date			DATE		NOT NULL,
	end_date			DATE,
	role				VARCHAR(50)	NOT NULL,
	address				VARCHAR(100)NOT NULL,
	contact				VARCHAR(100)NOT NULL,
	age				INT			NOT NULL CHECK (age >= 18),
    	salary				INT			NOT NULL,
	gym_id				INT			NOT NULL,
	FOREIGN KEY (gym_id) REFERENCES gym (gym_id) ON DELETE CASCADE,
    PRIMARY KEY (employee_id)
);

CREATE TABLE equipment (
    equipment_id		INT			NOT NULL AUTO_INCREMENT,
	equipment_name		VARCHAR(50)	NOT NULL,
    brand				VARCHAR(50)	NOT NULL,
    cost				INT         NOT NULL,
    muscle_group        VARCHAR(50) NOT NULL,
	gym_id				INT			NOT NULL,
	FOREIGN KEY (gym_id) REFERENCES gym (gym_id) ON DELETE CASCADE,
    PRIMARY KEY (equipment_id)
);
-- employee_id that has the role trainer can only be allowed to be in class table
CREATE TABLE class (
    class_id            INT         NOT NULL AUTO_INCREMENT,
    class_date          DATE		NOT NULL,
    class_topic			VARCHAR(50)	NOT NULL,
    employee_id         INT         NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id) ON DELETE CASCADE,
    PRIMARY KEY (class_id)
);

CREATE TABLE signup (
    class_id			INT			NOT NULL,
	customer_id			INT			NOT NULL,
	FOREIGN KEY (class_id) REFERENCES class (class_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE,
    PRIMARY KEY (class_id, customer_id)
);

CREATE TABLE attendance (
	attend_date			DATE		NOT NULL,
    gym_id				INT			NOT NULL,
	customer_id			INT			NOT NULL,
	FOREIGN KEY (gym_id) REFERENCES gym (gym_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE,
    PRIMARY KEY (gym_id, customer_id, attend_date)
);
