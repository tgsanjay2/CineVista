CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE cities (
    city_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    city_name VARCHAR(30) NOT NULL,
    state VARCHAR(30) NOT NULL
);

CREATE TABLE theaters (
    theater_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    theater_name VARCHAR(50) NOT NULL,
    city_id UUID NOT NULL,
    location VARCHAR(80) NOT NULL,
    gmap_address VARCHAR(80) NOT NULL,
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

CREATE TABLE screens (
    screen_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
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
);

CREATE TABLE movies (
    movie_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    movie_name VARCHAR(30) NOT NULL,
    language VARCHAR(30) NOT NULL,
    genre VARCHAR(30),
    duration INT NOT NULL,
    release_date DATE
);

CREATE TABLE shows (
    show_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    theater_id UUID NOT NULL,
    screen_id UUID NOT NULL,
    movie_id UUID NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    price JSON NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES screens(screen_id),
    FOREIGN KEY (theater_id) REFERENCES theaters(theater_id)
);

CREATE TYPE status AS ENUM ('BOOKED', 'PENDING', 'CANCELLED');

CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    show_id UUID NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    booking_status status NOT NULL,  -- Custom ENUM type
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

CREATE TABLE booked_seats (
    booking_id UUID NOT NULL,
    seat_id VARCHAR(20) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

