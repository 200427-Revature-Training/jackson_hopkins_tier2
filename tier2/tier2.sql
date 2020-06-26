CREATE TABLE APP_USER (
	user_id int NOT NULL PRIMARY KEY,
	username varchar(20) NOT NULL UNIQUE,
	password varchar(20) NOT NULL,
	first_name varchar(20) NOT NULL,
	last_name varchar(20) NOT NULL,
	role_id int REFERENCES USER_ROLE(role_id)
);


CREATE STUDY_SET_CARD (
	study_set_id int NOT NULL PRIMARY KEY,
	flashcard_id int NOT NULL PRIMARY KEY,
	FOREIGN KEY (study_set_id) REFERENCES STUDY_SET(study_set_id),
	FOREIGN KEY (flashcard_id) REFERENCES FLASHCARD(flashcard_id)
);


CREATE STUDY_SET ( 
	study_set_id int PRIMARY KEY,
	name varchar(20) NOT NULL UNIQUE,
	owner_id number REFERENCES APP_USER(user_id)
);

CREATE USER_ROLE ( 
	role_id int PRIMARY KEY,
	name varchar(20) NOT NULL UNIQUE
);

CREATE FLASHCARD (
	flashcard_id int PRIMARY KEY,
	question varchar(20) NOT NULL UNIQUE,
	answer varchar(20) NOT NULL,
	category_id int REFERENCES CATEGORY(category_id)
);

CREATE CATEGORY (
	category_id int NOT NULL PRIMARY KEY,
	name varchar(20) NOT NULL UNIQUE
);


/* a. */
SELECT
* 
FROM app_user 
WHERE role_id = (
	SELECT role_id
	FROM user_role,
	WHERE name = 'BASIC_USER'
);

/*b.*/

INSERT INTO user_role VALUES 
(7, 'PREMIUM_USER');

INSERT INTO app_user VALUES 
(24, 'jimmy', 'superpass', 'James', 'Smith', 7);

/*c.*/
SELECT
* 
FROM app_user 
JOIN study_set
ON
user_id = 4
;

/*d.*/ 
SELECT
username,
user_role."name",
AS
role_name,
category."name" 
AS
category_name
FROM 