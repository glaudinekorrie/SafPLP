-- Create Database
CREATE DATABASE StudentDB;
USE StudentDB;

-- Students Table
CREATE TABLE Students (
  student_id INT PRIMARY KEY AUTO_INCREMENT,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  date_of_birth DATE
);

-- Instructors Table
CREATE TABLE Instructors (
  instructor_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE
);

-- Courses Table
CREATE TABLE Courses (
  course_id INT PRIMARY KEY AUTO_INCREMENT,
  course_name VARCHAR(100) NOT NULL,
  instructor_id INT,
  FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

-- Enrollments Table (Many-to-Many)
CREATE TABLE Enrollments (
  student_id INT,
  course_id INT,
  grade VARCHAR(2),
  PRIMARY KEY (student_id, course_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id),
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
