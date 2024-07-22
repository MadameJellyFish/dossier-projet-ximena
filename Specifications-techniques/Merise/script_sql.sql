-- PostgreSQL pgAdmin4
CREATE DATABASE "bads_club" ENCODING "UTF8";

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE roles(
   role_id SERIAL,
   role_name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(role_id),
   UNIQUE(role_name)
);

CREATE TABLE sports(
   sport_id SERIAL,
   sport_name VARCHAR(50)  NOT NULL,
   PRIMARY KEY(sport_id),
   UNIQUE(sport_name)
);

CREATE TABLE sports_courts(
   court_id SERIAL,
   court_name VARCHAR(50)  NOT NULL,
   sport_id INTEGER NOT NULL,
   PRIMARY KEY(court_id),
   UNIQUE(court_name),
   FOREIGN KEY(sport_id) REFERENCES sports(sport_id)
);

CREATE TABLE days_of_week(
   day_id SERIAL,
   day_name VARCHAR(10)  NOT NULL,
   PRIMARY KEY(day_id),
   UNIQUE(day_name)
);

CREATE TABLE practice_levels(
   practice_level SERIAL,
   level_name VARCHAR(20)  NOT NULL,
   PRIMARY KEY(practice_level),
   UNIQUE(level_name)
);

CREATE TABLE reservation_status(
   status_id SERIAL,
   status_name VARCHAR(20)  NOT NULL,
   PRIMARY KEY(status_id),
   UNIQUE(status_name)
);

CREATE TABLE sports_court_availabilities(
   sport_availability_id SERIAL,
   court_availability_start_time TIME NOT NULL,
   court_availability_end_time TIME NOT NULL,
   day_id INTEGER NOT NULL,
   court_id INTEGER NOT NULL,
   PRIMARY KEY(sport_availability_id),
   FOREIGN KEY(day_id) REFERENCES days_of_week(day_id),
   FOREIGN KEY(court_id) REFERENCES sports_courts(court_id)
);

CREATE TABLE users(
   user_uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
   last_name VARCHAR(50)  NOT NULL,
   first_name VARCHAR(50)  NOT NULL,
   birthdate DATE NOT NULL,
   email VARCHAR(100)  NOT NULL,
   password VARCHAR(255)  NOT NULL,
   photo TEXT,
   membership_start DATE,
   membership_end DATE,
   created_at TIMESTAMP NOT NULL,
   updated_at TIMESTAMP NOT NULL,
   role_id INTEGER NOT NULL,
   PRIMARY KEY(user_uuid),
   UNIQUE(email),
   FOREIGN KEY(role_id) REFERENCES roles(role_id)
);

CREATE TABLE users_addresses(
   address SERIAL,
   address_1 VARCHAR(255)  NOT NULL,
   city VARCHAR(255)  NOT NULL,
   country VARCHAR(255)  NOT NULL,
   zipcode VARCHAR(20)  NOT NULL,
   user_uuid INTEGER NOT NULL,
   PRIMARY KEY(address),
   FOREIGN KEY(user_uuid) REFERENCES users(user_uuid)
);

CREATE TABLE users_availabilities(
   user_availability_id SERIAL,
   user_availability_start_time TIME NOT NULL,
   user_availability_end_time TIME NOT NULL,
   day_id INTEGER NOT NULL,
   user_uuid INTEGER NOT NULL,
   PRIMARY KEY(user_availability_id),
   FOREIGN KEY(day_id) REFERENCES days_of_week(day_id),
   FOREIGN KEY(user_uuid) REFERENCES users(user_uuid)
);

CREATE TABLE users_reservations(
   id SERIAL,
   reservation_date TIMESTAMP NOT NULL,
   status_id INTEGER NOT NULL,
   court_id INTEGER NOT NULL,
   user_uuid INTEGER NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(status_id) REFERENCES reservation_status(status_id),
   FOREIGN KEY(court_id) REFERENCES sports_courts(court_id),
   FOREIGN KEY(user_uuid) REFERENCES users(user_uuid)
);

CREATE TABLE users_ratings(
   rating_user_id INTEGER,
   rated_user_id INTEGER,
   rating INTEGER NOT NULL,
   comment TEXT,
   rating_date TIMESTAMP NOT NULL,
   PRIMARY KEY(rating_user_id, rated_user_id),
   FOREIGN KEY(rating_user_id) REFERENCES users(user_uuid),
   FOREIGN KEY(rated_user_id) REFERENCES users(user_uuid)
);

CREATE TABLE users_bans(
   banning_user_id INTEGER,
   banned_user_id INTEGER,
   reason TEXT,
   banned_date TIMESTAMP NOT NULL,
   PRIMARY KEY(banning_user_id, banned_user_id),
   FOREIGN KEY(banning_user_id) REFERENCES users(user_uuid),
   FOREIGN KEY(banned_user_id) REFERENCES users(user_uuid)
);

CREATE TABLE user_sports(
   user_uuid INTEGER,
   sport_id INTEGER,
   practice_level INTEGER,
   PRIMARY KEY(user_uuid, sport_id, practice_level),
   FOREIGN KEY(user_uuid) REFERENCES users(user_uuid),
   FOREIGN KEY(sport_id) REFERENCES sports(sport_id),
   FOREIGN KEY(practice_level) REFERENCES practice_levels(practice_level)
);
