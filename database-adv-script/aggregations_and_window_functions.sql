SELECT count(*) FROM booking GROUP BY booking.user_id;

SELECT 
    *
    COUNT(booking.booking_id),
    RANK() OVER (ORDER BY COUNT(booking.booking_id) DESC),
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC)
FROM property
LEFT JOIN booking ON property.property_id = booking.property_id
GROUP BY property.property_id, property.name;
