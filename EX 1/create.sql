CREATE TABLE Airplane(
    ID INTEGER NOT NULL PRIMARY KEY,
    ManufactureYear INTEGER NOT NULL CHECK (ManufactureYear > 1980 AND ManufactureYear < 2020),
    Model VARCHAR(50) NOT NULL
);

CREATE TABLE Flight(
    SerialNumber INTEGER NOT NULL PRIMARY KEY,
    FlightDate DATE NOT NULL,
    FlightTime TIME,
    AirplaneID INTEGER NOT NULL,
    FOREIGN KEY (AirplaneID)
                   REFERENCES Airplane(ID) ON DELETE CASCADE,

    UNIQUE(FlightDate, FlightTime, AirplaneID)
);

CREATE TABLE Person(
    ID INTEGER NOT NULL PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Pilot(
    ID INTEGER NOT NULL PRIMARY KEY,
    FOREIGN KEY (ID) 
                  REFERENCES Person(ID) ON DELETE CASCADE
);


CREATE TABLE Flown_by(
    Pilot_ID INTEGER NOT NULL,
    Flight_Number INTEGER NOT NULL,
    FOREIGN KEY (Pilot_ID)
                     REFERENCES Pilot(ID) ON DELETE CASCADE ,
    FOREIGN KEY (Flight_Number)
                     REFERENCES Flight(SerialNumber) ON DELETE CASCADE ,
    PRIMARY KEY (Pilot_ID, Flight_Number)
);

CREATE TABLE Client(
    PhoneNumber INTEGER NOT NULL CHECK ( PhoneNumber > 0 ) ,
    BirthDate DATE DEFAULT('1111-11-11') , -- If birth date is unknown, then a default value is entered
    ID INTEGER NOT NULL PRIMARY KEY,
    FOREIGN KEY (ID)
                REFERENCES Person(ID) ON DELETE CASCADE
);

CREATE TABLE VIP_client(
    Points INTEGER NOT NULL CHECK ( Points > 0 ),
    ID INTEGER NOT NULL PRIMARY KEY CHECK ( ID > 0 ),
    FOREIGN KEY (ID)
        REFERENCES Person(ID) ON DELETE CASCADE
);


CREATE TABLE Regular_Client(
    ID INTEGER NOT NULL CHECK ( ID > 0 ) PRIMARY KEY,
    FOREIGN KEY (ID)
        REFERENCES Client(ID) ON DELETE CASCADE
);

CREATE TABLE Seat(
    Row INTEGER NOT NULL CHECK ( Row > 0 AND Row < 21 ),
    Aisle CHAR(1) NOT NULL CHECK ( Aisle >= 'A' AND Aisle <= 'J' ),
    FlightNumber INTEGER NOT NULL,
    FOREIGN KEY (FlightNumber)
                 REFERENCES Flight(serialnumber) ON DELETE CASCADE,

    PRIMARY KEY (Row, Aisle, FlightNumber)
);


CREATE TABLE Regular_Seat(
    Row INTEGER NOT NULL,
    Aisle CHAR(1) NOT NULL ,
    FlightNumber INTEGER NOT NULL ,
    FOREIGN KEY (Row, Aisle, FlightNumber)
                         REFERENCES Seat(Row, Aisle, FlightNumber) ON DELETE CASCADE ,
    PRIMARY KEY (Row, Aisle, FlightNumber)
);


CREATE TABLE VIP_Seat(
    Row INTEGER NOT NULL ,
    Aisle CHAR(1) NOT NULL ,
    FlightNumber INTEGER NOT NULL ,
    FOREIGN KEY (Row, Aisle, FlightNumber)
                    REFERENCES Seat(Row, Aisle, FlightNumber) ON DELETE CASCADE,

    PRIMARY KEY (Row, Aisle, FlightNumber)
);

CREATE TABLE Buying_Regular_Ticket(
    Price INTEGER NOT NULL CHECK ( Price > 0 ),
    Row INTEGER NOT NULL ,
    Aisle CHAR(1) NOT NULL ,
    FlightNumber INTEGER NOT NULL ,
    ClientID INTEGER,
    FOREIGN KEY (Row, Aisle, FlightNumber)
                         REFERENCES Regular_Seat(Row, Aisle, FlightNumber) ON DELETE CASCADE ,
    FOREIGN KEY (ClientID)
                         REFERENCES Regular_Client(ID) ON DELETE CASCADE ,
    PRIMARY KEY (Row, Aisle, FlightNumber)

);

create TABLE Buying_VIP_Ticket(
    Price INTEGER NOT NULL CHECK ( Price > 0 ),
    Row INTEGER NOT NULL ,
    Aisle CHAR(1) NOT NULL ,
    FlightNumber INTEGER NOT NULL ,
    VIP_Client_ID INTEGER,
    FOREIGN KEY (Row, Aisle, FlightNumber)
                              REFERENCES VIP_Seat(Row, Aisle, FlightNumber) ON DELETE CASCADE ,
    FOREIGN KEY (VIP_Client_ID)
                              REFERENCES VIP_client(ID) ON DELETE CASCADE ,
    PRIMARY KEY (Row, Aisle, FlightNumber)

);


/*
INSERT INTO Airplane
    VALUES (12563, 1995, 'Boing767');
INSERT INTO Airplane
    VALUES (12122, 2003, 'Boing767');

INSERT INTO Flight
    VALUES (12563, DATE '2001-09-28', TIME '10:00');
INSERT INTO Flight
    VALUES (120, DATE '2015-11-28', TIME '23:03');

INSERT INTO PERSON
    VALUES (313012809, 'Yulia');
INSERT INTO PERSON
    VALUES (024584364, 'dani');
INSERT INTO PERSON
    VALUES (314442809, 'TOM');

INSERT INTO Pilot
    VALUES (313012809);

INSERT INTO Client
    VALUES (0542501787, DATE '2018-01-01', 313012809);

SELECT * fROM Airplane;
SELECT * fROM Airplane;
SELECT * FROM Flight;
SELECT * fROM Person;
SELECT * FROM Pilot;

 */
