use db_uber_app;

CREATE INDEX idx_passengers_first_name ON passengers (first_name);

CREATE INDEX idx_drivers_first_name ON drivers (first_name);

CREATE INDEX idx_rides_ride_status ON rides (ride_status);
CREATE INDEX idx_rides_requested_at ON rides (requested_at);
CREATE INDEX idx_rides_fk_id_passenger ON rides (fk_id_passenger);
CREATE INDEX idx_rides_fk_id_driver ON rides (fk_id_driver);
CREATE INDEX idx_rides_fk_id_vehicle ON rides (fk_id_vehicle);
CREATE INDEX idx_rides_fk_id_fare ON rides (fk_id_fare);

CREATE INDEX idx_vehicles_fk_id_driver ON vehicles (fk_id_driver);

CREATE INDEX idx_payments_fk_id_ride ON payments (fk_id_ride);
CREATE INDEX idx_payments_payment_status ON payments (payment_status);
CREATE INDEX idx_payments_payment_date ON payments (payment_date);

CREATE INDEX idx_fares_name_category ON fares (name_category);

CREATE INDEX idx_fares_audits_fk_id_fare ON fares_audits (fk_id_fare);
CREATE INDEX idx_fares_audits_update_date ON fares_audits (update_date);


