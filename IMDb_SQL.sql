Drop Table IF EXISTS Movie_Actor CASCADE;  
Drop Table IF EXISTS Ratings CASCADE;  
Drop Table IF EXISTS Movies CASCADE;  
Drop Table IF EXISTS Actors CASCADE;  

CREATE TABLE  Actors  (
    actor_id  INT   NOT NULL,
     first_name  VARCHAR(255)   NOT NULL,
     last_name  VARCHAR(255)   NOT NULL,
     birth_name  VARCHAR(255),
     date_of_birth  date,
     place_of_birth  text,
     date_of_death  date,
     reason_of_death  text,
    CONSTRAINT  pk_Actors  PRIMARY KEY (
        actor_id 
    )
);

CREATE TABLE  Movies  (
    movie_id  INT   NOT NULL,
    title  text   NOT NULL,
    year  INT   NOT NULL,
    genre  VARCHAR(255)   NOT NULL,
    duration  INT,
    language  text,
    director  VARCHAR(255),
    actors  text,
    description  text,
    avg_vote  float   NOT NULL,
    budget  float,
    gross_income  float,
    critic_reviews  float,
    CONSTRAINT  pk_Movies  PRIMARY KEY (
        movie_id 
    )
);

CREATE TABLE  Ratings  (
    movie_id  INT   NOT NULL,
    avg_vote_females  float,
    avg_vote_males  float,
    total_votes  INT   NOT NULL,
    weighted_average_vote  float   NOT NULL,
   CONSTRAINT  pk_Ratings  PRIMARY KEY (
        movie_id 
    )
);

CREATE TABLE  Movie_Actor  (
    id  serial   NOT NULL,
    movie_id  INT   NOT NULL,
    actor_id  INT   NOT NULL,
    role  text,
    characters  text,
   CONSTRAINT  pk_Movie_Actor  PRIMARY KEY (
        id 
    )
);

ALTER TABLE  Ratings  ADD CONSTRAINT  fk_Ratings_movie_id  FOREIGN KEY( movie_id )
REFERENCES  Movies  ( movie_id );

ALTER TABLE  Movie_Actor  ADD CONSTRAINT  fk_Movie_Actor_movie_id  FOREIGN KEY( movie_id )
REFERENCES  Movies  ( movie_id );

ALTER TABLE  Movie_Actor  ADD CONSTRAINT  fk_Movie_Actor_actor_id  FOREIGN KEY( actor_id )
REFERENCES  Actors  ( actor_id );
