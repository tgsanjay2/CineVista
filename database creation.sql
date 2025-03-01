CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE cities (
    city_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_name VARCHAR(30),
    state VARCHAR(30)
);

CREATE TABLE theaters (
    theater_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    theater_name VARCHAR(50),
    city_id UUID,
    location VARCHAR(80),
    gmap_address VARCHAR(80),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE screens (
    screen_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
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
);

CREATE TABLE movies (
    movie_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    movie_name VARCHAR(30),
    language VARCHAR(30),
    genre VARCHAR(30),
    duration INT,
    release_date DATE
);

CREATE TABLE shows (
    show_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    theater_id UUID,
    screen_id UUID,
    movie_id UUID,
    show_date DATE,
    show_time TIME,
    price JSON,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES screens(screen_id),
    FOREIGN KEY (theater_id) REFERENCES theaters(theater_id)
);

CREATE TYPE status AS ENUM ('Booked', 'Pending', 'Cancelled');

CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID,
    show_id UUID,
    amount INT,
    booking_status status,  -- Using the custom ENUM type
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

CREATE TABLE booked_seats (
    booking_id UUID,
    seat_id INT,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);