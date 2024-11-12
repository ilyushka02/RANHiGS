-- -----------------------------------------------------
-- Schema bank
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS bank;

-- -----------------------------------------------------
-- Table `bank`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.city(
  id INT NOT NULL AUTO_INCREMENT,
  name_city VARCHAR(45) NULL,
  PRIMARY KEY (id));

-- -----------------------------------------------------
-- Table `bank`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.region (
  id INT NOT NULL AUTO_INCREMENT,
  name_region VARCHAR(45) NULL,
  PRIMARY KEY (id));


-- -----------------------------------------------------
-- Table `bank`.`addres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.addres(
  id INT NOT NULL AUTO_INCREMENT,
  country VARCHAR(45) NOT NULL,
  region_id INT NOT NULL,
  city_id INT NOT NULL,
  street VARCHAR(45) NOT NULL,
  house_number VARCHAR(45) NOT NULL,
  post_code VARCHAR(6) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (region_id)
	REFERENCES region(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
  FOREIGN KEY (city_id)
	REFERENCES city(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE);

-- -----------------------------------------------------
-- Table `bank`.`managers_org`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.managers_organizations(
  code_manager INT NOT NULL AUTO_INCREMENT,
  last_name VARCHAR(45) NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  second_name VARCHAR(45) NULL DEFAULT NULL,
  gender VARCHAR(5) NULL DEFAULT NULL CHECK(gender in ('femal', 'men', NULL)),	
  phone_number VARCHAR(11) NOT NULL,
  email VARCHAR(155) NULL DEFAULT NULL CHECK(email like '%@%.%'),
  addr INT NOT NULL,
  PRIMARY KEY (code_manager),
  FOREIGN KEY (addr)
	REFERENCES addres(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE);

-- -----------------------------------------------------
-- Table `bank`.`organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.organizations(
  code_org INT NOT NULL AUTO_INCREMENT,
  name_org VARCHAR(155) NOT NULL,
  director INT NOT NULL,
  phone VARCHAR(11) NOT NULL,
  email VARCHAR(155) NULL DEFAULT NULL check(email like '%@%.%'),
  addr INT NOT NULL,
  PRIMARY KEY (code_org),
  FOREIGN KEY (director)
	REFERENCES managers_organizations(code_manager)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
  FOREIGN KEY (addr)
	REFERENCES addres(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE);



-- -----------------------------------------------------
-- Table `bank`.`official_positions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.official_positions (
  id INT NOT NULL AUTO_INCREMENT,
  name_position VARCHAR(45) NULL,
  salary DECIMAL NULL,
  PRIMARY KEY (id));
  
-- -----------------------------------------------------
-- Table `bank`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.employee(
  id INT NOT NULL AUTO_INCREMENT,
  last_name VARCHAR(45) NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  second_name VARCHAR(45) NOT NULL,
  date_birthday DATE NOT NULL,
  gender VARCHAR(5) NULL DEFAULT NULL CHECK(gender in ('femal', 'men', NULL)),
  official_positions INT NOT NULL,
  addr INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (official_positions)
	REFERENCES official_positions(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
  FOREIGN KEY (addr)
	REFERENCES addres(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
  );

-- -----------------------------------------------------
-- Table `bank`.`credit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.credit(
  id INT NOT NULL AUTO_INCREMENT,
  name_credit VARCHAR(45) NULL,
  interest_rate FLOAT(2) NOT NULL CHECK(interest_rate BETWEEN 0 and 100),
  penalty_amount FLOAT(2) NOT NULL CHECK(penalty_amount BETWEEN 0 and 100),
  PRIMARY KEY (id));


-- -----------------------------------------------------
-- Table `bank`.`contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bank.сontract(
  id INT NOT NULL AUTO_INCREMENT,
  organization_code_org INT NOT NULL,
  employee_id INT NOT NULL,
  credit_id INT NOT NULL,
  amount_take INT NOT NULL,
  amount_return INT NOT NULL,
  interest_rate FLOAT(2) NOT NULL CHECK(interest_rate BETWEEN 0 and 100),
  special_conditions VARCHAR(250) NULL DEFAULT NULL,
  date_from DATE NOT NULL,
  date_to DATE NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (organization_code_org)
	REFERENCES organizations(code_org)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
  FOREIGN KEY (employee_id)
	REFERENCES employee(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
  FOREIGN KEY (credit_id)
	REFERENCES credit(id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);
  
  
  