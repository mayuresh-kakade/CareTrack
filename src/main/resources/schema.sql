-- ============================================================
-- CareTrack Database Schema Initialization Script
-- Database: caretrack
-- Tables: users, patients, admissions
-- ============================================================

-- Create Database if not exists
CREATE DATABASE IF NOT EXISTS caretrack;
USE caretrack;

-- 1. Users Table (Stores Admin, Doctors, Nurses)
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL, -- 'ADMIN', 'DOCTOR', 'NURSE'
    email VARCHAR(100),
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Patients Table (Stores master patient demographic details)
CREATE TABLE IF NOT EXISTS patients (
    patient_id VARCHAR(20) PRIMARY KEY, -- e.g. P1001, P1002
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL, -- 'Male', 'Female', 'Other'
    blood_group VARCHAR(10),
    contact_number VARCHAR(20) NOT NULL,
    emergency_contact VARCHAR(20),
    address TEXT,
    medical_history TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Admissions Table (Tracks admission records for patients)
CREATE TABLE IF NOT EXISTS admissions (
    admission_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id VARCHAR(20) NOT NULL,
    admission_date DATE NOT NULL,
    discharge_date DATE NULL,
    bed_number VARCHAR(20),
    ward_name VARCHAR(50),
    attending_doctor_id INT NULL,
    reason_for_admission TEXT NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'ADMITTED', -- 'ADMITTED', 'DISCHARGED'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_admissions_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE,
    CONSTRAINT fk_admissions_doctor FOREIGN KEY (attending_doctor_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- ============================================================
-- Sample Seed Data for Initial Testing
-- ============================================================

-- Insert sample users (Passwords: 'admin123', 'doctor123', 'nurse123' - plain text placeholder before BCrypt)
INSERT INTO users (username, password, full_name, role, email, phone) 
VALUES 
('admin1', 'admin123', 'System Administrator', 'ADMIN', 'admin@caretrack.com', '9876543210'),
('dr_sharma', 'doctor123', 'Dr. Rajesh Sharma', 'DOCTOR', 'sharma@caretrack.com', '9876543211'),
('nurse_priya', 'nurse123', 'Nurse Priya Verma', 'NURSE', 'priya@caretrack.com', '9876543212')
ON DUPLICATE KEY UPDATE username=username;

-- Insert sample patients
INSERT INTO patients (patient_id, name, age, gender, blood_group, contact_number, emergency_contact, address, medical_history)
VALUES
('P1001', 'Rahul Kumar', 34, 'Male', 'O+', '9811122233', '9811122234', '123 MG Road, Mumbai', 'No major prior illness. Allergic to penicillin.'),
('P1002', 'Amit Patel', 45, 'Male', 'B+', '9822233344', '9822233345', '45 Park Street, Pune', 'History of Hypertension.')
ON DUPLICATE KEY UPDATE patient_id=patient_id;

-- Insert sample admission record
INSERT INTO admissions (patient_id, admission_date, bed_number, ward_name, attending_doctor_id, reason_for_admission, status)
VALUES
('P1001', '2026-01-17', 'B-104', 'General Ward', 2, 'High Fever and Severe Fatigue', 'ADMITTED')
ON DUPLICATE KEY UPDATE admission_id=admission_id;
