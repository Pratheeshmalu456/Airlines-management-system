create database Airlines;
CREATE TABLE Flights (
  Flight_id integer PRIMARY KEY,
  Airline varchar(30),
  origin_id integer,
  destination_id integer,
  departure_time datetime,
  arrival_time datetime,
  Duration_hrs integer
);
Alter table Flights modify column Duration_hrs time ;

CREATE TABLE Flight_specification (
  Flight_id integer PRIMARY KEY,
  Airline varchar(30),
  Aircraft_type varchar(30),
  capacity integer
);

CREATE TABLE Passengers (
  Passenger_id integer PRIMARY KEY,
  Passenger_name varchar(255),
  Date_of_birth date,
  contact_number varchar(30)
);

CREATE TABLE travel_info (
  ticket_id integer PRIMARY KEY,
  Passenger_id int,
  Flight_id int,
  Booking_date date,
  seat_number varchar(10),
  class varchar(255)
);

CREATE TABLE staff (
  staff_id integer PRIMARY KEY,
  staff_name varchar(255),
  Role varchar(255),
  Flight_id integer
);

CREATE TABLE airport (
  airport_id integer PRIMARY KEY,
  airport_name varchar(255),
  city varchar(255) ,
  country varchar(20)
);



ALTER TABLE Flight_specification ADD constraint flightspec FOREIGN KEY (Flight_id) REFERENCES Flights (Flight_id) on delete cascade;

ALTER TABLE travel_info ADD constraint travelpass FOREIGN KEY (Passenger_id) REFERENCES Passengers (Passenger_id) on delete cascade;

ALTER TABLE travel_info ADD constraint travelflight FOREIGN KEY (Flight_id) REFERENCES Flights (Flight_id) on delete cascade;

ALTER TABLE staff ADD constraint staffflight FOREIGN KEY (Flight_id) REFERENCES Flights (Flight_id) on delete cascade;

ALTER TABLE Flights ADD constraint destination FOREIGN KEY (destination_id) REFERENCES airport (airport_id) on delete cascade;

ALTER TABLE Flights ADD constraint origin FOREIGN KEY (origin_id) REFERENCES airport (airport_id) on delete cascade;


-------------------------------------------------------------------------------------------------------------------
 --                          Airport

insert into airport values ( 401 , "John F. Kennedy Intl","New York","USA"),
 ( 402,"Los Angeles Intl", "Los Angeles"	,"USA"),
 (403, "O'Hare Intl" , "Chicago" , "USA"),
 ( 404 ,"Hartsfield-Jackson","Atlanta","USA"),
 ( 405	, "San Francisco Intl","San Francisco","USA"),
 (406,"Seattle-Tacoma Intl","Seattle","USA"),
 ( 407,"Miami Intl" ,"Miami","USA"),
 ( 408,"London Heathrow","London","UK"),
 (409,"Dubai Intl" ,"Dubai","UAE"),
 (410,"Changi Intl","Singapore","Singapore"),
 (411,"Indra Gandhi Intl","Delhi", "India");
-- ----------------------------------------------------------------------------------------------------------------
             --         2     Passengers  

insert into passengers values(201,"John Doe",'1990-05-15',1234567890),
(202,"Jane Smith",'1985-10-20',	2345678901),
(203,"Alice	Johnson",'1992-03-12',3456789012),
(204,"Bob Lee",'1987-08-22',4567890123),
( 205,"Carol	Martin"	,'1995-02-10',	678901234),
( 206,"Dave	Wilson",'1993-06-18',6789012345),
(207,"Emma	Brown",'1998-11-25',7890123456),
(208,"Frank	Green",'1980-03-04',8901234567),
(209,"Grace	White",'1999-07-14',9012345678),
( 210,"Harry Black",'1983-12-30',0123456789);
-----------------------------------------------------------------------------------------------------------------------
--           4                                Flights

insert into flights values( 101,"SkyHigh Airways",401,402,'2024-12-25 08:00:45','2024-12-25 11:30:58','05:30:48'),
(  102,"	SkyHigh Airways",402,403,'2024-12-25 14:00:38',	'2024-12-25 18:00:45'	,'04:00:35'),
( 103	,"SkyHigh Airways",	403	, 404	,'2024-12-26 09:00:00','2024-12-26 12:30:00','03:30:00'),
( 104 ,"BlueSky Airlines", 405,406, '2024-12-26 07:00:00', 	'2024-12-26 09:00:00','02:00:00'),	
( 105,"BlueSky Airlines"	,406,411	,'2024-12-26 12:00:00 ',	'2024-12-26 15:30:00' ,	'03:30:00' ),
( 106	,"AirFrance Airways",407,401,'2024-12-27 06:00:00','2024-12-27 09:00:00','03:00:00' ),
(  107,"BlueSky Airlines",411,404,'2024-12-27 10:00:00', '2024-12-27 13:30:00' ,'03:30:00'),
(  108,"SkyHigh Airways",	401,408,'2024-12-28 16:00:00','2024-12-28 20:00:00','06:00:00'),
( 109,"SkyHigh Airways",408,409,'2024-12-28 23:00:00','2024-12-29 05:30:00' ,'06:30:00'),
( 110,"BlueSky Airlines",409,410,'2024-12-30 08:00:00' ,'2024-12-30 14:00:00' ,'06:00:00');	
--------------------------------------------------------------------------------------------------------------------------------
--   3. Tickets Table
-- TicketID	PassengerID	FlightID	BookingDate	SeatNumber	Class	Price
insert into travel_info values( 301,201,101,'2024-12-01',"12A","Economy"),
(302,202,101,'2024-12-01',"14B","Economy"),
(303,203,102,'2024-12-02',"1A","Business"),
(304,204,103,'2024-12-03',"18C","Economy"),
(305,205,104,'2024-12-04',"2F","First"),
(306,206,105,'2024-12-05',"5D","Economy"),
( 307,207,106,'2024-12-06',"10E","Economy"),
( 308,208,107,'2024-12-07',"6A","Business"),
(309,209,108,'2024-12-08',"15C","Economy"),
( 310,210,109,'2024-12-09',"3B","First");
------------------------------------------------------------------------------------------------------------------------------
-- 5. Staff Table
-- StaffID	Name		Role		FlightID
insert into staff values ( 501,"Mike Thompson", "Pilot",101),
(502,"Sarah Connor","Cabin Crew",101),
(503,"Paul Anderson","Pilot",103),
(504,"Lucy King","Pilot",102),
(505,"Kevin Miller","Cabin Crew",102),
(506,"Nora Davis","Pilot",103),
(507,"Sam Lewis","Cabin Crew",103),
(508,"Rita Walker","Pilot",107),
(509,"Jack Edwards","Pilot", 108),
(510,"Linda Wright","Cabin Crew",108);

-----------------------------------------------------------------------------------------------------------------------------
-- 6. Aircraft Table

insert into Flight_specification values(101, "SkyHigh Airways","Boeing 737",200),
(102,"SkyHigh Airways","Airbus A320",180),
( 103	,"SkyHigh Airways","Boeing 747",300),
( 104,"BlueSky Airlines","Boeing 757",220),
(105,"BlueSky Airlines","Boeing 787",280),
(106,"AirFrance Airways","Airbus A380",400),
( 107,"BlueSky Airlines","Boeing 777",320),
( 108,"SkyHigh Airways","Embraer 190",100),
(109,"SkyHigh Airways","Bombardier Q400",80),
( 110,"BlueSky Airlines","Boeing 767",270);
-- -------------------------------------------------------------------------------------------------------------------------- 
--  Query 1 To find information of flight with origin and destination
DELIMITER // 

create  procedure flight_name (IN i varchar(30),IN j varchar(30))
begin
SELECT Flights.Flight_id, Flights.Airline, Flights.departure_time, Flights.arrival_time, Flights.Duration_hrs
FROM Flights join airport 
on airport.airport_id = Flights.origin_id 
WHERE origin_id = (select airport_id 
from airport where airport_name = i ) and destination_id= (select airport_id 
from airport where airport_name = j );


end //
DELIMITER ;

call flight_name("John F. Kennedy Intl","Los Angeles Intl");
-- -------------------------------------------------------------------------------------------------------------------------- 
--  Query 2 To find travel details by providing passenger_id
DELIMITER //
 create  procedure travel_details (IN i int)
 begin
 select passengers.Passenger_id, passengers.Passenger_name,travel_info.ticket_id ,
 travel_info.Flight_id ,travel_info.Booking_date,travel_info.seat_number ,travel_info.class 
 from passengers join travel_info on passengers.Passenger_id = travel_info.Passenger_id
 where passengers.Passenger_id = i;
 end //
 DELIMITER ;
 
 call travel_details(206);
 -- ----------------------------------------------------------------------------------------------------------------------------
 --  Query 3 To find pilot information with the passenger ID.
 DELIMITER //
 create  procedure pilot_details (IN i int,out j varchar(30))
 begin
 select staff.staff_name 
 from staff join travel_info on staff.Flight_id = travel_info.Flight_id
 where staff.Role = "Pilot" and staff.Flight_id = (select travel_info.Flight_id from passengers join travel_info on 
 passengers.Passenger_id = travel_info.Passenger_id where passengers.Passenger_id = i)
 ;
 end //
 DELIMITER ;
 
 call pilot_details (201,@pilot_name);
 -- -----------------------------------------------------------------------------------------------------------------------------
--  Query 4 A view function to provide the available flights from USA
 create view Flights_From_USA as
 select flights.Flight_id,flights.Airline,
 (select airport.city from airport where flights.destination_id = airport.airport_id ) as Destinaton_city,
 (select airport.country from airport where flights.destination_id = airport.airport_id ) as Destinaton_country
 from flights  join airport  on flights.origin_id = airport.airport_id 
 where flights.origin_id in (select airport_id from airport where airport.country="USA" );
 
 select * from Flights_From_USA;
 -- ------------------------------------------------------------------------------------------------------------------------------ 
-- Query 5 To find the usage of given aircraft type
DELIMITER //
 create  procedure flight_type_usage (IN i varchar(30))
 begin
 select flights.Flight_id,flights.Airline
from flights join flight_specification on flights.Flight_id=flight_specification.Flight_id
where flight_specification.Aircraft_type = i;

 end //
 DELIMITER ;
 
 call flight_type_usage('Boeing 737');




 
 
 
 


