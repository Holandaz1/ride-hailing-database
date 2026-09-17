CREATE DATABASE db_uber_app;
USE db_uber_app;

CREATE TABLE passengers(
id_passenger INT AUTO_INCREMENT,
email VARCHAR(60) NOT NULL,
first_name VARCHAR(100) NOT NULL,
wallet DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
rating DECIMAL(3, 2) NOT NULL DEFAULT 5.00,

CONSTRAINT pk_id_passengers PRIMARY KEY (id_passenger),
CONSTRAINT uk_passengers_emails UNIQUE (email),
CONSTRAINT chk_passengers_ratings CHECK (rating >= 3.00)
);

CREATE TABLE drivers(
id_driver INT AUTO_INCREMENT,
email VARCHAR(60) NOT NULL,
first_name VARCHAR(100) NOT NULL,
rating DECIMAL(3, 2) NOT NULL DEFAULT 5.0,

CONSTRAINT pk_id_drivers PRIMARY KEY (id_driver),
CONSTRAINT uk_drivers_emails UNIQUE (email),
CONSTRAINT chk_drivers_ratings CHECK (rating >= 3.00)
);

CREATE TABLE vehicles(
id_vehicle INT AUTO_INCREMENT,
fk_id_driver INT NOT NULL,
model VARCHAR(50) NOT NULL,
make VARCHAR(50) NOT NULL,
plate CHAR(7) NOT NULL,
color VARCHAR(30) NOT NULL,
model_year INT NOT NULL,

CONSTRAINT pk_id_vehicles PRIMARY KEY (id_vehicle),
CONSTRAINT uk_plates_vehicles UNIQUE (plate), 
CONSTRAINT fk_vehicles_drivers FOREIGN KEY (fk_id_driver) REFERENCES drivers(id_driver)
);

CREATE TABLE fares(
id_fare INT AUTO_INCREMENT,
name_category VARCHAR(40) NOT NULL, 
base_fare DECIMAL(5, 2) NOT NULL, 
per_minute_rate DECIMAL(5, 2) NOT NULL, 
per_km_rate DECIMAL(5, 2) NOT NULL, 
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,

CONSTRAINT pk_id_fares PRIMARY KEY (id_fare)
);

CREATE TABLE rides(
id_ride INT AUTO_INCREMENT,
fk_id_passenger INT NOT NULL,
fk_id_driver INT NOT NULL,
fk_id_vehicle INT NOT NULL,
fk_id_fare INT NOT NULL,
origin VARCHAR(100) NOT NULL,
destination VARCHAR(100) NOT NULL,
distance_km DECIMAL(5, 2) NOT NULL,
duration_minute DECIMAL(5, 2) NOT NULL, 
ride_status VARCHAR(60) NOT NULL DEFAULT 'IN PROGRESS...',
fare_amount DECIMAL(10, 2) NOT NULL,
requested_at DATETIME NOT NULL,

CONSTRAINT pk_id_rides PRIMARY KEY (id_ride),
CONSTRAINT fk_id_rides_passengers FOREIGN KEY (fk_id_passenger) REFERENCES passengers(id_passenger),
CONSTRAINT fk_rides_drivers FOREIGN KEY (fk_id_driver) REFERENCES drivers(id_driver),
CONSTRAINT fk_rides_vehicles FOREIGN KEY (fk_id_vehicle) REFERENCES vehicles(id_vehicle),
CONSTRAINT fk_rides_fares FOREIGN KEY (fk_id_fare) REFERENCES fares(id_fare)
);

CREATE TABLE payments(
id_payment INT AUTO_INCREMENT,
fk_id_ride INT NOT NULL,
payment_method VARCHAR(50) NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
payment_status VARCHAR(60) NOT NULL DEFAULT 'PENDING',
payment_date DATETIME NOT NULL,

CONSTRAINT pk_payments PRIMARY KEY (id_payment),
CONSTRAINT fk_payments_rides FOREIGN KEY (fk_id_ride) REFERENCES rides(id_ride)
);

CREATE TABLE fares_audits(
id_fare_audit INT AUTO_INCREMENT,
fk_id_fare INT NOT NULL,
old_base_fare DECIMAL(5, 2) NOT NULL, 
old_per_minute_rate DECIMAL(5, 2) NOT NULL,
old_per_km_rate DECIMAL(5, 2) NOT NULL,
update_date DATETIME NOT NULL,
modified_by VARCHAR(100) NOT NULL,

CONSTRAINT pk_id_fares_audits PRIMARY KEY (id_fare_audit),
CONSTRAINT fk_fares_audit_fares FOREIGN KEY (fk_id_fare) REFERENCES fares(id_fare)
);




