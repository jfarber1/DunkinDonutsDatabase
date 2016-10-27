CREATE DATABASE DunkinDonuts;
GO

USE DunkinDonuts;
GO

CREATE TABLE Customer(
  CustomerID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  Email varchar(50) NOT NULL,
  Address varchar(50) NOT NULL,
  ZipCode bigint NOT NULL,
  CreditCardID bigint NOT NULL);


CREATE TABLE Store(
  StoreID bigint NOT NULL PRIMARY KEY,
  Name varchar(50) NOT NULL,
  Type varchar(50) NOT NULL,
  Country varchar(50) NOT NULL,
  Region varchar(50) NOT NULL,
  City varchar(50) NOT NULL,
  ZipCode varchar(50) NOT NULL,
  Address varchar(50) NOT NULL,
  Phone varchar(50) NOT NULL,
  YearEstablished bigint NOT NULL);


CREATE TABLE Employee(
  EmployeeID bigint NOT NULL PRIMARY KEY,
  FirstName varchar(50) NOT NULL,
  LastName varchar(50) NOT NULL,
  StoreID bigint NOT NULL,
  Address varchar(50) NOT NULL,
  IsStoreManager bit NOT NULL,
  Position bigint NOT NULL);


CREATE TABLE OrderHeader(
  OrderID bigint NOT NULL PRIMARY KEY,
  SubTotal float NOT NULL,
  TaxAmt float NOT NULL,
  TotalDue float NOT NULL,
  PaymentType varchar(50) NOT NULL,
  CreditCardID bigint NOT NULL,
  EmployeeID bigint NOT NULL,
  StoreID bigint NOT NULL);


CREATE TABLE OrderDetail(
  OrderID bigint NOT NULL,
  OrderDetailID bigint NOT NULL PRIMARY KEY,
  StoreID bigint NOT NULL,
  MenuItemID bigint NOT NULL,
  Quantity bigint NOT NULL,
  LineTotal bigint NOT NULL);


CREATE TABLE CreditCard(
  CreditCardID bigint NOT NULL,
  Provider varchar(50) NOT NULL PRIMARY KEY,
  ExpirationDate varchar(50) NOT NULL,
  LastFour int NOT NULL);


CREATE TABLE SeasonalMenu(
  SeasonalID bigint NOT NULL PRIMARY KEY,
  MenuNickname varchar(50) NOT NULL,
  MenuItemID bigint NOT NULL);


CREATE TABLE FoodMenu(
  FoodID bigint NOT NULL PRIMARY KEY,
  FoodName varchar(50) NOT NULL,
  FoodCategory varchar(50) NOT NULL,
  FoodCalories varchar(50) NOT NULL,
  isSeasonal bit NOT NULL,
  SeasonalDates varchar(50) NOT NULL,
  SeasonalID varchar(50) NOT NULL,
  IsMadeInStore bit NOT NULL,
  UnitPrice varchar(50) NOT NULL,
  HasQuantityPriceReduction bit NOT NULL,
  HalfDozenPrice varchar(50) NOT NULL,
  DozenPrice varchar(50) NOT NULL);

  
CREATE TABLE DrinkMenu(
  DrinkID bigint NOT NULL PRIMARY KEY,
  DrinkName varchar(50) NOT NULL,
  DrinkCalories int NOT NULL,
  DrinkCategory varchar(50) NOT NULL,
  IsSeasonal bit NOT NULL,
  SeasonalStartDate varchar(50) NOT NULL,
  SeasonalEndDate varchar(50) NOT NULL,
  SeasonalID bigint NOT NULL,
  IsMadeInStore bit NOT NULL,
  SmallPrice int NOT NULL,
  MediumPrice int NOT NULL,
  LargePrice int NOT NULL,
  VendorPrice int NOT NULL);


CREATE TABLE MenuItem(
  MenuItemID bigint NOT NULL PRIMARY KEY,
  IsDrink bit NOT NULL,
  DrinkID bigint NOT NULL,
  FoodID bigint NOT NULL,
  IsSeasonal bit NOT NULL,
  SeasonalID bigint NOT NULL,
  StoreID bigint NOT NULL); 



  INSERT INTO Customer(CustomerID, FirstName, LastName, Email, Address, ZipCode, CreditCardID) VALUES
(1001, 'Jane', 'Harrington', 'bella321@aol.com', '949 Wellington Road', 33434, 255),
(1002, 'Max', 'Bourne', 'maxbourne@gmail.com', '330 Atlantic Ave', 33455, 261),
(1003, 'Marybelle', 'Williams', 'marybelle@williams.com', '5 Wilson Dr', 33435, 253),
(1004, 'Jay', 'Mobilia', 'jmobilia561@gmail.com', '35 Duncan Dr', 33434, NULL),
(1005, 'Gina', 'OConnell', 'goconnell@tmt.com', '210 Broken Sound Dr', 33430, 251),
(1006, 'Gino', 'Ginopoulos', 'ginogino@gmail.com', '13 Mulholland Dr', 33434, 252),
(1007, 'Andrew', 'Andrewson', 'aandrews@gmail.com', '213 Atlantic Ave', 33444, 254),
(1008, 'Michelle', 'Vozzella', 'mvozz@gmail.com', '40 Arrieta Dr', 33434, 259),
(1009, 'Sophie', 'Cluie', 'sophiecluie@tmt.com', '53 Duncan Dr', 33434, 260),
(1010, 'Isabel', 'Santos', 'isantos@futuretechnologies.com', '93 Kellerman Rd', 33434, 256),
(1011, 'Joseph', 'Adande', 'jayadande@gmail.com', '31 Durant Dr', 33434, 258);

INSERT INTO Store(StoreID, Name, Type, Country, Region, City, ZipCode, Address, Phone, YearEstablished) VALUES
(10001, 'Atlantic Ave', 'DriveThru', 'U.S.', 'Southeast', 'Delray Beach', 33444, '200 Atlantic Ave', 561-222-3245, 2009),
(10002, 'Boca Mall', 'Mall', 'U.S.', 'Southeast', 'Boca Raton', 33434, '12 Boca Dr', 561-233-3200, 2015),
(10003, 'FAU', 'School', 'U.S.', 'Southeast', 'Boca Raton', 33434, '15 Florida Atlantic Dr', 561-222-3245, 2012),
(10004, 'Mizner', 'Regular', 'U.S.', 'Southeast', 'Boca Raton', 33432, '327 Plaza Real', 561-222-3223, 2010),
(10005, 'Spanish River', 'DriveThru', 'U.S.', 'Southeast', 'Boca Raton', 33431, '4143 N Federal Hwy', 561-222-3241, 2008),
(10006, 'Kings Point', 'DriveThru', 'U.S.', 'Southeast', 'Delray Beach', 33484, '11 Las Verdes Cir', 908-123-3245, 2011),
(10007, 'High Point', 'Regular', 'U.S.', 'Southeast', 'Delray Beach', 33484, '14378 S Military Trail', 561-496-1080, 2009),
(10008, 'Valencia Palms', 'DriveThru', 'U.S.', 'Southeast', 'Delray Beach', 33446, '6660 Summerland Blvd', 561-873-9129, 2013),
(10009, 'Gulf Stream', 'DriveThru', 'U.S.', 'Southeast', 'Delray Beach', 33483, '3254 Gulf Stream Rd', 561-455-2304, 2006),
(10010, 'Pine Grove', 'DriveThru', 'U.S.', 'Southeast', 'Delray Beach', 33444, '350 SW 10th St', 561-333-1198, 2013);

INSERT INTO Employee(EmployeeID, FirstName, LastName, StoreID, IsStoreManager, Position) VALUES
(5001, 'Joos', 'Beckert', 10001, 0, 'Cashier'),
(5002, 'Monty', 'Wills', 10001, 1, 'Manager'),
(5003, 'Sydney', 'Williams', 10002, 0, 'Cashier'),
(5004, 'Jack', 'Cropper', 10002, 1, 'Manager'),
(5005, 'Ellie', 'Morrison', 10001, 0, 'Service'),
(5006, 'Alex', 'Simon', 10003, 1, 'Manager'),
(5007, 'Katherine', 'Boatright', 10003, 0, 'Service'),
(5008, 'Cade', 'Stevenson', 10004, 0, 'Cashier'),
(5009, 'Julia', 'Kross', 10004, 1, 'Manager'),
(5010, 'Tianna', 'Tirrell', 10004, 0, 'Service'),
(5011, 'Cam', 'Armstrong', 10005, 0, 'Cashier'),
(5012, 'Rosy', 'Braddock', 10005, 1, 'Manager'),
(5013, 'Barbra', 'Simmons', 10005, 0, 'Cashier'),
(5014, 'Jay', 'Linton', 10006, 1, 'Manager'),
(5015, 'Lois', 'Edwards', 10006, 0, 'Service'),
(5016, 'Meghan', 'Scott', 10007, 1, 'Manager'),
(5017, 'Katie', 'Sheehy', 10007, 0, 'Service'),
(5018, 'Selma', 'Burke', 10007, 0, 'Cashier'),
(5019, 'Mark', 'Carlisle', 10008, 1, 'Manager'),
(5020, 'Jessica', 'Rier', 10008, 0, 'Service'),
(5021, 'Alysa', 'Neal', 10008, 0, 'Cashier'),
(5022, 'Denzel', 'Pierson', 10009, 1, 'Manager'),
(5023, 'Rosanna', 'Barker', 10009, 0, 'Cashier'),
(5024, 'Alexandra', 'Cooper', 10010, 1, 'Manager'),
(5025, 'Judd', 'Wyght', 10010, 0, 'Cashier'),
(5026, 'Roxanne', 'Clark', 10010, 0, 'Service');

INSERT INTO CreditCard(CreditCardID, Provider, ExpirationDate,LastFour) VALUES
(7001, 'Visa', '10/21', 3433),
(7002, 'Visa', '02/20', 4560),
(7003, 'Mastercard', '01/17', 1292),
(7004, 'Visa', '05/18', 2030),
(7005, 'Mastercard', '03/20', 7463),
(7006, 'AMEX', '10/22', 2950),
(7007, 'AMEX', '11/21', 6461),
(7008, 'AMEX', '05/17', 8537),
(7009, 'Visa', '03/23', 9483),
(7010, 'Mastercard', '04/20', 7437);

INSERT INTO OrderHeader(OrderID, SubTotal, TaxAmt, TotalDue, PaymentType, EmployeeID, StoreID, CreditCardID) VALUES
(100001, 11.14, 0.67, 11.81, Cash, 5001, 10001, NULL),
(100002, 2.29, 0.14, 2.43, Cash, 5001, 10001, NULL),
(100003, 3.98, 0.24, 4.22, Credit, 5001, 10001, 9483),
(100004, 1.20, 0.07, 1.27, Cash, 5004, 10002, NULL),
(100005, 3.38, 0.20, 3.58, Credit, 5004, 10002, 7463),
(100006, 3.89, 0.23, 4.12, Credit, 5004, 10002, 3433),
(100007, 1.20, 0.07, 1.27, Credit, 5006, 10003, 6461),
(100008, 2.07, 0.12, 2.19, Credit, 5006, 10003, 3433),
(100009, 1.49, 0.09, 1.58, Cash, 5006, 10003, NULL),
(100010, 14.36, 0.86, 15.22, Credit, 5008, 10004, 2030),
(100011, 3.78, 0.23, 4.01, Cash, 5008, 10004, NULL),
(100012, 7.41, 0.44, 7.85, Cash, 5008, 10004, NULL),
(100013, 1.49, 0.09, 1.58, Credit, 5008, 10004, 4560),
(100014, 2.79, 0.17, 2.96, Credit, 5011, 10005, 6461),
(100015, 1.69, 0.10, 1.79, Cash, 5011, 10005, NULL),
(100016, 2.29, 0.14, 2.43, Credit, 5013, 10005, 4560),
(100017, 6.00, 0.36, 6.36, Credit, 5011, 10005, 1292),
(100018, 1.69, 0.10, 1.79, Credit, 5015, 10006, 2950),
(100019, 2.29, 0.14, 2.43, Cash, 5015, 10006, NULL),
(100020, 1.49, 0.09, 1.58, Cash, 5015, 10006, NULL),
(100021, 6.88, 0.41, 7.29, Credit, 5018, 10007, 6461),
(100022, 6.07, 0.36, 6.43, Credit, 5021, 10008, 8537),
(100023, 4.48, 0.27, 4.75, Cash, 5021, 10008, NULL),
(100024, 2.50, 0.15, 2.65, Cash, 5023, 10009, NULL),
(100025, 7.79, 0.47, 8.26, Cash, 5023, 10009, NULL),
(100026, 5.19, 0.31, 5.50, Credit, 5023, 10009, 4560),
(100027, 2.29, 0.14, 2.43, Credit, 5025, 10010, 9483),
(100028, 4.00, 0.24, 4.24, Credit, 5025, 10010, 8537),
(100029, 2.07, 0.12, 2.19, Cash, 5026, 10010, NULL);

INSERT INTO OrderDetail(OrderID, OrderDetailID, Date, MenuItemID, Quantity, LineTotal) VALUES
(100001, 200001, 1006, 2, 4.14),
(100001, 200002, 2005, 12, 7.00),
(100002, 200003, 1010, 1, 2.29),
(100003, 200004, 1008, 1, 1.69),
(100003, 200005, 1008, 1, 2.29),
(100004, 200006, 2001, 2, 1.20),
(100005, 200007, 2004, 1, 0.59),
(100005, 200008, 1007, 1, 2.79),
(100006, 200009, 1003, 1, 1.49),
(100006, 200010, 2003, 2, 2.40),
(100007, 200011, 2002, 1, 1.20),
(100008, 200012, 1006, 1, 2.07),
(100009, 200013, 1004, 1, 1.49),
(100010, 200014, 1008, 1, 2.79),
(100010, 200015, 2006, 1, 2.50),
(100010, 200016, 2007, 2, 7.00),
(100010, 200017, 1002, 1, 2.07),
(100011, 200018, 1007, 1, 2.29),
(100011, 200019, 1004, 1, 1.49),
(100012, 200020, 2003, 1, 1.20),
(100012, 200021, 1006, 3, 6.21),
(100013, 200022, 1005, 1, 1.49),
(100014, 200023, 1001, 1, 2.79),
(100015, 200024, 1008, 1, 1.69),
(100016, 200025, 1008, 1, 2.29),
(100017, 200026, 2003, 6, 6.00),
(100018, 200027, 1008, 1, 1.69),
(100019, 200028, 1007, 1, 2.29),
(100020, 200029, 1003, 1, 1.49),
(100021, 200030, 2007, 1, 3.50),
(100021, 200031, 1007, 2, 3.38),
(100022, 200032, 2005, 6, 4.00),
(100022, 200033, 1006, 1, 2.07),
(100023, 200034, 1008, 1, 1.69),
(100023, 200035, 1008, 1, 2.79),
(100024, 200036, 2006, 1, 2.50),
(100025, 200037, 2006, 2, 5.00),
(100025, 200038, 1007, 1, 2.79),
(100026, 200039, 1008, 1, 1.69),
(100026, 200040, 2007, 1, 3.50),
(100027, 200041, 1007, 1, 2.29),
(100028, 200042, 2005, 6, 4.00),
(100029, 200043, 1004, 1, 2.07);


INSERT INTO MenuItem(MenuItemID, IsDrink, DrinkID, FoodID,IsSeasonal,SeasonalID) VALUES
(101, 1, 1001,NULL, 0,NULL),
(102, 1, 1002,NULL, 0, NULL),
(103, 1, 1003,NULL, 0, NULL),
(104, 1, 1004, NULL, 0, NULL),
(105, 1, 1005, NULL, 0, NULL),
(106, 1, 1006, NULL, 0, NULL),
(107, 1, 1007, NULL, 0, NULL),
(108, 1, 1008, NULL, 0, NULL),
(109, 1, 1009, NULL, 0, NULL),
(110, 1, 1010, NULL, 0, NULL),
(111, 1, 1011, NULL, 0, NULL),
(112, 1, 1012, NULL, 1, 1112),
(113, 1, 1013, NULL, 1, 1113),
(114, 1, 1014, NULL, 1, 1114),
(115, 1, 1015, NULL, 1, 1115),
(116, 1, 1016, NULL, 1, 1116),
(201, 0, NULL,2001,0, NULL),
(202, 0, NULL,2002,0, NULL),
(203, 0, NULL,2003,0, NULL),
(204, 0, NULL,2004,0, NULL),
(205, 0, NULL,2005,0, NULL),
(206, 0, NULL,2006,0, NULL),
(207, 0, NULL,2007,0, NULL),
(208, 0, NULL,2008,0,NULL),
(209, 0, NULL ,2009,0,NULL),
(210, 0, NULL,2010,1,2110),
(211, 0, NULL,2011,1,2111),
(212, 0, NULL, 2012,1,2112),
(213, 0, NULL,2013,1,2113),
(214, 0, NULL,2014,1, 2114),
(215, 0, NULL,2015,1, 2115);


INSERT INTO DrinkMenu(DrinkID, DrinkName, DrinkCalories, DrinkCategory, IsSeasonal, SeasonalCode,SeasonalID, IsMadeInStore, SmallPrice, MediumPrice, LargePrice, VendorPrice) VALUES
(1001, 'Cappuchino', 300, 'hot', 0, NULL, NULL,1, 1.49, 2.07,2.79,0),
(1002, 'Dunkaccino', 350, 'hot', 0, NULL, NULL,1,1.49, 2.07,2.79,0),
(1003, 'Hot Chocolate', 200, 'hot', 0,NULL, NULL,1,1.49, 2.07,2.79,0),
(1004, 'Hot Coffee', 50, 'hot', 0,NULL, NULL, 1,1.49, 2.07,2.79,0),
(1005, 'Hot Tea', 30, 'hot', 0, NULL, NULL,1,1.49, 2.07,2.79,0),
(1006, 'Latte', 450, 'hot', 0,NULL, NULL,1,1.49, 2.07,2.79,0),
(1007, 'Iced Macchiato', 250, 'cold', 0, NULL, NULL, 1,1.69,2.29,2.79,0),
(1008, 'Iced Latte', 300, 'cold', 0,NULL, NULL,1,1.69,2.29,2.79,0),
(1009, 'Sweet Tea', 40, 'cold', 0, NULL,NULL,1,1.69,2.29,2.79,0),
(1010, 'Iced Tea', 25, 'cold', 0, NULL,NULL,1,1.69,2.29,2.79,0),
(1011, 'water', 0, 'cold', 0, NULL, NULL,0,NULL,NULL,NULL,1.50),
(1012, 'Smoothie',200,'cold', 1,2, 1112,1,2.00,3.00,3.50,0),
(1013, 'Mango Coffee', 100, 'hot',1,3,1113,1,2.00,3.00,3.50,0),
(1014, 'Chocolate Chip Coffee',50,'hot',1,3,1114,1,2.00,3.00,3.50,0),
(1015, 'Cider Tea', 30, 'cold',1,4,1115,1,1.50,2.00,3.00,0),
(1016, 'Snowflake Latte' 200, 'hot', 1,1,1116,1,2.00,3.00,3.50,0);




INSERT INTO FoodMenu(FoodID, FoodName, FoodCalories, FoodCategory,IsSeasonal,SeasonalCode, SeasonalID,IsMadeInStore, UnitPrice, HasQualityPriceReduction, HalfDozenPrice, DozenPrice) VALUES
(2001, 'Plain Bagel', 200, 'Bakery', 0,NULL,NULL, 1,1.20,1, 6.00,12.00),
(2002, 'Blueberry Muffin', 550, 'Bakery', 0,NULL,NULL,1,1.20,1,6.00,12.00),
(2003, 'Chocolate Donut', 300, 'Bakery',0,NULL,NULL,1, 1.20,1,6.00,12.00),
(2004, 'Cookie', 90, 'Bakery',0,NULL,NULL,1, 0.59,0,NULL,NULL),
(2005, 'Munchkin', 70, 'Bakery',0, NULL,NULL,1, 0.75,1, 4.00, 7.00),
(2006, 'Bacon Egg and Cheese', 450,'Breakfast Sandwich',0,NULL,NULL,1,2.50,0,NULL,NULL),
(2007, 'Egg White Flatbread', 200, 'Breakfast Sandwich',0,NULL,NULL,1,3.50,0,NULL,NULL),
(2008, 'Turkey Sausage Flatbread', 350, 'Breakdast Sandwich',0,NULL,NULL,1,3.30,0,NULL,NULL),
(2009, 'Ham and Chedder', 240, 'Bakery Sandwich',0,NULL,NULL,1,4.50,0,NULL,NULL),
(2010, 'Danish', 400, 'Bakery',0,NULL,NULL,1, 1.23,1,6.00,12.00),
(2011, 'Pumpkin Donut', 200, 'Bakery',1, 4,2111,1,2.20,1,6.00,12.00),
(2012, 'Oreo Donut',300, 'Bakery',1,3,2112,1,1.50, 1,6.00,12.00),
(2013, 'Health Bar Donut', 250,'Bakery',1,3,2113,1,1.50,1,6.00,12.00),
(2014, 'Pumpkin Munchkin',70,'Bakery',1,4,2114,1,0.25,1, 2.00, 4.00),
(2015, 'Cider Donuts', 300,'Bakery',1,4,2115,1,1.50,1,6.00,12.00);




INSERT INTO SeasonalMenu(SeasonalID, Season, MenuID) VALUES
(2111,'Fall', 210),
(2112,'Summer', 211),
(2113,'Summer',212),
(2114,'Fall',213),
(2115,'Fall', 214),
(1112,'Spring',112),
(1113,'Summer', 113),
(1114,'Summer', 114),
(1115,'Fall', 115),
(1116,'Winter', 116);

