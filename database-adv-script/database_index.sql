EXPLAIN ANALYZE
SELECT first_name FROM user INNER JOIN booking on booking.user_id = user.user_id; 

CREATE INDEX user_id_idx ON user(user_id);

CREATE INDEX booking_id_idx ON booking(booking_id);
CREATE INDEX booking_user_id_idx ON booking(user_id);

CREATE INDEX property_id_idx ON property(property_id);


EXPLAIN ANALYZE
SELECT first_name FROM user INNER JOIN booking on booking.user_id = user.user_id;