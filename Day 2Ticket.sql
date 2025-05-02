Create database TicketBookingSystem;
use TicketBookingSystem; 

Create table Venue (
    venue_id int primary key auto_increment,
    venue_name varchar(100) not null,
    address varchar(255)
);

Create table Event (
    event_id int primary key auto_increment,
    event_name varchar(100) not null,
    event_date date not null,
    event_time time not null,
    venue_id int,
    total_seats int not null,
    available_seats int not null,
    ticket_price decimal(10, 2) not null,
    event_type enum('Movie', 'Sports', 'Concert') not null,
    foreign key (venue_id) references Venue(venue_id)
);

Create table Customer (
    customer_id int primary key auto_increment,
    customer_name varchar(100) not null,
    email varchar(100),
    phone_number varchar(20)
);

Create table Booking (
    booking_id int primary key auto_increment,
    customer_id int,
    event_id int,
    num_tickets int not null,
    total_cost decimal(10, 2),
    booking_date timestamp default current_timestamp,
    foreign key (customer_id) references Customer(customer_id),
    foreign key (event_id) references Event(event_id)
);

use  TicketBookingSystem; 
insert into Venue (venue_id, venue_name, address) values
(1, 'Grand Arena', '123 Main St'),
(2, 'City Auditorium', '456 Elm St'),
(3, 'Open Grounds', '789 Oak St'),
(4, 'The Royal Theatre', '321 Maple St'),
(5, 'Rock Dome', '654 Pine St');



insert into Event (event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type, booking_id) values
(1, 'Rock Concert', '2025-06-01', '19:00:00', 1, 5000, 1000, 1500, 'Concert', null),
(2, 'Comedy Cup', '2025-07-10', '18:00:00', 2, 3000, 0, 1000, 'Movie', null),
(3, 'Music Fiesta', '2025-05-20', '20:00:00', 3, 8000, 2000, 2000, 'Concert', null),
(4, 'Drama Night', '2025-05-25', '18:30:00', 4, 1500, 300, 750, 'Movie', null),
(5, 'Football Cup', '2025-06-15', '17:00:00', 5, 20000, 15000, 2500, 'Sports', null);

insert into Customer (customer_id, customer_name, email, phone_number, booking_id) values
(1, 'Alice Johnson', 'alice@example.com', '9876543000', null),
(2, 'Bob Smith', 'bob@example.com', '9876543100', null),
(3, 'Charlie Brown', 'charlie@example.com', '9876543200', null),
(4, 'Daisy Lee', 'daisy@example.com', '9876543300', null),
(5, 'Ethan Hunt', 'ethan@example.com', '9876543400', null);

SELECT * FROM Event;

SELECT * FROM Event WHERE available_seats > 0;

SELECT * FROM Event WHERE event_name LIKE '%cup%';

SELECT * FROM Event WHERE ticket_price BETWEEN 1000 AND 2500;

SELECT * FROM Event WHERE event_date BETWEEN '2025-06-01' AND '2025-07-01';

SELECT * FROM Event WHERE available_seats > 0 AND event_type = 'Concert' AND event_name LIKE '%Concert%';

SELECT * FROM Customer LIMIT 5 OFFSET 5;

SELECT * FROM Booking WHERE num_tickets > 4;

SELECT * FROM Customer WHERE phone_number LIKE '%000';

SELECT * FROM Event WHERE total_seats > 15000 ORDER BY total_seats DESC;

SELECT * FROM Event WHERE event_name NOT LIKE 'x%' AND event_name NOT LIKE 'y%' AND event_name NOT LIKE 'z%';

