# Index performance.

This file explains the perfomance optimization using sql indexing. In my practice i used a query that joins 2 tables:

```
EXPLAIN ANALYZE
SELECT first_name FROM user INNER JOIN booking on booking.user_id = user.user_id;
```

This query returns the first names of users that have booking under their user_id.

The results of this query before indexing any column are as below.

- -> Nested loop inner join (cost=4.75 rows=10) (actual time=0.0797..0.114 rows=10 loops=1)
- -> Covering index scan on booking using user_id (cost=1.25 rows=10) (actual time=0.0541..0.0639 rows=10 loops=1)
- -> Single-row index lookup on user using PRIMARY (user_id=booking.user_id) (cost=0.26 rows=1) (actual time=0.00405..0.00417 rows=1 loops=10)

As shown above, the query took 3 steps to complete and took approximately **0.078 seconds** to execute.

However i applied a user_id index on the booking table using the command

```
CREATE INDEX booking_user_id_idx ON booking(user_id);
```

and run the same explain analyze command

```
EXPLAIN ANALYZE
SELECT first_name FROM user INNER JOIN booking on booking.user_id = user.user_id;
```

and got the following results:

- -> Nested loop inner join (cost=4.75 rows=10) (actual time=0.0183..0.0286 rows=10 loops=1)
- -> Covering index scan on booking using booking_user_id_idx (cost=1.25 rows=10) (actual time=0.00913..0.0122 rows=10 loops=1)
- -> Single-row index lookup on user using PRIMARY (user_id=booking.user_id) (cost=0.26 rows=1) (actual time=0.00127..0.00131 rows=1 loops=10)

As the results, the query took 3 steps as before but was abit more faster than the first query becase of the index applied on the user_id column of the booking table. The actutal time was approximately **0.018 seconds compared to 0.079** of the first query.

Therefore indexing is good for database optimization as it makes the queries more faster than without them as sql doesnt have to perform a full table scan.
