
-- Dump File for topgym Database
DROP DATABASE IF EXISTS topgym;
CREATE DATABASE IF NOT EXISTS topgym;
USE topgym;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

-- DROP all tables if they exist
DROP TABLE IF EXISTS 
    customer,
    membership,
    employee,
    equipment,
    gym,
    class,
    signup,
    attendance;

-- Creating membership table
CREATE TABLE membership (
    membership_type VARCHAR(50) NOT NULL,
    membership_price INT NOT NULL,
    PRIMARY KEY (membership_type)
);

-- Creating customer table
CREATE TABLE customer (
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    contact VARCHAR(50) NOT NULL,
    membership_type VARCHAR(50) NOT NULL,
    age INT NOT NULL CHECK (age >= 10),
    gender VARCHAR(50) NOT NULL,
    FOREIGN KEY (membership_type) REFERENCES membership (membership_type) ON DELETE CASCADE,
    PRIMARY KEY (customer_id)
);

-- Creating gym table
CREATE TABLE gym (
    gym_id INT NOT NULL AUTO_INCREMENT,
    address VARCHAR(100) NOT NULL,
    PRIMARY KEY (gym_id)
);

-- Creating employee table
CREATE TABLE employee (
    employee_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    role VARCHAR(50) NOT NULL,
    address VARCHAR(100) NOT NULL,
    contact VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK (age >= 18),
    salary INT NOT NULL,
    gym_id INT NOT NULL,
    FOREIGN KEY (gym_id) REFERENCES gym (gym_id) ON DELETE CASCADE,
    PRIMARY KEY (employee_id)
);

-- Creating equipment table
CREATE TABLE equipment (
    equipment_id INT NOT NULL AUTO_INCREMENT,
    equipment_name VARCHAR(50) NOT NULL,
    brand VARCHAR(50) NOT NULL,
    cost INT NOT NULL,
    muscle_group VARCHAR(50) NOT NULL,
    gym_id INT NOT NULL,
    FOREIGN KEY (gym_id) REFERENCES gym (gym_id) ON DELETE CASCADE,
    PRIMARY KEY (equipment_id)
);

-- Creating class table
CREATE TABLE class (
    class_id INT NOT NULL AUTO_INCREMENT,
    class_date DATE NOT NULL,
    class_topic VARCHAR(50) NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id) ON DELETE CASCADE,
    PRIMARY KEY (class_id)
);

-- Creating signup table
CREATE TABLE signup (
    class_id INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE,
    PRIMARY KEY (class_id, customer_id)
);

-- Creating attendance table
CREATE TABLE attendance (
    attend_date DATE NOT NULL,
    gym_id INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (gym_id) REFERENCES gym (gym_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE,
    PRIMARY KEY (gym_id, customer_id, attend_date)
);

-- Insert data into membership table
INSERT INTO membership (membership_type, membership_price) VALUES 
('Basic', 20),
('Premium', 50),
('VIP', 100);

-- Insert data into gym table
INSERT INTO gym (address) VALUES
('123 Main St'),
('456 Elm St'),
('789 Maple Ave'),
('321 Oak St'),
('654 Pine Blvd'),
('987 Cedar Lane'),
('741 Birch Rd'),
('852 Aspen Ct'),
('963 Redwood St'),
('147 Spruce Cir');

-- Insert data into employee table
INSERT INTO employee (first_name, last_name, start_date, end_date, role, address, contact, age, salary, gym_id) VALUES
('Jane', 'Smith', '2021-01-01', NULL, 'cashier', '456 Gym Lane', '555-5678', 30, 40000, 1),
('John', 'Doe', '2020-03-15', NULL, 'janitor', '123 Gym Rd', '555-1234', 45, 30000, 2),
('Emily', 'Brown', '2019-06-22', NULL, 'manager', '789 Work St', '555-9876', 38, 60000, 3),
('Michael', 'Johnson', '2021-07-30', NULL, 'trainer', '321 Fit Ave', '555-6543', 28, 50000, 4),
('Sarah', 'Davis', '2018-02-19', NULL, 'cashier', '654 Muscle Blvd', '555-4567', 25, 40000, 5),
('David', 'Martinez', '2020-11-25', NULL, 'janitor', '987 Strength Lane', '555-7654', 40, 30000, 6),
('Sophia', 'Wilson', '2022-04-12', NULL, 'manager', '741 Speed Rd', '555-2468', 35, 60000, 7),
('James', 'Anderson', '2017-05-08', NULL, 'trainer', '852 Power Ct', '555-1357', 29, 50000, 8),
('Olivia', 'Garcia', '2019-09-16', NULL, 'cashier', '963 Muscle St', '555-9753', 32, 40000, 9),
('William', 'Taylor', '2021-12-05', NULL, 'janitor', '147 Fitness Cir', '555-8642', 50, 30000, 10),
('Benjamin', 'Lee', '2022-01-12', NULL, 'cashier', '123 Fit St', '555-1111', 31, 40000, 1),
('Mia', 'Clark', '2019-03-30', NULL, 'janitor', '456 Strength Ln', '555-2222', 42, 30000, 2),
('Ethan', 'White', '2018-09-01', NULL, 'manager', '789 Power Ave', '555-3333', 37, 60000, 3),
('Alexander', 'Harris', '2020-06-21', NULL, 'trainer', '321 Speed Blvd', '555-4444', 27, 50000, 4),
('Isabella', 'Young', '2017-11-13', NULL, 'cashier', '654 Flex Rd', '555-5555', 28, 40000, 5),
('Jacob', 'King', '2021-04-25', NULL, 'janitor', '987 Muscle Cir', '555-6666', 44, 30000, 6),
('Mason', 'Wright', '2019-10-08', NULL, 'manager', '741 Work Blvd', '555-7777', 36, 60000, 7),
('Charlotte', 'Lopez', '2022-03-18', NULL, 'trainer', '852 Fit Ct', '555-8888', 30, 50000, 8),
('Ava', 'Hill', '2018-12-07', NULL, 'cashier', '963 Gym Ave', '555-9999', 33, 40000, 9),
('Logan', 'Scott', '2021-02-15', NULL, 'janitor', '147 Strength Ln', '555-0101', 48, 30000, 10),
('Lucas', 'Green', '2019-08-22', NULL, 'manager', '123 Fitness Blvd', '555-0202', 40, 60000, 1),
('Sophia', 'Adams', '2020-09-27', NULL, 'trainer', '456 Gym Cir', '555-0303', 26, 50000, 2),
('Ella', 'Baker', '2018-05-19', NULL, 'cashier', '789 Strength St', '555-0404', 29, 40000, 3),
('Oliver', 'Nelson', '2017-07-14', NULL, 'janitor', '321 Power Rd', '555-0505', 47, 30000, 4),
('Amelia', 'Carter', '2021-03-03', NULL, 'manager', '654 Fit Cir', '555-0606', 39, 60000, 5),
('Jack', 'Mitchell', '2020-12-25', NULL, 'trainer', '987 Work Ave', '555-0707', 31, 50000, 6),
('Henry', 'Perez', '2019-11-10', NULL, 'cashier', '741 Muscle Ln', '555-0808', 34, 40000, 7),
('Lily', 'Roberts', '2022-07-22', NULL, 'janitor', '852 Flex Blvd', '555-0909', 46, 30000, 8),
('Noah', 'Turner', '2021-08-30', NULL, 'manager', '963 Speed Ave', '555-1010', 38, 60000, 9),
('Grace', 'Phillips', '2020-01-15', NULL, 'trainer', '147 Work Cir', '555-1111', 29, 50000, 10),
('Liam', 'Campbell', '2018-10-03', NULL, 'cashier', '123 Flex St', '555-1212', 32, 40000, 1),
('Chloe', 'Parker', '2017-09-20', NULL, 'janitor', '456 Power Cir', '555-1313', 43, 30000, 2),
('Emma', 'Evans', '2019-07-16', NULL, 'manager', '789 Muscle Blvd', '555-1414', 37, 60000, 3),
('Daniel', 'Edwards', '2020-11-02', NULL, 'trainer', '321 Strength Rd', '555-1515', 27, 50000, 4),
('Olivia', 'Collins', '2018-04-11', NULL, 'cashier', '654 Gym Ave', '555-1616', 28, 40000, 5),
('James', 'Stewart', '2021-05-23', NULL, 'janitor', '987 Fitness Ln', '555-1717', 45, 30000, 6),
('Aiden', 'Sanchez', '2019-09-29', NULL, 'manager', '741 Speed Cir', '555-1818', 38, 60000, 7),
('Evelyn', 'Morris', '2020-06-14', NULL, 'trainer', '852 Strength Blvd', '555-1919', 26, 50000, 8),
('Harper', 'Rogers', '2021-11-06', NULL, 'cashier', '963 Power Rd', '555-2020', 31, 40000, 9),
('Matthew', 'Reed', '2018-08-25', NULL, 'janitor', '147 Muscle Ln', '555-2121', 41, 30000, 10),
('Sofia', 'Cook', '2019-10-30', NULL, 'manager', '123 Speed St', '555-2222', 36, 60000, 1),
('Jacob', 'Morgan', '2022-02-18', NULL, 'trainer', '456 Fit Cir', '555-2323', 30, 50000, 2),
('Scarlett', 'Bell', '2021-12-12', NULL, 'cashier', '789 Power Blvd', '555-2424', 33, 40000, 3),
('Ella', 'Murphy', '2017-06-04', NULL, 'janitor', '321 Work Cir', '555-2525', 46, 30000, 4),
('Mason', 'Bailey', '2020-10-11', NULL, 'manager', '654 Flex Ln', '555-2626', 39, 60000, 5),
('Zoe', 'Rivera', '2019-02-28', NULL, 'trainer', '987 Gym Rd', '555-2727', 29, 50000, 6),
('Samuel', 'Cooper', '2018-03-09', NULL, 'cashier', '741 Strength Ave', '555-2828', 32, 40000, 7),
('Avery', 'Richardson', '2021-04-22', NULL, 'janitor', '852 Muscle Cir', '555-2929', 44, 30000, 8),
('Victoria', 'Howard', '2020-01-26', NULL, 'manager', '963 Power St', '555-3030', 38, 60000, 9),
('Isaac', 'Ward', '2022-05-10', NULL, 'trainer', '147 Speed Blvd', '555-3131', 27, 50000, 10),
('Eleanor', 'Cox', '2019-12-09', NULL, 'cashier', '123 Flex Cir', '555-3232', 34, 40000, 1),
('Nathan', 'Brooks', '2018-07-18', NULL, 'janitor', '456 Fitness Blvd', '555-3333', 42, 30000, 2),
('Layla', 'Gray', '2021-02-11', NULL, 'manager', '789 Muscle St', '555-3434', 37, 60000, 3),
('Ryan', 'James', '2020-03-27', NULL, 'trainer', '321 Gym Ln', '555-3535', 26, 50000, 4),
('Lillian', 'Watson', '2021-06-05', NULL, 'cashier', '654 Strength Cir', '555-3636', 31, 40000, 5),
('Dylan', 'Hughes', '2019-04-21', NULL, 'janitor', '987 Power Ave', '555-3737', 45, 30000, 6),
('Hannah', 'Price', '2020-08-15', NULL, 'manager', '741 Fit St', '555-3838', 38, 60000, 7),
('Caleb', 'Wood', '2017-12-03', NULL, 'trainer', '852 Strength Ln', '555-3939', 28, 50000, 8),
('Madelyn', 'Barnes', '2018-01-08', NULL, 'cashier', '963 Power Cir', '555-4040', 32, 40000, 9),
('Levi', 'Bennett', '2021-09-07', NULL, 'janitor', '147 Gym Blvd', '555-4141', 47, 30000, 10),
('Abigail', 'Flores', '2019-01-19', NULL, 'manager', '123 Work Rd', '555-4242', 39, 60000, 1),
('Victoria', 'Sanders', '2018-02-24', NULL, 'trainer', '456 Flex St', '555-4343', 27, 50000, 2),
('David', 'Ross', '2020-09-17', NULL, 'cashier', '789 Fitness Cir', '555-4444', 29, 40000, 3),
('Madison', 'Coleman', '2022-06-18', NULL, 'janitor', '321 Strength Blvd', '555-4545', 46, 30000, 4),
('Elijah', 'Jenkins', '2018-11-23', NULL, 'manager', '654 Speed Rd', '555-4646', 36, 60000, 5),
('Scarlett', 'Perry', '2021-03-31', NULL, 'trainer', '987 Flex Cir', '555-4747', 28, 50000, 6),
('Hunter', 'Powell', '2020-07-19', NULL, 'cashier', '741 Muscle Ln', '555-4848', 30, 40000, 7),
('Ella', 'Long', '2022-08-28', NULL, 'janitor', '852 Power St', '555-4949', 43, 30000, 8),
('Luke', 'Patterson', '2019-05-22', NULL, 'manager', '963 Fitness Cir', '555-5050', 40, 60000, 9),
('Zoe', 'Henderson', '2020-12-13', NULL, 'trainer', '147 Work Ln', '555-5151', 26, 50000, 10),
('Leah', 'Myers', '2021-01-01', NULL, 'cashier', '123 Flex Ln', '555-5252', 32, 40000, 1),
('Gabriel', 'Alexander', '2018-09-24', NULL, 'janitor', '456 Gym Blvd', '555-5353', 45, 30000, 2),
('Audrey', 'Gonzalez', '2019-02-14', NULL, 'manager', '789 Speed St', '555-5454', 39, 60000, 3),
('Isaac', 'Griffin', '2020-11-28', NULL, 'trainer', '321 Strength Cir', '555-5555', 28, 50000, 4),
('Wyatt', 'Gutierrez', '2021-07-12', NULL, 'cashier', '654 Power Blvd', '555-5656', 30, 40000, 5),
('Samantha', 'Foster', '2022-02-09', NULL, 'janitor', '987 Flex Ln', '555-5757', 44, 30000, 6),
('Liam', 'Jennings', '2018-05-04', NULL, 'manager', '741 Muscle Ave', '555-5858', 38, 60000, 7),
('Elizabeth', 'Hayes', '2019-06-15', NULL, 'trainer', '852 Gym St', '555-5959', 27, 50000, 8),
('Charlotte', 'Dunn', '2020-04-26', NULL, 'cashier', '963 Flex Rd', '555-6060', 31, 40000, 9),
('Grayson', 'Palmer', '2017-11-16', NULL, 'janitor', '147 Strength Blvd', '555-6161', 48, 30000, 10),
('Aubrey', 'Grant', '2021-09-29', NULL, 'manager', '123 Speed Cir', '555-6262', 37, 60000, 1),
('Christopher', 'Knight', '2018-08-05', NULL, 'trainer', '456 Work Ln', '555-6363', 28, 50000, 2),
('Eleanor', 'Sullivan', '2022-03-21', NULL, 'cashier', '789 Power Cir', '555-6464', 33, 40000, 3),
('Oliver', 'Mitchell', '2019-12-02', NULL, 'janitor', '321 Gym Rd', '555-6565', 47, 30000, 4),
('Penelope', 'Stevens', '2020-10-30', NULL, 'manager', '654 Strength Ln', '555-6666', 40, 60000, 5),
('Ethan', 'Parker', '2021-07-24', NULL, 'trainer', '987 Flex Cir', '555-6767', 29, 50000, 6),
('Luna', 'Cole', '2018-03-18', NULL, 'cashier', '741 Muscle Ave', '555-6868', 32, 40000, 7),
('Owen', 'Russell', '2020-05-01', NULL, 'janitor', '852 Gym Blvd', '555-6969', 43, 30000, 8),
('Stella', 'Moore', '2019-11-25', NULL, 'manager', '963 Power Cir', '555-7070', 39, 60000, 9),
('Logan', 'Ramirez', '2022-04-29', NULL, 'trainer', '147 Work Ln', '555-7171', 27, 50000, 10);


-- Truncated for brevity...


-- Insert data into customer table
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Ava', 'Johnson', '555-8557', 'Basic', 29, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Miller', '555-3342', 'Premium', 21, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Ava', 'Jones', '555-8091', 'Basic', 51, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('James', 'Davis', '555-5949', 'Basic', 20, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Emma', 'Davis', '555-8093', 'Basic', 27, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('James', 'Brown', '555-5050', 'VIP', 18, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Taylor', '555-8625', 'Basic', 26, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Noah', 'Williams', '555-9490', 'Basic', 12, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('James', 'Davis', '555-6703', 'Basic', 29, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Sophia', 'Lopez', '555-8293', 'VIP', 50, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('James', 'Garcia', '555-7433', 'Basic', 35, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Miller', '555-6152', 'Premium', 36, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Emma', 'Brown', '555-1406', 'Basic', 49, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Oliver', 'Davis', '555-4164', 'VIP', 50, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Liam', 'Williams', '555-3881', 'Basic', 56, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Ava', 'Jones', '555-8256', 'Basic', 29, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Noah', 'Davis', '555-8622', 'Basic', 60, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('James', 'Garcia', '555-6866', 'Basic', 26, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Oliver', 'Taylor', '555-9192', 'Basic', 11, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Liam', 'Miller', '555-7895', 'Premium', 15, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Taylor', '555-4056', 'Basic', 43, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Oliver', 'Williams', '555-3164', 'VIP', 26, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Sophia', 'Lopez', '555-3171', 'Basic', 30, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Noah', 'Taylor', '555-6541', 'Basic', 18, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Davis', '555-2853', 'Basic', 21, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Emma', 'Johnson', '555-2477', 'Basic', 51, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('James', 'Lopez', '555-3860', 'Premium', 11, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Garcia', '555-2428', 'VIP', 47, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Oliver', 'Miller', '555-6874', 'Basic', 36, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Ava', 'Lopez', '555-7792', 'Basic', 54, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Davis', '555-5869', 'Basic', 31, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Sophia', 'Brown', '555-6708', 'Premium', 33, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Noah', 'Williams', '555-4340', 'Basic', 51, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Ava', 'Johnson', '555-9065', 'Basic', 17, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Taylor', '555-7995', 'VIP', 11, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Emma', 'Martinez', '555-8724', 'Basic', 53, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Miller', '555-3927', 'Basic', 59, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Davis', '555-5154', 'Basic', 38, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Liam', 'Lopez', '555-6243', 'Basic', 51, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Liam', 'Martinez', '555-6507', 'Basic', 29, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Noah', 'Garcia', '555-5778', 'VIP', 59, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Martinez', '555-7226', 'Premium', 59, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Noah', 'Jones', '555-5417', 'Basic', 41, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Ava', 'Williams', '555-9633', 'Basic', 32, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Martinez', '555-7094', 'Basic', 47, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Davis', '555-8597', 'Premium', 44, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Elijah', 'Miller', '555-9486', 'VIP', 47, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Ava', 'Garcia', '555-3441', 'Basic', 24, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Jones', '555-9730', 'Basic', 57, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Emma', 'Taylor', '555-6915', 'Basic', 57, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Noah', 'Miller', '555-8725', 'Basic', 59, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Emma', 'Martinez', '555-3735', 'Basic', 37, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Taylor', '555-8652', 'Basic', 32, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Johnson', '555-5517', 'Premium', 22, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Emma', 'Garcia', '555-6999', 'VIP', 60, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Sophia', 'Lopez', '555-1048', 'Basic', 53, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('James', 'Davis', '555-5897', 'Basic', 46, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Ava', 'Davis', '555-6412', 'Basic', 16, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Emma', 'Johnson', '555-5678', 'Basic', 36, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Sophia', 'Brown', '555-7125', 'Premium', 45, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Oliver', 'Miller', '555-2592', 'Basic', 34, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Oliver', 'Davis', '555-6792', 'Basic', 48, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Lopez', '555-2554', 'Basic', 44, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Lopez', '555-9227', 'VIP', 25, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Oliver', 'Martinez', '555-9071', 'Basic', 10, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Elijah', 'Miller', '555-4852', 'Premium', 18, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Liam', 'Miller', '555-2791', 'Basic', 21, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('James', 'Jones', '555-9772', 'Basic', 45, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Jones', '555-9197', 'Basic', 36, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Brown', '555-7181', 'Basic', 11, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Elijah', 'Jones', '555-7143', 'VIP', 46, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Liam', 'Davis', '555-8615', 'VIP', 55, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Oliver', 'Jones', '555-8332', 'Basic', 22, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Oliver', 'Martinez', '555-1005', 'Premium', 60, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Sophia', 'Taylor', '555-7217', 'Basic', 38, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Noah', 'Johnson', '555-7699', 'Basic', 47, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Garcia', '555-8076', 'Basic', 17, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Emma', 'Garcia', '555-2376', 'Premium', 46, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Noah', 'Brown', '555-1589', 'Basic', 59, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Brown', '555-5843', 'VIP', 28, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Ava', 'Taylor', '555-9642', 'Basic', 43, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Sophia', 'Williams', '555-9082', 'Basic', 56, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Ava', 'Brown', '555-5517', 'Basic', 46, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('James', 'Williams', '555-7606', 'Premium', 28, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Jones', '555-4829', 'Basic', 51, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Miller', '555-9399', 'Basic', 56, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Sophia', 'Martinez', '555-8212', 'Premium', 25, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Mia', 'Lopez', '555-6539', 'Basic', 19, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Elijah', 'Miller', '555-7986', 'VIP', 47, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Martinez', '555-2688', 'Basic', 26, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Liam', 'Martinez', '555-2459', 'Basic', 57, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Emma', 'Davis', '555-2413', 'Premium', 52, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Jones', '555-8174', 'VIP', 58, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Ava', 'Johnson', '555-3761', 'Basic', 53, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Jones', '555-5828', 'Basic', 24, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Emma', 'Davis', '555-6876', 'Basic', 34, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Miller', '555-2154', 'VIP', 38, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('James', 'Taylor', '555-7009', 'Premium', 59, 'Male');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Liam', 'Taylor', '555-7261', 'Basic', 48, 'Female');
INSERT INTO customer (first_name, last_name, contact, membership_type, age, gender) VALUES ('Isabella', 'Garcia', '555-7185', 'Basic', 25, 'Female');

-- Insert data into equipment table
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Bench Press', 'StrongCo', 1633, 'Legs', 1);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Squat Rack', 'MuscleMaker', 2996, 'Arms', 7);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Squat Rack', 'StrongCo', 2055, 'Back', 9);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Squat Rack', 'MuscleMaker', 2957, 'Arms', 1);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Bench Press', 'MuscleMaker', 722, 'Core', 5);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Rowing Machine', 'FitBrand', 2421, 'Chest', 5);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Treadmill', 'FitBrand', 1696, 'Core', 9);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Treadmill', 'FitBrand', 1717, 'Core', 9);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Dumbbell', 'FitBrand', 775, 'Legs', 3);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Dumbbell', 'FitBrand', 2406, 'Back', 1);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Rowing Machine', 'EndurancePro', 807, 'Chest', 7);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Bench Press', 'MuscleMaker', 1198, 'Chest', 7);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Rowing Machine', 'FitBrand', 2229, 'Legs', 4);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Bench Press', 'FitBrand', 883, 'Core', 9);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Rowing Machine', 'StrongCo', 2084, 'Chest', 10);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Squat Rack', 'FitBrand', 557, 'Arms', 6);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Rowing Machine', 'EndurancePro', 733, 'Core', 1);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Dumbbell', 'FitBrand', 2917, 'Back', 3);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Rowing Machine', 'EndurancePro', 2345, 'Arms', 6);
INSERT INTO equipment (equipment_name, brand, cost, muscle_group, gym_id) VALUES ('Squat Rack', 'EndurancePro', 772, 'Core', 9);

-- Insert data into class table
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-04-02', 'CrossFit', 90);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-06-17', 'Bodybuilding', 86);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2023-09-21', 'Yoga', 82);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-12-02', 'CrossFit', 78);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-04-27', 'CrossFit', 74);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2020-02-28', 'Yoga', 70);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2023-08-15', 'CrossFit', 66);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-06-23', 'Yoga', 62);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2023-04-06', 'Yoga', 58);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2020-11-22', 'Pilates', 54);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-04-03', 'Yoga', 50);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2023-07-10', 'Aerobics', 46);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-09-26', 'CrossFit', 42);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2023-10-31', 'Bodybuilding', 30);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-06-14', 'CrossFit', 26);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-11-06', 'Pilates', 22);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-09-19', 'Aerobics', 18);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2020-04-06', 'Aerobics', 14);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-03-25', 'Pilates', 8);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2023-06-08', 'Aerobics', 4);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2020-09-26', 'Bodybuilding', 90);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-04-06', 'CrossFit', 86);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2023-11-27', 'Pilates', 82);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-08-14', 'CrossFit', 78);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2020-07-09', 'Bodybuilding', 74);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2020-05-23', 'Yoga', 70);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-05-05', 'CrossFit', 66);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2020-05-05', 'Yoga', 62);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-11-09', 'CrossFit', 58);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-04-07', 'Pilates', 54);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2023-08-25', 'Aerobics', 50);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-05-23', 'Yoga', 46);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-04-23', 'Aerobics', 42);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-01-05', 'Bodybuilding', 30);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2023-07-24', 'Pilates', 26);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-05-17', 'CrossFit', 22);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-06-05', 'Yoga', 18);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2020-12-02', 'CrossFit', 14);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2020-01-21', 'Bodybuilding', 8);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-05-02', 'Bodybuilding', 4);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-12-28', 'Bodybuilding', 90);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2022-10-19', 'Bodybuilding', 86);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-02-20', 'Yoga', 82);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2023-10-25', 'CrossFit', 78);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2023-03-27', 'Yoga', 74);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-04-28', 'Bodybuilding', 70);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2020-03-22', 'Aerobics', 66);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2023-08-04', 'Pilates', 62);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2020-07-07', 'Bodybuilding', 58);
INSERT INTO class (class_date, class_topic, employee_id) VALUES ('2021-12-12', 'Yoga', 54);


-- Insert data into signup table
INSERT INTO signup (class_id, customer_id) VALUES (24, 6);
INSERT INTO signup (class_id, customer_id) VALUES (25, 2);
INSERT INTO signup (class_id, customer_id) VALUES (50, 17);
INSERT INTO signup (class_id, customer_id) VALUES (36, 10);
INSERT INTO signup (class_id, customer_id) VALUES (42, 2);
INSERT INTO signup (class_id, customer_id) VALUES (29, 94);
INSERT INTO signup (class_id, customer_id) VALUES (35, 31);
INSERT INTO signup (class_id, customer_id) VALUES (29, 11);
INSERT INTO signup (class_id, customer_id) VALUES (11, 72);
INSERT INTO signup (class_id, customer_id) VALUES (40, 1);
INSERT INTO signup (class_id, customer_id) VALUES (10, 41);
INSERT INTO signup (class_id, customer_id) VALUES (9, 91);
INSERT INTO signup (class_id, customer_id) VALUES (10, 78);
INSERT INTO signup (class_id, customer_id) VALUES (15, 41);
INSERT INTO signup (class_id, customer_id) VALUES (34, 22);
INSERT INTO signup (class_id, customer_id) VALUES (46, 42);
INSERT INTO signup (class_id, customer_id) VALUES (47, 25);
INSERT INTO signup (class_id, customer_id) VALUES (4, 64);
INSERT INTO signup (class_id, customer_id) VALUES (18, 51);
INSERT INTO signup (class_id, customer_id) VALUES (31, 20);
INSERT INTO signup (class_id, customer_id) VALUES (10, 1);
INSERT INTO signup (class_id, customer_id) VALUES (18, 79);
INSERT INTO signup (class_id, customer_id) VALUES (41, 12);
INSERT INTO signup (class_id, customer_id) VALUES (24, 29);
INSERT INTO signup (class_id, customer_id) VALUES (5, 46);
INSERT INTO signup (class_id, customer_id) VALUES (29, 52);
INSERT INTO signup (class_id, customer_id) VALUES (11, 76);
INSERT INTO signup (class_id, customer_id) VALUES (24, 67);
INSERT INTO signup (class_id, customer_id) VALUES (47, 37);
INSERT INTO signup (class_id, customer_id) VALUES (22, 76);
INSERT INTO signup (class_id, customer_id) VALUES (14, 76);
INSERT INTO signup (class_id, customer_id) VALUES (24, 97);
INSERT INTO signup (class_id, customer_id) VALUES (33, 100);
INSERT INTO signup (class_id, customer_id) VALUES (7, 71);
INSERT INTO signup (class_id, customer_id) VALUES (7, 73);
INSERT INTO signup (class_id, customer_id) VALUES (17, 24);
INSERT INTO signup (class_id, customer_id) VALUES (48, 7);
INSERT INTO signup (class_id, customer_id) VALUES (20, 15);
INSERT INTO signup (class_id, customer_id) VALUES (35, 32);
INSERT INTO signup (class_id, customer_id) VALUES (24, 91);
INSERT INTO signup (class_id, customer_id) VALUES (47, 69);
INSERT INTO signup (class_id, customer_id) VALUES (13, 48);
INSERT INTO signup (class_id, customer_id) VALUES (12, 51);
INSERT INTO signup (class_id, customer_id) VALUES (8, 26);
INSERT INTO signup (class_id, customer_id) VALUES (38, 100);
INSERT INTO signup (class_id, customer_id) VALUES (16, 35);
INSERT INTO signup (class_id, customer_id) VALUES (45, 58);
INSERT INTO signup (class_id, customer_id) VALUES (42, 86);
INSERT INTO signup (class_id, customer_id) VALUES (2, 58);
INSERT INTO signup (class_id, customer_id) VALUES (34, 81);
INSERT INTO signup (class_id, customer_id) VALUES (10, 68);
INSERT INTO signup (class_id, customer_id) VALUES (34, 10);
INSERT INTO signup (class_id, customer_id) VALUES (40, 93);
INSERT INTO signup (class_id, customer_id) VALUES (21, 67);
INSERT INTO signup (class_id, customer_id) VALUES (34, 71);
INSERT INTO signup (class_id, customer_id) VALUES (26, 6);
INSERT INTO signup (class_id, customer_id) VALUES (47, 47);
INSERT INTO signup (class_id, customer_id) VALUES (42, 52);
INSERT INTO signup (class_id, customer_id) VALUES (40, 64);
INSERT INTO signup (class_id, customer_id) VALUES (17, 23);
INSERT INTO signup (class_id, customer_id) VALUES (15, 74);
INSERT INTO signup (class_id, customer_id) VALUES (46, 52);
INSERT INTO signup (class_id, customer_id) VALUES (34, 78);
INSERT INTO signup (class_id, customer_id) VALUES (40, 97);
INSERT INTO signup (class_id, customer_id) VALUES (4, 29);
INSERT INTO signup (class_id, customer_id) VALUES (31, 3);
INSERT INTO signup (class_id, customer_id) VALUES (23, 52);
INSERT INTO signup (class_id, customer_id) VALUES (33, 69);
INSERT INTO signup (class_id, customer_id) VALUES (3, 37);
INSERT INTO signup (class_id, customer_id) VALUES (5, 92);
INSERT INTO signup (class_id, customer_id) VALUES (44, 76);
INSERT INTO signup (class_id, customer_id) VALUES (27, 17);
INSERT INTO signup (class_id, customer_id) VALUES (30, 3);
INSERT INTO signup (class_id, customer_id) VALUES (16, 36);
INSERT INTO signup (class_id, customer_id) VALUES (7, 56);
INSERT INTO signup (class_id, customer_id) VALUES (40, 43);
INSERT INTO signup (class_id, customer_id) VALUES (49, 30);
INSERT INTO signup (class_id, customer_id) VALUES (35, 24);
INSERT INTO signup (class_id, customer_id) VALUES (30, 27);
INSERT INTO signup (class_id, customer_id) VALUES (48, 28);
INSERT INTO signup (class_id, customer_id) VALUES (6, 35);
INSERT INTO signup (class_id, customer_id) VALUES (15, 3);
INSERT INTO signup (class_id, customer_id) VALUES (44, 92);
INSERT INTO signup (class_id, customer_id) VALUES (47, 71);
INSERT INTO signup (class_id, customer_id) VALUES (26, 78);
INSERT INTO signup (class_id, customer_id) VALUES (5, 57);
INSERT INTO signup (class_id, customer_id) VALUES (12, 3);
INSERT INTO signup (class_id, customer_id) VALUES (9, 4);
INSERT INTO signup (class_id, customer_id) VALUES (19, 39);
INSERT INTO signup (class_id, customer_id) VALUES (6, 23);
INSERT INTO signup (class_id, customer_id) VALUES (7, 17);
INSERT INTO signup (class_id, customer_id) VALUES (2, 36);
INSERT INTO signup (class_id, customer_id) VALUES (8, 93);
INSERT INTO signup (class_id, customer_id) VALUES (31, 56);
INSERT INTO signup (class_id, customer_id) VALUES (49, 15);
INSERT INTO signup (class_id, customer_id) VALUES (18, 10);
INSERT INTO signup (class_id, customer_id) VALUES (36, 35);
INSERT INTO signup (class_id, customer_id) VALUES (26, 34);
INSERT INTO signup (class_id, customer_id) VALUES (50, 43);
INSERT INTO signup (class_id, customer_id) VALUES (13, 39);

-- Insert data into attendance table
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-02-13', 6, 1);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-03-18', 8, 65);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-06-22', 1, 49);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-05-07', 8, 95);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-03-04', 2, 39);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-04-28', 2, 96);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-10-26', 3, 100);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-02-28', 9, 100);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-07-02', 5, 34);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-07-05', 6, 52);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-11-13', 8, 88);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-07-28', 10, 37);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-03-09', 2, 31);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-08-08', 1, 65);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-08-19', 1, 61);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-01-09', 3, 63);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-10-09', 7, 7);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-12-13', 10, 72);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-02-23', 6, 91);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-04-09', 8, 84);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-01-28', 6, 56);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-10-13', 5, 10);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-09-15', 6, 75);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-10-09', 6, 42);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-07-31', 8, 39);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-05-10', 10, 74);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-08-15', 4, 79);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-08-15', 5, 64);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-07-11', 4, 52);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-10-27', 10, 34);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-12-26', 3, 95);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-10-01', 8, 95);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-02-12', 1, 9);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-09-18', 1, 14);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-01-07', 10, 56);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-01-24', 1, 60);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-06-01', 3, 6);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-02-23', 6, 29);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-10-14', 5, 30);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-07-14', 4, 100);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-09-24', 1, 67);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-07-24', 8, 26);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-12-06', 8, 11);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-07-31', 4, 1);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-06-12', 3, 66);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-09-27', 6, 95);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-05-08', 3, 38);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-02-09', 2, 43);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-07-23', 5, 92);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-09-22', 4, 97);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-06-17', 10, 47);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-03-22', 9, 83);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-11-15', 9, 33);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-12-03', 2, 9);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-03-13', 8, 47);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-09-24', 4, 50);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-07-14', 4, 41);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-01-24', 7, 26);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-08-31', 9, 64);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-10-16', 2, 98);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-10-26', 3, 59);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-10-07', 5, 97);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-08-25', 4, 75);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-04-04', 2, 68);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-08-25', 9, 96);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-02-06', 1, 67);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-10-30', 9, 95);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-10-18', 9, 40);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-08-31', 4, 49);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-10-17', 5, 34);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-03-31', 2, 10);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-10-05', 10, 39);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-05-15', 7, 69);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-08-24', 7, 38);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-10-04', 9, 42);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-10-26', 10, 70);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-01-02', 9, 40);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-05-11', 8, 36);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-09-22', 3, 38);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2022-10-22', 4, 35);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-05-22', 10, 39);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-03-26', 8, 62);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-09-25', 7, 12);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-01-31', 2, 42);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-02-20', 4, 83);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-10-01', 9, 58);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-07-31', 1, 50);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-02-26', 5, 50);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-07-05', 10, 100);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-04-07', 4, 54);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-03-19', 6, 16);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-10-21', 4, 82);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-04-23', 6, 61);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2023-09-17', 3, 43);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-12-26', 7, 39);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2020-12-15', 5, 50);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-03-13', 3, 79);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-07-30', 2, 26);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-12-16', 7, 36);
INSERT INTO attendance (attend_date, gym_id, customer_id) VALUES ('2021-03-11', 2, 96);
