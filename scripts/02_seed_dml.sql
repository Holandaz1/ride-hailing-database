USE db_uber_app;

INSERT INTO passengers (email, first_name, wallet, rating) VALUES
('carlos.silva@email.com', 'Carlos', 150.00, 4.90),
('ana.souza@email.com', 'Ana', 50.00, 4.80),
('lucas.mendes@email.com', 'Lucas', 0.00, 5.00),
('mariana.lima@email.com', 'Mariana', 25.50, 4.75);

INSERT INTO drivers (email, first_name, rating) VALUES
('roberto.alves@email.com', 'Roberto', 4.95),
('fernanda.costa@email.com', 'Fernanda', 4.88),
('joao.pedro@email.com', 'João', 4.70);

INSERT INTO fares (name_category, base_fare, per_minute_rate, per_km_rate) VALUES
('UberX', 4.00, 0.25, 1.50),
('Comfort', 6.50, 0.35, 1.95),
('Black', 10.00, 0.60, 2.80);

INSERT INTO vehicles (fk_id_driver, model, make, plate, color, model_year) VALUES
(1, 'Onix', 'Chevrolet', 'ABC1D23', 'Prata', 2022),
(2, 'HB20', 'Hyundai', 'XYZ9K88', 'Branco', 2021),
(3, 'Corolla', 'Toyota', 'KGB4E55', 'Preto', 2023);

INSERT INTO rides (fk_id_passenger, fk_id_driver, fk_id_vehicle, fk_id_fare, origin, destination, distance_km, duration_minute, ride_status, fare_amount, requested_at) VALUES
(1, 1, 1, 1, 'Av. Epitácio Pessoa, 1000', 'Shopping Mangabeira', 8.50, 18.00, 'COMPLETED', 21.25, '2026-09-16 08:30:00'),
(2, 2, 2, 2, 'Rua Maciel Pinheiro, 250', 'Aeroporto Castro Pinto', 15.20, 28.00, 'COMPLETED', 45.94, '2026-09-16 10:15:00'),
(3, 3, 3, 3, 'Praia de Tambaú', 'Centro Histórico', 7.00, 22.00, 'IN PROGRESS...', 32.80, '2026-09-17 09:00:00'),
(4, 1, 1, 1, 'Bairro dos Estados', 'UFPB Campus I', 5.30, 12.00, 'CANCELLED', 11.95, '2026-09-17 09:45:00');

INSERT INTO payments (fk_id_ride, payment_method, amount, payment_status, payment_date) VALUES
(1, 'CREDIT_CARD', 21.25, 'APPROVED', '2026-09-16 08:48:00'),
(2, 'PIX', 45.94, 'APPROVED', '2026-09-16 10:43:00'),
(3, 'WALLET', 32.80, 'PENDING', '2026-09-17 09:00:00');

INSERT INTO fares_audits (fk_id_fare, old_base_fare, old_per_minute_rate, old_per_km_rate, update_date, modified_by) VALUES
(1, 3.50, 0.20, 1.35, '2026-01-10 00:00:00', USER()),
(2, 5.50, 0.30, 1.80, '2026-01-10 00:00:00', USER());