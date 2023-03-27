CREATE DATABASE DSI_Company;
CREATE TABLE Product
(
pro_id varchar(20) PRIMARY KEY NOT NULL CHECK(pro_id like'%P'),
pro_cus_id varchar(20) NOT NULL CHECK(pro_cus_id like'%PC'),
pro_type varchar(50) NOT NULL,
pro_item varchar(100) NOT NULL,
quantity int NOT NULL,
pro_decs varchar(300)
)
 
 CREATE TABLE Shop
 (
 shop_id varchar(20) PRIMARY KEY NOT NULL CHECK(shop_id like'%S'),
 shop_name varchar(150) NOT NULL,
 shop_type varchar(50) NOT NULL,
 city varchar(30) NOT NULL
 )

 CREATE TABLE Seller
 (
 s_id varchar(20) PRIMARY KEY NOT NULL CHECK(s_id like'%SL'),
 s_name varchar(250) NOT NULL,
 s_type varchar(50) NOT NULL,
 s_email varchar(150),
 city varchar(50) NOT NULL,
 shop_id varchar(20) FOREIGN KEY REFERENCES Shop(shop_id)
 )
 

 CREATE TABLE Role
 (
 role_id varchar(20) PRIMARY KEY NOT NULL CHECK(role_id like'%R'),
 role_name varchar(150) NOT NULL
 )


 CREATE TABLE Buyer
 (
 buyer_id varchar(20) PRIMARY KEY NOT NULL CHECK(buyer_id like '%B'),
 buyer_name varchar(250) NOT NULL,
 login_type varchar(50) NOT NULL,
 s_id varchar(20) FOREIGN KEY REFERENCES Seller(s_id),
 role_id varchar(20) FOREIGN KEY REFERENCES Role(role_id),
 pro_id varchar(20) FOREIGN KEY REFERENCES Product(pro_id)
 )

 CREATE TABLE Order_detail
 (
 order_id varchar(20) PRIMARY KEY NOT NULL CHECK(order_id like'%O'),
 order_type varchar(100) NOT NULL,
 order_date date DEFAULT GETDATE()
 )


 create table Customer_detail
 (
 cus_id varchar(20) PRIMARY KEY NOT NULL CHECK(cus_id like'%C'),
 cus_name varchar(250) NOT NULL,
 cus_pasword varchar(20) UNIQUE NOT NULL,
 cus_email varchar(150),
 order_id varchar(20) FOREIGN KEY REFERENCES Order_detail(order_id),
 buyer_id varchar(20) FOREIGN KEY REFERENCES Buyer(buyer_id)
 )


 CREATE TABLE Payment
 (
 pay_id varchar(20) PRIMARY KEY NOT NULL CHECK(pay_id like'%P'),
 pay_amount float(2) NOT NULL,
 pay_date date DEFAULT GETDATE(),
 pay_type varchar(50) NOT NULL,
 order_id varchar(20) FOREIGN KEY REFERENCES Order_detail(order_id)
 )

 CREATE TABLE Seller_mobile
 (
 s_id varchar(20) NOT NULL FOREIGN KEY REFERENCES Seller(s_id),
 mobile_no_01 int NOT NULL,
 mobile_no_02 int,
 PRIMARY KEY (s_id,mobile_no_01)
 )
 
 CREATE TABLE Customer_mobile
 (
 mobile_no int NOT NULL,
 lan_no int,
 cus_id varchar(20)  Not null FOREIGN KEY REFERENCES Customer_detail(cus_id),
 PRIMARY KEY (cus_id,mobile_no)
 )
 
 INSERT INTO Product
 VALUES ('0001P','001PC','DSI','Platfoarm women heels',5000,'made by plastic and glass' )

 INSERT INTO Product
 VALUES ('0002P','002PC','RANPA','Court shoes',6000,'made by leather and canves' )

 INSERT INTO Product
 VALUES ('0003P','003PC','DSI','Boots',7000,'made by leather' )

 
 INSERT INTO Product
 VALUES ('0004P','004PC','SAMSON','Cone heels',8000,'made by plastic' )

 INSERT INTO Product
 VALUES ('0005P','005PC','RANPA','Ballet float ',9000,'made by canves' )

 INSERT INTO Product
 VALUES ('0006P','006PC','DSI','Roller skate',7000,'made by plastic and rubber' )

 INSERT INTO Product
 VALUES ('0007P','007PC','RANPA','Flip flops',15000,'made by rubber' )

 INSERT INTO Product
 VALUES ('0008P','008PC','SAMSON','Ice skate',5000,'made by rubber' )

 INSERT INTO Product
 VALUES ('0009P','009PC','SAMSON','Flip flops',25000,'made by rubber' )

 INSERT INTO Product
 VALUES ('00010P','0010PC','SAMSON','Court shoes',5000,'made by rubber and canves' )

 INSERT INTO Shop
 VALUES ('01S','Nisal shoe conner','Mall','Galle' )

 INSERT INTO Shop
 VALUES ('02S','DSI show room','Store','Baddegama' )

 INSERT INTO Shop
 VALUES ('03S','RANPA shop','Booth shop','Hikkaduwa' )

 INSERT INTO Shop
 VALUES ('04S','Nithu shoe conner','Store','Ambalangoda' )

 INSERT INTO Shop
 VALUES ('05S','DSI show room','Mall','Alpitiya' )

 INSERT INTO Shop
 VALUES ('06S','SAMSON show room','Store','Alpitiya' )

 INSERT INTO Shop
 VALUES ('07S','SAMSON shoe conner','Store','Galle' )

 INSERT INTO Shop
 VALUES ('08S','RANPA shop','Booth shop','Karapitiya' )

 INSERT INTO Shop
 VALUES ('09S','Pathum shoe conner','Store','Udugama' )

 INSERT INTO Shop
 VALUES ('010S','Niru shoe conner','Store','Karapitiya' )

 INSERT INTO Seller
 VALUES ('001SL','Mr. L.K.Kulathunga','Merchant whole saller','lkkulatunga@gmail.com','Galle','01S' )


 INSERT INTO Seller
 VALUES ('002SL','Mr. M.Perera','Agent','mperera@gmail.com','Karapitiya','010S' )


 INSERT INTO Seller
 VALUES ('003SL','Mr. S.Nimal','Agent','snimal@gmail.com','Alpitiya','06S' )

 INSERT INTO Seller
 VALUES ('004SL','Mr. L.K.Kulathunga','Merchant whole saller','lkkulatunga@gmail.com','Galle','07S' )

 INSERT INTO Seller
 VALUES ('005SL','Mr. S.Jeewantha','Agent','sjeewantha@gmail.com','Karapitiya','08S' )

 INSERT INTO Seller
 VALUES ('006SL','Mr. P.Sujeewa','Merchant whole saller','sujeewa@gmail.com','Udugama','09S' )

 INSERT INTO Seller
 VALUES ('007SL','Mr. N.Manohara','Merchant whole saller','manohara@gmail.com','Baddegama','02S' )

INSERT INTO Seller
 VALUES ('008SL','Mr. S.Nimal','Agrnt','snimal@gmail.com','Ambalangoda','04S' )

INSERT INTO Seller
 VALUES ('009SL','Mr. M.priyashan','Agent','priyashan@gmail.com','Alpitiya','05S' )

 INSERT INTO Seller
 VALUES ('0010SL','Mr. L.K.Kulathunga','Merchant whole saller','lkkulatunga@gmail.com','Hikkaduwa','03S' )


 INSERT INTO Role
 VALUES ('001R','packing')

 INSERT INTO Role
 VALUES ('002R','storing')

 INSERT INTO Role
 VALUES ('003R','tagging price')

 INSERT INTO Role
 VALUES ('004R','tagging size')

 INSERT INTO Role
 VALUES ('005R','quallity checking')

 INSERT INTO Role
 VALUES ('006R','quantity checking')

 INSERT INTO Role
 VALUES ('007R','billing')

 INSERT INTO Role
 VALUES ('008R','rechecking')

 INSERT INTO Role
 VALUES ('009R','taking notes')

 INSERT INTO Role
 VALUES ('0010R','rechanging')

 INSERT INTO Buyer
 VALUES ('001B','Mr. M.Kamal','family shoes','001SL','001R','0001P')

 INSERT INTO Buyer
 VALUES ('002B','Mr. S.Sunil','children shoes','002SL','002R','0002P')

 INSERT INTO Buyer
 VALUES ('003B','Mr. P.Nimal','lady shoes','001SL','003R','0003P')

INSERT INTO Buyer
 VALUES ('004B','Mr. S.Perera','gent shoes','003SL','004R','0004P')

INSERT INTO Buyer
 VALUES ('005B','Mr. M.Danush','family shoes','002SL','005R','0005P')

INSERT INTO Buyer
 VALUES ('006B','Mr. M.Pathirana','lady shoes','004SL','006R','0006P')

INSERT INTO Buyer
 VALUES ('007B','Mr. L.Kumar','gent shoes','005SL','007R','0007P')

INSERT INTO Buyer
 VALUES ('008B','Mr. M.Nishantha','family shoes','006SL','008R','0008P')

 INSERT INTO Buyer
 VALUES ('009B','Mr. N.Perera','children shoes','007SL','009R','0009P')


 INSERT INTO Buyer
 VALUES ('0010B','Mr. K.Pathum','children shoes','008SL','0010R','00010P')

 INSERT INTO Order_detail
 VALUES ('001O','market order','2020-03-31')

 INSERT INTO Order_detail
 VALUES ('002O','limit order','2020-04-02')
 
 INSERT INTO Order_detail
 VALUES ('003O','stop order','2020-04-06')

 INSERT INTO Order_detail
 VALUES ('004O','by stop order','2020-04-10')

 INSERT INTO Order_detail
 VALUES ('005O','limit order','2020-04-20')

 INSERT INTO Order_detail
 VALUES ('006O','stop order','2020-04-22')

 INSERT INTO Order_detail
 VALUES ('007O','stop order','2020-04-22')

 INSERT INTO Order_detail
 VALUES ('008O','by stop order','2020-04-26')

 INSERT INTO Order_detail
 VALUES ('009O','market order','2020-04-30')

 INSERT INTO Order_detail
 VALUES ('0010O','market order','2020-05-06')

 INSERT INTO Customer_detail
 VALUES ('001C','Mr. Nimal','GD3002','nimal@gmai.com','001O','0010B')

 INSERT INTO Customer_detail
 VALUES ('002C','Mr. Kamal','GE3010','kamal@gmai.com','002O','009B')

 INSERT INTO Customer_detail
 VALUES ('003C','Mr. Prabath','GF3018','prabath@gmai.com','003O','008B')

 INSERT INTO Customer_detail
 VALUES ('004C','Mr. Nisal','GG3026','nisal@gmai.com','004O','007B')

 INSERT INTO Customer_detail
 VALUES ('005C','Mr. Suresh','GH3032','suresh@gmai.com','005O','006B')

 INSERT INTO Customer_detail
 VALUES ('006C','Mr. Kusum','GI3040','kusum@gmai.com','006O','005B')

 INSERT INTO Customer_detail
 VALUES ('007C','Mr. Dasun','GJ3048','dasun@gmai.com','007O','004B')

 INSERT INTO Customer_detail
 VALUES ('008C','Mr. Suneth','GK3056','suneth@gmai.com','008O','003B')

 INSERT INTO Customer_detail
 VALUES ('009C','Mr. Pathum','GL3064','pathum@gmai.com','009O','002B')

 INSERT INTO Customer_detail
 VALUES ('0010C','Mr. Sudewa','GM3072','sudewa@gmai.com','0010O','001B')

 INSERT INTO Payment
 VALUES ('001P',5000.00,'2020-06-01','cash','0010O')

 INSERT INTO Payment
 VALUES ('002P',6000.00,'2020-06-04','cheque','009O')


INSERT INTO Payment
 VALUES ('003P',7000.00,'2020-06-07','voucher','008O')


INSERT INTO Payment
 VALUES ('004P',25000.00,'2020-06-10','credit card','007O')


INSERT INTO Payment
 VALUES ('005P',15000.00,'2020-06-14','cash','006O')


INSERT INTO Payment
 VALUES ('006P',35000.00,'2020-06-18','cheque','005O')


INSERT INTO Payment
 VALUES ('007P',8000.00,'2020-06-22','voucher','004O')


INSERT INTO Payment
 VALUES ('008P',25000.00,'2020-06-24','credit card','003O')


INSERT INTO Payment
 VALUES ('009P',30000.00,'2020-06-26','cash','002O')


INSERT INTO Payment
 VALUES ('0010P',5000.00,'2020-06-30','cash','001O')

 INSERT INTO Seller_mobile
 VALUES ('001SL',0764591149,0759356585)

 INSERT INTO Seller_mobile
 VALUES ('002SL',0774291449,0769256585)

 INSERT INTO Seller_mobile
 VALUES ('003SL',0754594148,0759257585)

 INSERT INTO Seller_mobile
 VALUES ('004SL',0724221549,0759458585)

 INSERT INTO Seller_mobile
 VALUES ('005SL',0764348149,0709366585)

 INSERT INTO Seller_mobile
 VALUES ('006SL',0784591149,0789356585)

 INSERT INTO Seller_mobile
 VALUES ('007SL',0764349149,0759997585)


 INSERT INTO Seller_mobile
 VALUES ('008SL',0765341749,0788856585)

 INSERT INTO Seller_mobile
 VALUES ('009SL',0765557149,0756799585)

 INSERT INTO Seller_mobile
 VALUES ('0010SL',0764561239,0786565656)



 
 INSERT INTO Customer_mobile
 VALUES (0754591149,0911356585,'001C')

 INSERT INTO Customer_mobile
 VALUES (0764291449,0919256585,'002C')

 INSERT INTO Customer_mobile
 VALUES (0774594148,0919257585,'003C')

 INSERT INTO Customer_mobile
 VALUES (0784221549,0919458585,'004C')

 INSERT INTO Customer_mobile
 VALUES (0774348149,0919366585,'005C')

 INSERT INTO Customer_mobile
 VALUES (0754591149,0919356585,'006C')

 INSERT INTO Customer_mobile
 VALUES (0774349149,0919997585,'007C')


 INSERT INTO Customer_mobile
 VALUES (0755341749,0918856585,'008C')

 INSERT INTO Customer_mobile
 VALUES (0775557149,0916799585,'009C')

 INSERT INTO Customer_mobile
 VALUES (0754561239,0916565656,'0010C')




 SELECT pro_id,pro_type,pro_item
 FROM Product

 SELECT * FROM Shop

 SELECT s_id,s_name,city
 FROM Seller
 WHERE s_type='Agent'


 SELECT pay_id, pay_date
 FROM Payment
 WHERE pay_amount>6000


 SELECT pro_id,pro_item,quantity
 FROM Product
 WHERE pro_type='SAMSON'OR quantity>7000

 SELECT pro_id ,pro_type,pro_decs
 FROM Product
 WHERE pro_id='0008P' OR (pro_type='SAMSON' AND pro_decs='made by rubber')


 SELECT count (shop_id),city
 FROM Shop
 GROUP BY city
 
 SELECT MAX(pay_id), pay_amount
 FROM Payment
 GROUP BY pay_amount


 SELECT cus_id,cus_name,cus_pasword
 FROM Customer_detail
 ORDER by cus_name,cus_id DESC


 SELECT * FROM Order_detail
  ORDER  BY order_date

  
  SELECT Shop.shop_id,Shop.shop_name,Shop.shop_type,Shop.city,Seller.s_id,Seller.s_name,Seller.s_type
  FROM Shop
  INNER JOIN Seller
  ON Shop.shop_id=Seller.shop_id

  SELECT Buyer.buyer_id,Buyer.buyer_name,Buyer.login_type,Seller.s_id,Seller.s_name,Seller.city
  FROM Seller
  LEFT JOIN Buyer
  ON Seller.s_id=Buyer.s_id

  SELECT Payment.pay_id,Payment.pay_amount,Payment.pay_date,Payment.pay_type,Order_detail.order_id,Order_detail.order_type,
  Order_detail.order_type
  FROM Payment
  RIGHT JOIN Order_detail
  ON Payment.order_id=Order_detail.order_id
  
  SELECT Buyer.buyer_id,Buyer.buyer_name,Buyer.pro_id,Role.role_id,Role.role_name
  FROM Buyer
  FULL JOIN Role
  ON Buyer.role_id=Role.role_id

  CREATE TRIGGER Customer_Trigger ON Customer_detail
  INSTEAD OF INSERT
  AS
  BEGIN
  INSERT INTO Log_customer VALUES('Date inserted',GETDATE())
  END
  GO

  CREATE TRIGGER Buyer_Trigger ON Buyer
  AFTER UPDATE
  AS
  BEGIN
  INSERT INTO Log_Buyer(Buyer_id,Created_date)
  SELECT Buyer_id,GETDATE() FROM inserted
  END
  GO

  CREATE TRIGGER safty
  ON DATABASE
  FOR DROP_TABLE,ALTER_TABLE
  AS
  BEGIN
  PRINT 'You must disable trigger safty to drop or alter table'
  ROLLBACK;
  END
  Go

  CREATE VIEW Customer_veiw AS
  SELECT Customer_detail.cus_name,Customer_detail.cus_pasword,Order_detail.order_type
  FROM Customer_detail JOIN Order_detail ON Customer_detail.order_id=Order_detail.order_id
  WHERE  Customer_detail.cus_name='Mr. Prabath'


  CREATE VIEW Buyer_view AS
  SELECT Buyer.buyer_id,Buyer.login_type,Role.role_name
  FROM Buyer JOIN Role ON Buyer.role_id=Role.role_id
  WHERE  Buyer.login_type='children shoes'

  CREATE VIEW Seller_view AS
  SELECT Seller.s_name,Seller.city,Shop.shop_name,Shop.shop_type
  FROM Seller JOIN Shop ON Seller.shop_id=Shop.shop_id
  WHERE Seller.city='Alpitiya'


 CREATE PROCEDURE Select_all_payment @pay_type varchar(50)
 AS
 BEGIN
 SELECT * FROM Payment WHERE pay_type=@pay_type
 END
 EXEC Select_all_payment 'cash'

 CREATE PROCEDURE Select_all_seller @name varchar(250),@type varchar(50)
 AS
 BEGIN
 SELECT * FROM Seller WHERE s_name=@name AND s_type=@type
 END
 EXEC Select_all_seller 'Mr. L.K.Kulathunga','Agent'


CREATE PROCEDURE Select_all_product @type varchar(50)
 AS
 BEGIN
 SELECT * FROM Product WHERE pro_type=@type
 END
 EXEC Select_all_payment 'DSI'

 
Grant ALL ON Product TO Nimal

GRANT ALTER ON Buyer TO Smith

GRANT SELECT,INSERT,UPDATE,DELETE ON Payment TO Kasun

GRANT CREATE TABLE TO Sumith

GRANT SELECT ON Order_detail TO public






















