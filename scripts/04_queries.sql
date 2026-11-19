USE db_uber_app;

SELECT
    r.id_ride,
    r.origin,
    r.destination,
    r.distance_km,
    r.fare_amount,
    r.ride_status,
    r.requested_at,
    p.first_name AS passenger_name,
    d.first_name AS driver_name,
    v.model,
    v.plate,
    f.name_category 
FROM rides r
JOIN passengers p ON r.fk_id_passenger = p.id_passenger
JOIN drivers d ON r.fk_id_driver = d.id_driver
JOIN vehicles v ON r.fk_id_vehicle = v.id_vehicle
JOIN fares f ON r.fk_id_fare = f.id_fare
ORDER BY r.id_ride;


SELECT
    r.id_ride,
    p.payment_method,
    p.amount,
    p.payment_status,
    p.payment_date,
    pas.first_name AS passenger_name
FROM payments p
JOIN rides r ON p.fk_id_ride = r.id_ride
JOIN passengers pas ON r.fk_id_passenger = pas.id_passenger
WHERE p.payment_status = 'APPROVED';


SELECT
    payment_status,
    COUNT(id_payment) AS total_transactions,
    SUM(amount) AS total_revenue
FROM payments
GROUP BY payment_status;


SELECT
    d.first_name AS driver_name,
    d.rating,
    COUNT(r.id_ride) AS total_rides_completed,
    COALESCE(SUM(r.fare_amount), 0.00) AS total_earned
FROM drivers d
LEFT JOIN rides r ON d.id_driver = r.fk_id_driver AND r.ride_status = 'COMPLETED'
GROUP BY d.id_driver, d.first_name, d.rating
ORDER BY total_rides_completed DESC;