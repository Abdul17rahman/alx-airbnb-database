SELECT * FROM booking INNER JOIN user on booking.user_id = user.user_id;

SELECT * FROM property LEFT JOIN review on review.property_id = property.property_id;

SELECT * FROM user FULL OUTER JOIN booking on booking.user_id = user.user_id;