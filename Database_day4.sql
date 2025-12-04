use testdatabase;

create table PetOwners(
	ownerID int primary key auto_increment,
    name varchar(5),
    contact varchar(11)
);

create table Pets(
	petID int primary key auto_increment,
    ownerID int,
	foreign key(ownerID) references PetOwners(ownerID),
    name varchar(5),
    species varchar(10),
    breed varchar(10)
);

create table Rooms(
	roomID int primary key auto_increment,
    roomNumber int,
    roomType enum('Standard', 'Deluxe'),
    pricePerNight int
);

create table Reservations(
	reservationID int primary key auto_increment,
    petID int,
    foreign key(petID) references Pets(petID),
    roomID int,
    foreign key(roomID) references Rooms(roomID),
    startDate date,
    endDate date
);

create table Services(
	serviceID int primary key auto_increment,
    reservationID int,
    foreign key(reservationID) references Reservations(reservationID),
    serviceName varchar(20),
    servicePrice int
);