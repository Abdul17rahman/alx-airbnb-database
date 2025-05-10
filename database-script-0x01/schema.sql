create table User(
    user_id int primary key auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    email varchar(100) not null unique,
    password_hash varchar(300) not null,
    phone_number varchar(50),
    role enum('guest', 'host', 'admin') not null,
    created_at timestamp default current_timestamp
);

create table Property(
    property_id int primary key index(0, 1),
    host_id int not null,
    name varchar(100) not null,
    description text not null,
    location varchar(100) not null,
    pricepernight decimal(10, 2) not null,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp on update current_timestamp,
    foreign key (host_id) references User(user_id)
);

create table Booking(
    booking_id int primary key auto_increment,
    property_id int not null,
    user_id int not null,
    start_date date not null,
    end_date date not null,
    total_price decimal(10, 2),
    status enum('pending', 'confirmed', 'cancelled') not null,
    created_at timestamp default current_timestamp,
    foreign key (user_id) references User(user_id),
    foreign key (property_id) references Property(property_id)
);

create table Review(
    review_id int primary key auto_increment,
    property_id int not null,
    user_id int not null,
    rating int not null,
    comment text,
    created_at timestamp default current_timestamp,
    foreign key (property_id) references Property(property_id),
    foreign key (user_id) references User(user_id)
);

create table Message(
    message_id int primary key auto_increment,
    sender_id int not null,
    recipient_id int not null,
    message_body text,
    sent_at timestamp default current_timestamp
    foreign key (sender_id) references User(user_id),
    foreign key (recipient_id) references User(recipient_id)
);