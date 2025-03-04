CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE cities (
    city_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
<<<<<<< HEAD
    city_name VARCHAR(30) NOT NULL,
    state VARCHAR(30) NOT NULL
=======
    city_name VARCHAR(30),
    state VARCHAR(30)
>>>>>>> fb0ab81a83f052dade6ef19b3a90f73877bf25b7
);

CREATE TABLE theaters (
    theater_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
<<<<<<< HEAD
    theater_name VARCHAR(50) NOT NULL,
    city_id UUID NOT NULL,
    location VARCHAR(80) NOT NULL,
    gmap_address VARCHAR(80) NOT NULL,
=======
    theater_name VARCHAR(50),
    city_id UUID,
    location VARCHAR(80),
    gmap_address VARCHAR(80),
>>>>>>> fb0ab81a83f052dade6ef19b3a90f73877bf25b7
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE screens (
    screen_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
<<<<<<< HEAD
    theater_id UUID NOT NULL,
    screen_name VARCHAR(40),
    total_seats INT NOT NULL,
    sections JSON NOT NULL,
    seat_matrix JSON NOT NULL,
    FOREIGN KEY (theater_id) REFERENCES theaters(theater_id)
);

CREATE TYPE role AS ENUM ('ADMIN', 'USER', 'OWNER');

CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30),
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    phone_no VARCHAR(30) NOT NULL UNIQUE,
	role role NOT NULL
=======
    theater_id UUID,
    screen_name VARCHAR(40),
    total_seats INT,
    sections JSON,
    seat_matrix JSON,
    FOREIGN KEY (theater_id) REFERENCES theaters(theater_id)
);

CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    password_hash VARCHAR(100),
    email VARCHAR(30),
    phone_no BIGINT
>>>>>>> fb0ab81a83f052dade6ef19b3a90f73877bf25b7
);

CREATE TABLE movies (
    movie_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
<<<<<<< HEAD
    movie_name VARCHAR(30) NOT NULL,
    language VARCHAR(30) NOT NULL,
    genre VARCHAR(30),
    duration INT NOT NULL,
=======
    movie_name VARCHAR(30),
    language VARCHAR(30),
    genre VARCHAR(30),
    duration INT,
>>>>>>> fb0ab81a83f052dade6ef19b3a90f73877bf25b7
    release_date DATE
);

CREATE TABLE shows (
    show_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
<<<<<<< HEAD
    theater_id UUID NOT NULL,
    screen_id UUID NOT NULL,
    movie_id UUID NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    price JSON NOT NULL,
=======
    theater_id UUID,
    screen_id UUID,
    movie_id UUID,
    show_date DATE,
    show_time TIME,
    price JSON,
>>>>>>> fb0ab81a83f052dade6ef19b3a90f73877bf25b7
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES screens(screen_id),
    FOREIGN KEY (theater_id) REFERENCES theaters(theater_id)
);

<<<<<<< HEAD
CREATE TYPE status AS ENUM ('BOOKED', 'PENDING', 'CANCELLED');

CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    show_id UUID NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    booking_status status NOT NULL,  -- Custom ENUM type
=======
CREATE TYPE status AS ENUM ('Booked', 'Pending', 'Cancelled');

CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID,
    show_id UUID,
    amount INT,
    booking_status status,  -- Using the custom ENUM type
>>>>>>> fb0ab81a83f052dade6ef19b3a90f73877bf25b7
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

CREATE TABLE booked_seats (
<<<<<<< HEAD
    booking_id UUID NOT NULL,
    seat_id VARCHAR(20) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

=======
    booking_id UUID,
    seat_id INT,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);
>>>>>>> fb0ab81a83f052dade6ef19b3a90f73877bf25b7
