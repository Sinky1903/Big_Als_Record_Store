DROP TABLE album;
DROP TABLE artist;

CREATE TABLE artist(
  id serial8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE album(
  id serial8 primary key,
  title VARCHAR(255) not null,
  genre VARCHAR(255) not null,
  artist_id INT4 references artist(id),
  quantity INT2 not null
);