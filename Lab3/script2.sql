-- QUESTION 1 --

---- Delete tables if they exist already -----
DROP TABLE IF EXISTS Professor CASCADE;
DROP TABLE IF EXISTS GraduateStudent CASCADE; 
DROP TABLE IF EXISTS Departments CASCADE;
DROP TABLE IF EXISTS Runs CASCADE;
DROP TABLE IF EXISTS Work_Dept CASCADE;
DROP TABLE IF EXISTS Project CASCADE;
DROP TABLE IF EXISTS GraduateStudent CASCADE;
DROP TABLE IF EXISTS Advisor CASCADE;
DROP TABLE IF EXISTS Manage CASCADE;
DROP TABLE IF EXISTS Work_in CASCADE;
DROP TABLE IF EXISTS Supervises CASCADE;
 


-- Create tables for question 1
CREATE TABLE Professor 
(
	prof_ssn char(11) NOT NULL,
	name char(30) NOT NULL,
	age integer,
	rank char(255) NOT NULL,
	researchSpecialty char(30) NOT NULL,
	PRIMARY KEY (prof_ssn)
);


CREATE TABLE Departments
(
	dno integer,
	dname char(255),
	office char(255),
	PRIMARY KEY (dno)
);

CREATE TABLE Runs
(
	dno integer,
	prof_ssn CHAR(11),
	PRIMARY KEY (dno, prof_ssn),
	FOREIGN KEY (prof_ssn) REFERENCES Professor,
	FOREIGN KEY (dno) REFERENCES Departments	
);

CREATE TABLE Work_Dept
(
	dno INTEGER,
	prof_ssn CHAR(11),
	time_pc INTEGER,
	PRIMARY KEY (dno, prof_ssn),
	FOREIGN KEY (prof_ssn) REFERENCES Professor,
	FOREIGN KEY (dno) REFERENCES Departments	
);

CREATE TABLE Project
(
	pno INTEGER,
	sponsor char(255),
	start_date DATE,
	end_date DATE,
	budget FLOAT,
	PRIMARY KEY (pno)
);

CREATE TABLE GraduateStudent
(
	grad_ssn CHAR(11),
	age INTEGER,
	name CHAR(255),
	deg_pg CHAR(255),
	major INTEGER,
	PRIMARY KEY (grad_ssn),
	FOREIGN KEY (major) REFERENCES Departments
);

CREATE TABLE Advisor 
(
	advis_ssn CHAR(11),
	grad_ssn CHAR(11),
	PRIMARY KEY(advis_ssn, grad_ssn),
	FOREIGN KEY(grad_ssn) REFERENCES GraduateStudent
);

CREATE TABLE Manage
(
	pno INTEGER,
	prof_ssn CHAR(11),
	PRIMARY KEY (pno, prof_ssn),
	FOREIGN KEY (prof_ssn) REFERENCES Professor,
	FOREIGN KEY (pno) REFERENCES Project
);	

CREATE TABLE Work_In
(
	pno INTEGER,
	prof_ssn CHAR(10),
	PRIMARY KEY (pno, prof_ssn),
	FOREIGN KEY (prof_ssn) REFERENCES Professor,
	FOREIGN KEY (pno) REFERENCES Project
);

CREATE TABLE Supervises
(
	prof_ssn CHAR(11),
	grad_ssn CHAR(11),
	pno INTEGER,
	PRIMARY KEY (prof_ssn, grad_ssn, pno),
	FOREIGN KEY (prof_ssn) REFERENCES Professor,
	FOREIGN KEY (grad_ssn) REFERENCES GraduateStudent,
	FOREIGN KEY (pno) REFERENCES Project
);
