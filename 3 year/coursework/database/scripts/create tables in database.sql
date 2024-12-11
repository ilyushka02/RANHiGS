-- -----------------------------------------------------
-- SCHEMA bank
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS bank;
USE bank;
-- -----------------------------------------------------
-- Table bank.official_positions
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.official_positions (
  id INT NOT NULL AUTO_INCREMENT,
  position_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
  );

-- -----------------------------------------------------
-- Table bank.department
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.department(
    id INT,
    depart_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table bank.employee
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.employee(
    id INT NOT NULL AUTO_INCREMENT,
	last_name VARCHAR(45) NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    second_name VARCHAR(45) NULL DEFAULT NULL ,
    office_position INT NOT NULL,
    department_id INT NOT NULL,
    email VARCHAR(155) NULL DEFAULT NULL CHECK(email LIKE '%@%.%'),
    phone_number VARCHAR(12) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (office_position)
	REFERENCES official_positions(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
  FOREIGN KEY (department_id)
	REFERENCES department(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table bank.region
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.region(
    id INT NOT NULL AUTO_INCREMENT,
    reg_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table bank.city
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.city(
    id INT NOT NULL AUTO_INCREMENT,
    city_name VARCHAR(100) NOT NULL,
    region_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (region_id)
	REFERENCES region(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table bank.director
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.director(
    id INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(45) NOT NULL,
    first_name VARCHAR(45) NOT NULL,
    second_name VARCHAR(45) NULL DEFAULT NULL ,
    passport_series VARCHAR(4) NOT NULL,
    passport_number VARCHAR(6) NOT NULL,
    birthdate DATE NOT NULL,
    issued_by VARCHAR(155) NOT NULL,
    issue_date DATE NOT NULL,
    phone_number VARCHAR(12) NOT NULL,
    PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table bank.legal_form
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.legal_form(
	id INT NOT NULL AUTO_INCREMENT,
    name_legal_form VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table bank.organization
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.organizations(
    id INT NOT NULL AUTO_INCREMENT,
    organization_name VARCHAR(155) NOT NULL,
    inn VARCHAR(10) NOT NULL,
    kpp VARCHAR(9) NOT NULL,
    legal_form_id INT NOT NULL,
    full_addres VARCHAR(145) NOT NULL,
    director_id INT NOT NULL,
    phone_number VARCHAR(12) NOT NULL,
    email VARCHAR(155) NULL DEFAULT NULL CHECK(email LIKE '%@%.%'),
    city_id INT NOT NULL,
    registration_date DATE NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (legal_form_id)
	REFERENCES legal_form(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
    FOREIGN KEY (director_id)
	REFERENCES director(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (city_id)
	REFERENCES city(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table bank.status_loan
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.status_loan(
    id INT NOT NULL AUTO_INCREMENT,
    name_status VARCHAR(155) NOT NULL,
    PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table bank.loan
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.loan(
    id INT NOT NULL AUTO_INCREMENT,
    amount BIGINT NOT NULL,
    interest_rate DECIMAL(2, 2) NOT NULL,
    date_from DATE NOT NULL,
    date_to DATE NOT NULL,
    status_id INT NOT NULL,
    organization_id INT NOT NULL,
    retern_amount BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    FOREIGN KEY (status_id)
	REFERENCES status_loan(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (organization_id)
	REFERENCES organizations(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table bank.special_conditions
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.special_conditions(
    id INT NOT NULL AUTO_INCREMENT,
    describe_text VARCHAR(155) NOT NULL,
    influence_interest_rate DECIMAL(2, 2) NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table bank.loan_contract
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.loan_contract(
    id INT NOT NULL AUTO_INCREMENT,
    sign_date DATE NOT NULL,
    loan_id INT NOT NULL,
    employee_id INT NOT NULL,
    result_interest_rate DECIMAL(2, 2) NOT NULL,
    penalty DECIMAL(2, 2) NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (loan_id)
	REFERENCES loan(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY (employee_id)
	REFERENCES employee(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table bank.spec_cond_for_loan
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.spec_cond_for_loan(
    id_loan INT NOT NULL,
    id_spec_condition INT NOT NULL,
    PRIMARY KEY (id_loan, id_spec_condition),
    FOREIGN KEY (id_spec_condition)
	REFERENCES special_conditions(id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION,
	FOREIGN KEY (id_loan)
	REFERENCES loan_contract(id)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
);

-- -----------------------------------------------------
-- Table bank.refund_operations
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.refund_operations(
    id INT NOT NULL AUTO_INCREMENT,
    loan_id INT NOT NULL,
    date_operation DATE NOT NULL,
    amount BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (loan_id)
	REFERENCES loan(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);
