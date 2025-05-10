-- Fake User date
INSERT INTO User (first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('Alice', 'Johnson', 'alice@example.com', 'hashedpwd1', '1234567890', 'guest'),
('Bob', 'Smith', 'bob@example.com', 'hashedpwd2', '2345678901', 'host'),
('Charlie', 'Lee', 'charlie@example.com', 'hashedpwd3', '3456789012', 'host'),
('Diana', 'Ross', 'diana@example.com', 'hashedpwd4', '4567890123', 'guest'),
('Ethan', 'Clark', 'ethan@example.com', 'hashedpwd5', '5678901234', 'admin'),
('Fiona', 'Adams', 'fiona@example.com', 'hashedpwd6', '6789012345', 'host'),
('George', 'Mason', 'george@example.com', 'hashedpwd7', '7890123456', 'guest'),
('Hannah', 'Baker', 'hannah@example.com', 'hashedpwd8', '8901234567', 'host'),
('Ivan', 'Wright', 'ivan@example.com', 'hashedpwd9', '9012345678', 'guest'),
('Julia', 'Knight', 'julia@example.com', 'hashedpwd10', '0123456789', 'host');

-- Fake Properties data
INSERT INTO Property (host_id, name, description, location, pricepernight)
VALUES 
(2, 'Sunny Apartment', 'Nice and cozy place near the beach.', 'Miami', 100.00),
(3, 'Downtown Loft', 'Modern loft in the city center.', 'New York', 150.00),
(6, 'Mountain Cabin', 'Secluded cabin in the mountains.', 'Denver', 90.00),
(8, 'Lakeside Cottage', 'Charming cottage near the lake.', 'Minnesota', 110.00),
(3, 'Urban Studio', 'Compact and convenient.', 'Chicago', 80.00),
(6, 'Beach House', 'Large house by the sea.', 'Los Angeles', 200.00),
(2, 'Suburban Home', 'Quiet neighborhood, family-friendly.', 'Austin', 120.00),
(8, 'Desert Retreat', 'Minimalist and peaceful.', 'Phoenix', 95.00),
(3, 'Luxury Condo', 'Premium experience.', 'San Francisco', 250.00),
(6, 'Countryside Villa', 'Perfect for weekend getaways.', 'Nashville', 130.00);

-- Fake Bookings data
INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status)
VALUES
(1, 1, '2025-06-01', '2025-06-05', 400.00, 'confirmed'),
(2, 4, '2025-06-10', '2025-06-15', 750.00, 'pending'),
(3, 7, '2025-07-01', '2025-07-03', 180.00, 'confirmed'),
(4, 9, '2025-08-01', '2025-08-07', 770.00, 'cancelled'),
(5, 1, '2025-07-20', '2025-07-22', 160.00, 'confirmed'),
(6, 4, '2025-07-15', '2025-07-19', 800.00, 'confirmed'),
(7, 7, '2025-08-10', '2025-08-12', 240.00, 'pending'),
(8, 9, '2025-06-25', '2025-06-30', 475.00, 'confirmed'),
(9, 1, '2025-09-01', '2025-09-05', 1000.00, 'confirmed'),
(10, 4, '2025-09-10', '2025-09-15', 650.00, 'pending');

-- Fake Reviews data
INSERT INTO Review (property_id, user_id, rating, comment)
VALUES
(1, 1, 5, 'Amazing experience!'),
(2, 4, 4, 'Great location, a bit noisy.'),
(3, 7, 3, 'Decent stay for the price.'),
(4, 9, 5, 'Loved the view!'),
(5, 1, 4, 'Comfortable and clean.'),
(6, 4, 2, 'Too far from city center.'),
(7, 7, 5, 'Perfect for families.'),
(8, 9, 3, 'Okay but not exceptional.'),
(9, 1, 5, 'Luxury indeed!'),
(10, 4, 4, 'Very nice weekend getaway.');

-- Fake Messages data.
INSERT INTO Message (sender_id, recipient_id, message_body)
VALUES
(1, 2, 'Hi, is the apartment available in June?'),
(2, 1, 'Yes, it is. Would you like to book?'),
(4, 3, 'Can I check in early?'),
(3, 4, 'Sure, early check-in is available.'),
(7, 6, 'Is the cabin pet-friendly?'),
(6, 7, 'Yes, pets are welcome.'),
(1, 8, 'Is there free parking?'),
(8, 1, 'Yes, free parking is included.'),
(9, 2, 'Do you provide breakfast?'),
(2, 9, 'No, but there are cafes nearby.');
