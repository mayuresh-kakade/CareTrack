# CareTrack — Patient Journey & Hospital Care Tracking System

CareTrack is a hospital portal that tracks the complete journey of a patient from admission to discharge.

## 🚀 Features (Planned Phases)
- **Patient Journey & Timeline**: Daily condition tracking, vitals, test results, medicines, procedures, and support.
- **Role-Based Access Control**: Admin, Doctor, Nurse, Lab Technician, Pharmacist, Patient.
- **Pure JDBC Database Operations**: Manual SQL queries with `JdbcTemplate` for high clarity and student learning (NO JPA / Hibernate).
- **Security**: Spring Security session-based authentication & BCrypt password hashing.
- **Audit Logging & Security**: Tracking sensitive record access.

## 🛠️ Tech Stack
- **Backend**: Java 17, Spring Boot 3.2.4 (Spring Web, Spring JDBC)
- **Database**: MySQL
- **Frontend**: HTML, CSS, JavaScript, Bootstrap
- **Build Tool**: Maven

## 📁 Eclipse Setup Guide
1. Open Eclipse IDE.
2. Select **File → Import...**
3. Choose **Maven → Existing Maven Projects** and click **Next**.
4. Browse to the project folder (`AroygX` or `CareTrack`) and click **Finish**.
5. Ensure MySQL is running on `localhost:3306` with database `caretrack`.
6. Run `CareTrackApplication.java` as a **Java Application** or **Spring Boot App**.
