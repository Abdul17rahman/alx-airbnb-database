# Normalization

This is a process of managing data to ensure data integrity and no redundancy. It has the following forms.

1. 1NF (First Normal Form):

- Atomic columns (no lists, only indivisible values).

* Unique rows (primary key present).

2. 2NF (Second Normal Form):

- It must first be in 1NF.
- All non-key attributes must be fully dependent on the entire primary key.

3. 3NF (Third Normal Form):

- It must be in 2NF.
- No transitive dependencies (non-key attributes should not depend on other non-key attributes).

According to the available data, i believe it fully conforms to a 3NF normalization and ensures there's no redanduncy and mains data intergrity.

**Users Table:**

- All fields are atomic and dependent on user_id.
- No transitive dependencies.
- 3NF-compliant.

**Property Table:**

- All fields are atomic and dependent on property_id.
- host_id is a foreign key referencing the User table.
- No transitive dependencies.
- 3NF-compliant.

**Booking Table:**

- booking_id is the identifier; all other columns directly relate to it.
- total_price is okay here because it's derived from booking dates × property price but stored explicitly (often for history/audit purposes).
- property_id and user_id are foreign keys that reference the Property and User tables respectively.
- No transitive dependencies.
- 3NF-compliant.

**Payment Table:**

- All fields are atomic and dependent payment_id.
- booking_id is a foreign key that references the booking Tbale
- 3NF-compliant.

**Reviews Table:**

- All fields are atomic and dependent on review_id.
- property_id, user_id are foreign keys that reference the Property and User tables respectively
- No transitive dependencies.
- 3NF-compliant.

**Message Table:**

- All fields are atomic and dependent on message_id.
- sender_id and recipient_id are foreign keys referencing the user table.
- No transitive dependencies.
- 3NF-compliant.
