USE db_uber_app;

CREATE VIEW vw_rides_overview AS
SELECT
    r.id_ride,
    r.origin,
    r.destination,
    r.fare_amount,
    r.ride_status,
    r.requested_at,
    p.first_name AS passenger_name,
    d.first_name AS driver_name,
    v.plate,
    f.name_category
FROM rides r
JOIN passengers p ON r.fk_id_passenger = p.id_passenger
JOIN drivers d ON r.fk_id_driver = d.id_driver
JOIN vehicles v ON r.fk_id_vehicle = v.id_vehicle
JOIN fares f ON r.fk_id_fare = f.id_fare;

DELIMITER //

CREATE TRIGGER trg_fares_after_update
AFTER UPDATE ON fares
FOR EACH ROW
BEGIN
    INSERT INTO fares_audits (
        fk_id_fare,
        old_base_fare,
        old_per_minute_rate,
        old_per_km_rate,
        update_date,
        modified_by
    )
    VALUES (
        OLD.id_fare,
        OLD.base_fare,
        OLD.per_minute_rate,
        OLD.per_km_rate,
        NOW(),
        USER()
    );
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_update_payment_status(
    IN p_id_payment INT,
    IN p_new_status VARCHAR(60)
)
BEGIN
    UPDATE payments
    SET payment_status = p_new_status,
        payment_date = NOW()
    WHERE id_payment = p_id_payment;
END //

DELIMITER ;


