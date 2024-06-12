use kinodatabase;

INSERT INTO role(role_name)
VALUES ('ADMIN');

INSERT INTO role(role_name)
VALUES ('USER');

-- Inserting action category
INSERT INTO categories (id, name)
VALUES (1, 'Action');

-- Inserting drama category
INSERT INTO categories (id, name)
VALUES (2, 'Drama');

-- Inserting comedy category
INSERT INTO categories (id, name)
VALUES (3, 'Comedy');

-- Inserting sci-fi category
INSERT INTO categories (id, name)
VALUES (4, 'Sci-Fi');

-- Inserting horror category
INSERT INTO categories (id, name)
VALUES (5, 'Horror');

-- Inserting romance category
INSERT INTO categories (id, name)
VALUES (6, 'Romance');

-- Inserting documentary category
INSERT INTO categories (id, name)
VALUES (7, 'Documentary');

INSERT INTO theaters (id, name)
VALUES (1, 'Theater 1');

INSERT INTO theaters (id, name)
VALUES (2, 'Theater 2');

INSERT INTO theaters (id, name)
VALUES (3, 'IMAX');

-- Inserting movie data
INSERT INTO movies (age_limit, duration, id, description, poster_base64, poster_url, title, trailer_url)
VALUES (12, 120, 1, 'An action-packed adventure', 'base64encodedimage1', 'https://example.com/poster1.jpg', 'Movie 1', 'https://example.com/trailer1.mp4');

-- Inserting another movie data
INSERT INTO movies (age_limit, duration, id, description, poster_base64, poster_url, title, trailer_url)
VALUES (16, 150, 2, 'A gripping drama', 'base64encodedimage2', 'https://example.com/poster2.jpg', 'Movie 2', 'https://example.com/trailer2.mp4');

-- Inserting a third movie data
INSERT INTO movies (age_limit, duration, id, description, poster_base64, poster_url, title, trailer_url)
VALUES (18, 180, 3, 'A hilarious comedy', 'base64encodedimage3', 'https://example.com/poster3.jpg', 'Movie 3', 'https://example.com/trailer3.mp4');

INSERT INTO categories_movies (categories_id, movies_id)
VALUES (7, 1);

INSERT INTO categories_movies (categories_id, movies_id)
VALUES (5, 2);

INSERT INTO categories_movies (categories_id, movies_id)
VALUES (2, 3);

INSERT INTO categories_movies (categories_id, movies_id)
VALUES (3, 1);

INSERT INTO categories_movies (categories_id, movies_id)
VALUES (3, 2);

-- Inserting a user with roles
INSERT INTO user_with_roles (enabled, created, edited, discriminator_type, email, username, password, country, first_name, last_name, middle_name, phone, street_address, street_no, zip)
VALUES (1, CURRENT_TIMESTAMP, NULL, 'UserWithRoles', 'user1@example.com', 'user1@example.com', '$2a$12$I4ek7KLi9F8E0XVVLHOPYO61Rwhmr8I3Jsuy08XTOamamnLPnbL56', 'USA', 'John', 'Doe', NULL, '123-456-7890', '123 Main St', 'Apt 101', '12345');

-- Inserting another user with roles
INSERT INTO user_with_roles (enabled, created, edited, discriminator_type, email, username, password, country, first_name, last_name, middle_name, phone, street_address, street_no, zip)
VALUES (1, CURRENT_TIMESTAMP, NULL, 'UserWithRoles', 'admin@example.com', 'admin@example.com', '$2a$12$hIrz02Z0qHhf2aXxPtevy.w4cW4aIikys75wYx898arLAR9jmF2DO
', 'Canada', 'Admin', 'User', 'X', '987-654-3210', '456 Oak St', 'Suite 202', '56789');

-- Inserting a third user with roles
INSERT INTO user_with_roles (enabled, created, edited, discriminator_type, email, username, password, country, first_name, last_name, middle_name, phone, street_address, street_no, zip)
VALUES (1, CURRENT_TIMESTAMP, NULL, 'UserWithRoles', 'user2@example.com', 'user2@example.com', '$2a$12$uYNfghmblKrCmwlUeIff/eP1TqWW1mXU7abVPvIsRvkGgzMkIjp3e', 'UK', 'Jane', 'Smith', 'E', '345-678-9012', '789 Elm St', NULL, '67890');

-- Inserting show data
INSERT INTO shows (id, movie_id, theater_id, end_time, start_time)
VALUES (1, 1, 1, '2024-03-13 18:30:00', '2024-03-13 15:30:00');

-- Inserting another show data
INSERT INTO shows (id, movie_id, theater_id, end_time, start_time)
VALUES (2, 2, 2, '2024-03-14 21:00:00', '2024-03-14 18:30:00');

-- Inserting a third show data
INSERT INTO shows (id, movie_id, theater_id, end_time, start_time)
VALUES (3, 3, 3, '2024-03-15 15:45:00', '2024-03-15 12:30:00');

INSERT INTO bookings (show_id, id, customer_id)
VALUES (3,'00000000-0000-3100-0000-000000000000', 'user1@example.com');

INSERT INTO bookings (show_id, id, customer_id)
VALUES (1, '00000000-0000-3100-0000-000000000001', 'user1@example.com');

INSERT INTO bookings (show_id, id, customer_id)
VALUES (2, '00000000-0000-3100-0000-000000000002', 'admin@example.com');

INSERT INTO bookings (show_id, id, customer_id)
VALUES (3, '00000000-0000-3100-0000-000000000005', 'user2@example.com');

INSERT INTO user_roles (user_username, role_role_name)
VALUES ('user1@example.com', 'USER');

INSERT INTO user_roles (user_username, role_role_name)
VALUES ('user2@example.com', 'USER');

INSERT INTO user_roles (user_username, role_role_name)
VALUES ('admin@example.com', 'ADMIN');


-- Inserting all seats data
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 1, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 2, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 3, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 4, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 5, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 6, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 7, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 7, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 7, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 8, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 8, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 8, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 9, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 10, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 11, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 12, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 13, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 14, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 15, 1, '1');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 16, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 17, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 18, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 18, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 18, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 19, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 19, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 19, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 20, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 21, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 22, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 23, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 24, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 1, 25, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 2, 25, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 3, 25, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 4, 25, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 5, 25, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 6, 25, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 7, 25, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 8, 25, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 9, 25, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 10, 25, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 11, 25, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 12, 25, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 13, 25, 1, '0');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 14, 25, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 15, 25, 1, '2');
INSERT INTO seats (available, seat_nr, seat_row, theater_id, type) VALUES (1, 16, 25, 1, '2');

INSERT INTO seats_bookings (bookings_id, seats_id)
VALUES ('00000000-0000-3100-0000-000000000000', 1);

INSERT INTO seats_bookings (bookings_id, seats_id)
VALUES ('00000000-0000-3100-0000-000000000000', 2);

INSERT INTO seats_bookings (bookings_id, seats_id)
VALUES ('00000000-0000-3100-0000-000000000001', 3);

INSERT INTO user_with_roles_bookings (customer_username, bookings_id)
VALUES ('user1@example.com', '00000000-0000-3100-0000-000000000000');

INSERT INTO user_with_roles_bookings (customer_username, bookings_id)
VALUES ('user2@example.com', '00000000-0000-3100-0000-000000000001');