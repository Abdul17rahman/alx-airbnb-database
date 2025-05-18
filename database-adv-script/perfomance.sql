EXPLAIN ANALYZE
SELECT * FROM booking INNER JOIN user ON booking.user_id = user.user_id INNER JOIN property ON booking.property_id = property.property_id INNER JOIN payment ON payment.booking_id = booking.booking_id;

CREATE INDEX booking_user_id_idx ON booking(user_id);
CREATE INDEX booking_property_id_idx ON booking(property_id);
CREATE INDEX booking_id_idx ON booking(booking_id);
CREATE INDEX user_id_idx ON user(user_id);
CREATE INDEX property_id_idx ON property(property_id);
CREATE INDEX payment_booking_id_idx ON payment(booking_id);

EXPLAIN ANALYZE
SELECT booking_id, start_date, first_name, last_name, name as property_name, amount FROM booking INNER JOIN user ON booking.user_id = user.user_id INNER JOIN property ON booking.property_id = property.property_id INNER JOIN payment ON payment.booking_id = booking.booking_id;

