select * from booking inner join user on booking.user_id = user.user_id;

select * from property left join review on review.property_id = property.property_id;

select * from user full join booking on booking.user_id = user.user_id;