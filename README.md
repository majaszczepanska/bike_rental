# Bike Rental Database System (from 2024)

A relational database project designed to manage a city bike rental network. This system handles the core operations of a bike rental service, including user management, bike inventory, rental transactions, station management, and maintenance logs.

## 📂 Project Structure

* `wypozyczalnia_rowerow(1).sql` - The main SQL dump file containing the database schema and structure.
* `relacje2.png` - visualizing the database connections.

## 🗄️ Database Schema

The database consists of the following key tables:

* **`kliecni` (Clients):** Stores customer information including contact details, PESEL, and account status (active, debtor, verified).
* **`historia_zmian_klienta` (Client History):** An audit log table that tracks changes made to client data for security and historical reference.
* **`rower` (Bikes):** Inventory of bikes, tracking model, availability status, purchase date, and last service date.
* **`wypozyczalnie` (Rental Stations):** Locations where bikes can be rented or returned, including GPS coordinates and capacity.
* **`operacje` (Operations/Rentals):** The central transaction table linking clients, bikes, and stations. It records rental/return times and calculated fees.
* **`serwisy` & `naprawy` (Service & Repairs):** Manages maintenance centers and logs individual repair jobs, costs, and dates for specific bikes.
* **`promocje` (Promotions):** Handles discount codes and promotional periods.

## 📊 Entity Relationship Diagram

*Key relationships include:*
* Clients make Operations (`kliecni` -> `operacje`).
* Bikes are involved in Operations and Repairs (`rower` -> `operacje`, `rower` -> `naprawy`).
* Operations link Start and End Stations (`wypozyczalnie` -> `operacje`).


## 🚀 How to Import

1.  Ensure you have a MySQL or MariaDB server running (e.g., via XAMPP or Docker).
2.  Create a new database named `wypozyczalnia_rowerow`.
3.  Import the SQL file:
    ```bash
    mysql -u username -p wypozyczalnia_rowerow < wypozyczalnia_rowerow(1).sql
    ```
    Or use a GUI tool like **phpMyAdmin** or **MySQL Workbench** to import the file.

## 🛠️ Technologies

* **Database:** MariaDB / MySQL (Compatible with Server version 10.4.28).
* **Engine:** InnoDB (supports foreign keys and transactions).
