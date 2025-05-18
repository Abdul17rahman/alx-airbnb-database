# Perfomance Monitoring (Complex Queries)

The initial query for retrieving all bookings along with the user details, property details, and payment details below:

```
EXPLAIN ANALYZE
SELECT * FROM booking INNER JOIN user ON booking.user_id = user.user_id INNER JOIN property ON booking.property_id = property.property_id INNER JOIN payment ON payment.booking_id = booking.booking_id;
```

return the following results:

-> Nested loop inner join (cost=8.25 rows=10) (actual time=0.111..0.195 rows=10 loops=1)
-> Nested loop inner join (cost=4.75 rows=10) (actual time=0.0998..0.149 rows=10 loops=1)
-> Table scan on booking (cost=1.25 rows=10) (actual time=0.0432..0.0512 rows=10 loops=1)
-> Single-row index lookup on user using PRIMARY (user_id=booking.user_id) (cost=0.26 rows=1) (actual time=0.00525..0.00536 rows=1 loops=10)
-> Single-row index lookup on property using PRIMARY (property_id=booking.property_id) (cost=0.26 rows=1) (actual time=0.00381..0.00392 rows=1 loops=10)

## Optimization issues

- The query performs unneccesary joins on because the tables joined are not actually used in SELECT, WHERE, ORDER BY clauses.

- The query retrives everything from bookings that might end up returning columns that are not neccesarily needed hence returning on the neccesary columns would be optimal.

- Indexing - indexing improves optimization as SQL doesn't have to do a full table scan on all columns. We can index the follwoing columns:

```
CREATE INDEX booking_user_id_idx ON booking(user_id);
CREATE INDEX booking_property_id_idx ON booking(property_id);
CREATE INDEX booking_id_idx ON booking(booking_id);
CREATE INDEX user_id_idx ON user(user_id);
CREATE INDEX property_id_idx ON property(property_id);
CREATE INDEX payment_booking_id_idx ON payment(booking_id);
```

and after creating the index, the updated query look like below

```
EXPLAIN ANALYZE
SELECT booking_id, start_date, first_name, last_name, name as property_name, amount FROM booking INNER JOIN user ON booking.user_id = user.user_id INNER JOIN property ON booking.property_id = property.property_id INNER JOIN payment ON payment.booking_id = booking.booking_id;
```

and this ensures only needed columns in the table are retrieved and minimises the time of execution as well.
