create table customer(
	customer_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	first_name VARCHAR(30) NOt NULL,
	last_name VARCHAR(30) NOt NULL,
	email VARCHAR(30) NOt NULL UNIQUE,
	phone_number VARCHAR(30) NOt NULL,
	street_address VARCHAR(30) NOt NULL,
	city VARCHAR(30) NOt NULL,
	state VARCHAR(30) NOt NULL,
	zip INTEGER NOt NULL,

	CONSTRAINT primary_key_customer PRIMARY KEY (customer_id)
);

create table reservation(
	reservation_number INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	date DATE NOT NULL,
	purchase_type VARCHAR(30) NOT NULL,
	subtotal INTEGER NOT NULL ,
	service_fee DECIMAL (5,2) NOT NULL ,
	shipping_fee DECIMAL (5,2) NOT NULL ,
	total DECIMAL (10,2) NOT NULL,
	email VARCHAR(30) NOT NULL,

	CONSTRAINT primary_key_reservation PRIMARY KEY (reservation_number),
	CONSTRAINT foreign_key_reservation Foreign KEY (email) REFERENCES
	Customer(email)
);

create table ticket(
	ticket_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
	category_number INTEGER NOT NULL,
	reservation_number INTEGER NOT NULL,

	CONSTRAINT primary_key_ticket PRIMARY KEY (ticket_ID),
	CONSTRAINT foreign_key_ticket Foreign KEY (reservation_number) REFERENCES
	Reservation(reservation_number)
);

