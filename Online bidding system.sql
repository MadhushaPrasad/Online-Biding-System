DROP DATABASE onlineBiddingSystem;
CREATE DATABASE onlineBiddingSystem;
USE onlineBiddingSystem;

CREATE TABLE Users
(
    userID    int          NOT NULL AUTO_INCREMENT,
    userName  VARCHAR(25)  NOT NULL,
    f_Name    varchar(255) NOT NULL,
    l_Name    varchar(255) NOT NULL,
    email     VARCHAR(100) NOT NULL,
    telephone VARCHAR(10)  NOT NULL,
    address   VARCHAR(255) NOT NULL,
    password  VARCHAR(10)  NOT NULL,
    img       VARCHAR(255) NOT Null,
    type      VARCHAR(10)  NOT NULL,
    status    VARCHAR(10)  NOT NULL,
    CONSTRAINT PRIMARY KEY (userID)
);


CREATE TABLE Category
(
    category_ID  int          NOT NULL AUTO_INCREMENT,
    categoryName VARCHAR(150) NOT NULL,
    CONSTRAINT PRIMARY KEY (category_ID)
);

CREATE TABLE Sub_Category
(
    subCategory_ID  int          NOT NULL AUTO_INCREMENT,
    category_ID     int          NOT NULL,
    subCategoryName VARCHAR(150) NOT NULL,
    CONSTRAINT PRIMARY KEY (subCategory_ID),
    CONSTRAINT FOREIGN KEY (category_ID) REFERENCES Category (category_ID)
        On UPDATE CASCADE On DELETE CASCADE
);

CREATE TABLE Item
(
    itemID      int            NOT NULL AUTO_INCREMENT,
    category_ID int            NOT NULL,
    userID      int            NOT NULL,
    name        VARCHAR(255)   NOT NULL,
    description LONGTEXT       NOT NULL,
    price       DECIMAL(10, 2) NOT NULL,
    image       VARCHAR(255)   NOT NULL,
    status      VARCHAR(10)    NOT NULL,
    CONSTRAINT PRIMARY KEY (itemID),
    CONSTRAINT FOREIGN KEY (category_ID) REFERENCES Category (category_ID)
        On UPDATE CASCADE On DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (userID) REFERENCES Users (userID)
        On UPDATE CASCADE On DELETE CASCADE
);



CREATE TABLE Item_payment
(
    item_PaymentID int            NOT NULL AUTO_INCREMENT,
    itemID         int            NOT NULL,
    cardNumber     VARCHAR(16)    NOT NULL,
    amount         DECIMAL(10, 2) NOT NULL,
    eXDate         DATE           NOT NULL,
    CONSTRAINT PRIMARY KEY (item_PaymentID),
    CONSTRAINT FOREIGN KEY (itemID) REFERENCES Item (itemID)
        On UPDATE CASCADE On DELETE CASCADE
);

CREATE TABLE Item_Payment_Type
(
    item_PaymentType VARCHAR(150) NOT NULL,
    item_PaymentID   int          NOT NULL,
    CONSTRAINT PRIMARY KEY (item_PaymentType),
    CONSTRAINT FOREIGN KEY (item_PaymentID) REFERENCES Item_payment (item_PaymentID)
        On UPDATE CASCADE On DELETE CASCADE
);

CREATE TABLE Bid
(
    bid_ID   int            NOT NULL AUTO_INCREMENT,
    userID   int            NOT NULL,
    itemID   int            NOT NULL,
    amount   DECIMAL(10, 2) NOT NULL,
    bid_time DATE           NOT NULL,
    bid_date TIME           NOT NULL,
    status   VARCHAR(10)    NOT NULL,
    CONSTRAINT PRIMARY KEY (bid_ID),
    CONSTRAINT FOREIGN KEY (userID) REFERENCES Users (userID)
        On UPDATE CASCADE On DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (itemID) REFERENCES Item (itemID)
        On UPDATE CASCADE On DELETE CASCADE
);

CREATE TABLE Payment
(
    bid_PaymentID int            NOT NULL AUTO_INCREMENT,
    bid_ID        int            NOT NULL,
    cardNumber    VARCHAR(16)    NOT NULL,
    amount        DECIMAL(10, 2) NOT NULL,
    eXDate        DATE           NOT NULL,
    CONSTRAINT PRIMARY KEY (bid_PaymentID),
    CONSTRAINT FOREIGN KEY (bid_ID) REFERENCES Bid (bid_ID)
        On UPDATE CASCADE On DELETE CASCADE
);

CREATE TABLE FeedBack
(
    fb_ID       int      NOT NULL AUTO_INCREMENT,
    userID      int      NOT NULL,
    description LONGTEXT NOT NULL,
    CONSTRAINT PRIMARY KEY (fb_ID),
    CONSTRAINT FOREIGN KEY (userID) REFERENCES Users (userID)
        On UPDATE CASCADE On DELETE CASCADE
);


INSERT INTO Users(userName, f_Name, l_Name, email, telephone, address, password, img, type)
VALUES ('nethmini99', 'nethmini', 'tharuka', 'tharukatharu@gmail.com', '0777639027', 'Tangalle', '1234', 'profile.jpg',
        'Bidder');
		
INSERT INTO Users(userName, f_Name, l_Name, email, telephone, address, password, img, type)
VALUES ('nethmini99', 'nethmini', 'tharuka', 'tharukatharu@gmail.com', '0777639027', 'Tangalle', '1234', 'profile.jpg',
        'Seller');

INSERT INTO Users(userName, f_Name, l_Name, email, telephone, address, password, img, type)
VALUES ('nethmini99', 'nethmini', 'tharuka', 'tharukatharu@gmail.com', '0777639027', 'Tangalle', '1234', 'profile.jpg',
        'Admin');
INSERT INTO Item(category_ID, userID, name, description, price, image, status) VALUES (1,2,'Samsung Laptop','hsdghsdgdj',150000,'item.png','pending');

INSERT INTO Bid(userID, itemID, amount, bid_time, bid_date, status) VALUES (1,1,5000,current_time(),current_time,'running');
/*UPDATE Bid set bid_ID=?,userID=?,itemID=?,amount=?,bid_date = urrent_time(),bid_time=urrent_time(),status='running' WHERE bid_ID = ?;*/



