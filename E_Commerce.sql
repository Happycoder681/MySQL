CREATE DATABASE Ecommerce_db;
USE Ecommerce_db;
CREATE TABLE Categories(
	CategoryID INT PRIMARY KEY AUTO_INCREMENT,
	CategoryName VARCHAR(255) NOT NULL
);

CREATE TABLE Products(
	ProductID INT PRIMARY KEY AUTO_INCREMENT,
	Name VARCHAR(255) NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	StockQuantity INT,
	CategoryID INT,
	FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails(
	DetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Reviews(
	ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    CustomerID INT,
    Rating DECIMAL(3,1),
    Comment TEXT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Shipping(
	ShippingID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ShipDate DATE,
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Discounts(
	DiscountID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    DiscountAmount INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Categories (CategoryID,CategoryName) VALUES
	(101,'Internal_Medicine'),
	(102,'Surgery'),
	(103,'Pediatrics'),
	(104,'Gynecology'),
	(105,'Psychiatry'),
	(106,'Emergency_Medicine');
    
INSERT INTO Products (ProductID,Name,Price,StockQuantity,CategoryID) VALUES
-- Internal Medicine (20 products)
	(1,'Aspirin',10.49,145,101),
    (2,'Metformin',15.79,210,101),
    (3,'Lisinopril',19,55,101),
    (4,'Simvastatin',51,320,101),
    (5,'Amoxicillin',25,120,101),
    (6,'Ibuprofen',65,451,101),
    (7,'Omeprazole',26,125,101),
    (8,'Hydrochlorothiazide',61,185,101),
    (9,'Gabapentin',20.55,226,101),
    (10,'Cetirizine',11,468,101),
    (11,'Levothyroxine',32,130,101),
    (12,'Metoprolol Succinate',14.89,180,101),
    (13,'Naproxen',21.59,140,101),
    (14,'Prednisone 10mg for Inflammation',22,153,101),
    (15,'Losartan Potassium',15.19,155,101),
    (16,'Furosemide',12.15,170,101),
    (17,'Clonazepam',18.99,160,101),
    (18,'Atenolol',14.25,126,101),
    (19,'Diazepam',36,125,101),
	(20,'Tramadol',32.89,315,101),
    
-- Surgery (10 products)
	(21,'Precision Surgical Scissors',38,70,102),
    (22,'Ergonomic Needle Holder',26,85,102),
    (23,'Hemostat Clamp for Blood Vessel',31,65,102),
    (24,'Curved Surgical Forceps',29,80,102),
    (25,'Scalpel Blades Sterile Pack',23,60,102),
    (26,'Heavy-Duty Surgical Drapes',47,45,102),
    (27,'Complete Suturing Kit',57,55,102),
    (28,'Surgical Face Masks Box of 50',16,95,102),
    (29,'Latex-Free Surgical Gloves',21,105,102),
    (30,'LED Surgical Light',1250,14,102),

-- Pediatrics (18 products)
	(31,'Children’s Liquid Ibuprofen',9.49,210,103),
    (32,'Gummy Multivitamins for Kids',16.22,190,103),
    (33,'Antihistamine Cough Syrup',11.29,175,103),
    (34,'Flavorful Cough Drops for Children',8.5,165,103),
    (35,'Chewable Baby Aspirin 81mg',10.49,165,103),
    (36,'Children’s Pain Relief Suspension',12.59,145,103),
    (37,'Fever Reducer Suspension',13.55,160,103),
    (38,'Probiotic Gummies for Kids',16.29,135,103),
    (39,'Antibiotic Suspension for Kids',21.66,125,103),
    (40,'Toddler’s Vitamin D Supplement Drops',14,150,103),
    (41,'Children’s Allergy Relief Tablets',12,145,103),
    (42,'Gentle Eczema Relief Cream for Babies',9,185,103),
    (43,'Infant Pain Relief Drops',11,175,103),
    (44,'Digestive Aid for Kids',55,155,103),
    (45,'Oral Rehydration Solution for Infants',25,210,103),
    (46,'Children’s Sleep Aid Liquid',23,150,103),
    (47,'Pediatric Probiotic Powder',66,130,103),
    (48,'Kids’ Cough Suppressant',32,380,103),

-- Gynecology (12 products)
	(49,'Bioidentical Hormone Replacement Therapy',48,55,104),
    (50,'Monthly Birth Control Pills Pack',37,65,104),
    (51,'Early Pregnancy Test Kit',13,85,104),
    (52,'Menstrual Cramp Relief Tablets',12,75,104),
    (53,'Lubricating Vaginal Moisturizer',19,60,104),
    (54,'Contraceptive Vaginal Gel',15,70,104),
    (55,'Ovulation Test Kit for Women',21,45,104),
    (56,'Endometriosis Pain Relief Capsules',26,55,104),
    (57,'Prenatal Vitamins with DHA',32,80,104),
    (58,'Postpartum Recovery Support Capsules',23,50,104),
    (59,'Menopause Relief Supplements',29,65,104),
    (60,'Fertility Support Vitamins',42,55,104),

-- Psychiatry (10 products)
	(61,'Antidepressant Tablets',25,120,105),
    (62,'Anxiolytic Medication',22,140,105),
    (63,'Mood Stabilizers',27,110,105),
    (64,'Sleep Aid Tablets',18,150,105),
    (65,'Anti-Psychotic Medication',30,100,105),
    (66,'Cognitive Behavioral Therapy Workbook',15,80,105),
    (67,'Therapy App Subscription Folder',40,70,105),
    (68,'ADHD Medication',28,130,105),
    (69,'Bipolar Disorder Medication',32,90,105),
    (70,'Stress Relief Supplements',12,160,105),
    
-- Emergency Medicine (15 products)
	(71,'Epinephrine Auto-Injector',60,40,106),
    (72,'First Aid Kit',45,55,106),
    (73,'Burn Treatment Cream',25,70,106),
    (74,'CPR Mask',18,60,106),
    (75,'Antiseptic Wipes',12,80,106),
    (76,'Trauma Dressing',22,65,106),
    (77,'Sterile Gauze Pads',10,85,106),
    (78,'Adrenaline Injection Kit',70,35,106),
    (79,'Emergency Blanket',14,90,106),
    (80,'Splint Kit',40,50,106),
    (81,'Defibrillator Unit',1500,20,106),
    (82,'Suture Kit',55,45,106),
    (83,'Portable Oxygen Tank',250,15,106),
    (84,'Tourniquet',20,70,106),
    (85,'Instant Cold Pack',8,100,106)
;

INSERT INTO Customers(CustomerID,Name,Email) VALUES
    (501, 'Rajesh Khanna', 'rajesh.khanna@gmail.com'),
    (502, 'Amit Sharma', 'amit.sharma@yahoo.com'),
    (503, 'Neha Gupta', 'neha.gupta@gmail.com'),
    (504, 'Priya Singh', 'priya.singh@hotmail.com'),
    (505, 'Ravi Kumar', 'ravi.kumar@gmail.com'),
    (506, 'Sonia Patel', 'sonia.patel@ymail.com'),
    (507, 'Vikram Mehta', 'vikram.mehta@gmail.com'),
    (508, 'Kavita Desai', 'kavita.desai@gmail.com'),
    (509, 'Anil Verma', 'anil.verma@rediffmail.com'),
    (510, 'Pooja Rao', 'pooja.rao@gmail.com')
;

INSERT INTO Customers(CustomerID,Name,Email) VALUES
	(511,'Arun Bajaj','arun.bajaj@gmail.com'),
    (512,'Virendra Sehwag','virendra.sehwag@ymail.com'),
    (513,'Neela Singh','neela.singh@gmail.com'),
    (514,'Dhiru Kumar','dhiru.kumar@gmail.com'),
    (515,'Anjali Mehta','anjali.mehta@hotmail.com'),
	(516,'Rohit Sharma','rohit.sharma@yahoo.com'),
	(517,'Suman Ghosh','suman.ghosh@gmail.com'),
	(518,'Preeti Desai','preeti.desai@ymail.com'),
	(519,'Akash Verma','akash.verma@gmail.com'),
	(520,'Swati Kapoor','swati.kapoor@hotmail.com'),
	(521,'Ravi Reddy','ravi.reddy@yahoo.com'),
	(522,'Mona Arora','mona.arora@gmail.com'),
	(523,'Amit Bansal','amit.bansal@ymail.com'),
	(524,'Deepika Singh','deepika.singh@hotmail.com'),
	(525,'Rahul Jain','rahul.jain@gmail.com'),
	(526,'Kavita Bhatt','kavita.bhatt@yahoo.com'),
	(527,'Gaurav Gupta','gaurav.gupta@gmail.com'),
	(528,'Priya Menon','priya.menon@ymail.com'),
	(529,'Suresh Kumar','suresh.kumar@hotmail.com'),
	(530,'Anita Rao','anita.rao@gmail.com'),
	(531,'Vikram Sethi','vikram.sethi@yahoo.com'),
	(532,'Sneha Patel','sneha.patel@ymail.com'),
	(533,'Vivek Sharma','vivek.sharma@gmail.com'),
	(534,'Manisha Joshi','manisha.joshi@hotmail.com'),
	(535,'Nikhil Chawla','nikhil.chawla@yahoo.com'),
	(536,'Meena Gupta','meena.gupta@gmail.com'),
	(537,'Karan Thakur','karan.thakur@ymail.com'),
	(538,'Sonal Kapoor','sonal.kapoor@hotmail.com'),
	(539,'Arjun Nair','arjun.nair@gmail.com'),
	(540,'Rekha Mehta','rekha.mehta@yahoo.com'),
	(541,'Sameer Iyer','sameer.iyer@ymail.com'),
	(542,'Ankita Shah','ankita.shah@gmail.com'),
	(543,'Rakesh Yadav','rakesh.yadav@hotmail.com'),
	(544,'Pooja Agarwal','pooja.agarwal@yahoo.com'),
	(545,'Rohan Das','rohan.das@gmail.com'),
	(546,'Neha Kapoor','neha.kapoor@ymail.com'),
	(547,'Abhishek Singh','abhishek.singh@hotmail.com'),
	(548,'Simran Kaur','simran.kaur@gmail.com'),
	(549,'Ajay Khanna','ajay.khanna@yahoo.com'),
	(550,'Shweta Desai','shweta.desai@ymail.com'),
	(551,'Pranav Mishra','pranav.mishra@gmail.com'),
	(552,'Alka Gupta','alka.gupta@hotmail.com'),
	(553,'Rajiv Ranjan','rajiv.ranjan@yahoo.com'),
	(554,'Shruti Sharma','shruti.sharma@gmail.com'),
	(555,'Harish Nair','harish.nair@ymail.com'),
	(556,'Ritu Verma','ritu.verma@hotmail.com'),
	(557,'Siddharth Malhotra','siddharth.malhotra@yahoo.com'),
	(558,'Nisha Patel','nisha.patel@gmail.com'),
	(559,'Rahul Bhatt','rahul.bhatt@ymail.com'),
	(560,'Poonam Kapoor','poonam.kapoor@hotmail.com'),
	(561,'Vikas Chawla','vikas.chawla@yahoo.com'),
	(562,'Meghna Sharma','meghna.sharma@gmail.com'),
	(563,'Amit Desai','amit.desai@ymail.com'),
	(564,'Sweta Joshi','sweta.joshi@hotmail.com'),
	(565,'Ajit Sinha','ajit.sinha@yahoo.com'),
	(566,'Radhika Rao','radhika.rao@gmail.com'),
	(567,'Arvind Sharma','arvind.sharma@ymail.com'),
	(568,'Pallavi Gupta','pallavi.gupta@hotmail.com'),
	(569,'Ranjan Kumar','ranjan.kumar@yahoo.com'),
	(570,'Tina Mehta','tina.mehta@gmail.com')
;


INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
	(201, 508, '2022-05-05'),
	(202, 503, '2022-09-05'),
	(203, 504, '2022-04-25'),
	(204, 510, '2022-01-25'),
	(205, 504, '2022-08-30'),
	(206, 507, '2022-10-10'),
	(207, 502, '2022-06-25'),
	(208, 509, '2022-07-12'),
	(209, 506, '2022-07-15'),
	(210, 508, '2022-08-21'),
	(211, 504, '2022-11-20'),
	(212, 507, '2023-01-28'),
	(213, 504, '2023-03-12'),
	(214, 505, '2022-04-25'),
	(215, 505, '2023-05-18'),
	(216, 505, '2023-11-30'),
	(217, 506, '2023-06-22'),
	(218, 508, '2023-04-14'),
	(219, 507, '2023-09-17'),
	(220, 501, '2022-02-18')
;

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
	(221, 525, '2022-01-15'),
	(222, 511, '2022-02-18'),
	(223, 533, '2022-03-21'),
	(224, 518, '2022-04-25'),
	(225, 514, '2022-05-30'),
	(226, 523, '2022-06-02'),
	(227, 516, '2022-07-06'),
	(228, 530, '2022-08-10'),
	(229, 512, '2022-09-14'),
	(230, 528, '2022-10-18'),
	(231, 520, '2022-11-22'),
	(232, 522, '2022-12-26'),
	(233, 535, '2022-01-29'),
	(234, 529, '2022-02-03'),
	(235, 517, '2022-03-07'),
	(236, 536, '2022-04-11'),
	(237, 515, '2022-05-15'),
	(238, 527, '2022-06-19'),
	(239, 519, '2022-07-23'),
	(240, 526, '2022-08-27'),
	(241, 532, '2022-09-30'),
	(242, 531, '2022-10-04'),
	(243, 537, '2022-11-08'),
	(244, 521, '2022-12-12'),
	(245, 540, '2023-01-16'),
	(246, 524, '2023-02-20'),
	(247, 534, '2023-03-24'),
	(248, 539, '2023-04-28'),
	(249, 541, '2023-05-02'),
	(250, 538, '2023-06-06'),
	(251, 543, '2023-07-10'),
	(252, 544, '2023-08-14'),
	(253, 546, '2023-09-18'),
	(254, 542, '2023-10-22'),
	(255, 545, '2023-11-26'),
	(256, 547, '2023-12-30'),
	(257, 548, '2022-01-05'),
	(258, 549, '2022-02-09'),
	(259, 550, '2022-03-13'),
	(260, 551, '2022-04-17'),
	(261, 552, '2022-05-21'),
	(262, 553, '2022-06-25'),
	(263, 554, '2022-07-29'),
	(264, 555, '2022-08-02'),
	(265, 556, '2022-09-06'),
	(266, 557, '2022-10-10'),
	(267, 558, '2022-11-14'),
	(268, 559, '2022-12-18'),
	(269, 560, '2023-01-22'),
	(270, 561, '2023-02-26'),
	(271, 562, '2023-03-02'),
	(272, 563, '2023-04-06'),
	(273, 564, '2023-05-10'),
	(274, 565, '2023-06-14'),
	(275, 566, '2023-07-18'),
	(276, 567, '2023-08-22'),
	(277, 568, '2023-09-26'),
	(278, 569, '2023-10-30'),
	(279, 570, '2023-11-03'),
	(280, 513, '2023-12-07');





INSERT INTO OrderDetails (DetailID, OrderID, ProductID, Quantity) VALUES
	(301,201,5,10),
    (302,201,20,25),
    (303,202,77,30),
    (304,202,36,10),
    (305,202,5,5),
    (306,202,51,10),
    (307,203,11,15),
    (308,203,32,25),
    (309,204,72,5),
    (310,204,54,1),
    (311,204,39,2),
    (312,205,41,5),
    (313,206,23,10),
    (314,206,25,1),
    (315,207,19,2),
    (316,207,15,6),
    (317,207,7,4),
    (318,207,13,8),
    (319,207,62,12),
    (320,208,57,2),
    (321,208,33,5),
    (322,208,42,8),
    (323,209,65,5),
    (324,210,29,10),
    (325,211,36,5),
    (326,211,12,12),
    (327,211,10,5),
    (328,212,9,5),
    (329,213,38,12),
    (330,214,40,25),
    (331,214,81,5),
    (332,215,74,6),
    (333,216,69,8),
    (334,216,12,10),
    (335,217,14,10),
    (336,217,55,25),
    (337,217,66,7),
    (338,218,1,50),
    (339,219,4,30),
    (340,220,80,15)
;

INSERT INTO OrderDetails (DetailID, OrderID, ProductID, Quantity) VALUES
	(341,221,15,20),
    (342,221,22,5),
    (343,222,63,8),
    (344,223,41,15),
    (345,223,72,10),
    (346,224,35,7),
    (347,224,47,3),
    (348,225,50,12),
    (349,225,24,6),
    (350,226,37,9),
    (351,227,73,8),
    (352,227,2,5),
    (353,228,34,10),
    (354,228,76,4),
    (355,229,30,7),
    (356,229,14,15),
    (357,230,68,20),
    (358,230,49,10),
    (359,231,61,30),
    (360,231,52,5),
    (361,232,28,12),
    (362,232,3,8),
    (363,233,53,15),
    (364,233,44,20),
    (365,234,26,5),
    (366,234,18,10),
    (367,235,56,8),
    (368,235,71,12),
    (369,236,59,25),
    (370,236,21,5),
    (371,237,67,15),
    (372,237,6,10),
    (373,238,78,6),
    (374,238,48,8),
    (375,239,16,3),
    (376,239,31,20),
    (377,240,79,7),
    (378,240,45,9),
    (379,241,27,12),
    (380,241,64,10),
    (381,242,60,6),
    (382,242,8,5),
    (383,243,58,30),
    (384,243,70,8),
    (385,244,43,10),
    (386,244,17,15),
    (387,245,75,7),
    (388,245,46,5),
    (389,246,53,12),
    (390,246,19,10)
;


INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, Comment) VALUES
	(401,80,501,7.5,"It's a great product. Helped me a Lot"),
    (402,15,502,2.5,"It's pathetic and useless"),
    (403,19,502,8.5,"It's a great product to recommend"),
    (404,5,503,5.5,"Ok Ok, not largely effective"),
    (405,10,504,7,"It's very useful in my cold"),
    (406,36,504,8,"My child was cured with this, thanks"),
    (407,12,505,5,"I had a severe heart attack. So thankful for this tablet"),
    (408,55,506,9,"Want to share this to the world, it's magical"),
    (409,4,507,6,"Good for High Blood Pressure and Cholesterol"),
    (410,9,507,1,"Let me tell you to not use this, has severe side effects")
;

INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, Comment) VALUES
	(411,30,508,8,"Effective and easy to use"),
    (412,22,509,4,"Not what I expected, quite disappointed"),
    (413,40,510,9.5,"Amazing! Can't believe how well this works"),
    (414,77,511,6.5,"Good but could be better"),
    (415,13,512,3,"Didn't work for me at all"),
    (416,2,513,7,"Decent, worth trying"),
    (417,68,514,8.5,"I'm happy with the results"),
    (418,51,515,9,"Outstanding, highly recommend it"),
    (419,73,516,5,"It's just okay, nothing special"),
    (420,25,517,7.5,"Does the job, no complaints"),
    (421,65,518,6,"It worked but had some side effects"),
    (422,38,519,10,"Perfect, life-changing product!"),
    (423,42,520,7.5,"Useful and affordable"),
    (424,7,521,2,"Very disappointing, didn't help at all"),
    (425,81,522,9.5,"Exceeded my expectations, highly recommend"),
    (426,60,523,8,"Works well, worth the price"),
    (427,16,524,6.5,"It's alright, but not the best"),
    (428,29,525,5.5,"Mediocre, could be better"),
    (429,71,526,4,"I wouldn't recommend this product"),
    (430,76,527,8,"Pretty effective, I'm satisfied"),
    (431,11,528,7.5,"Good quality, worth buying"),
    (432,17,529,3.5,"Not effective for my condition"),
    (433,33,530,9,"Superb product, very happy with it"),
    (434,53,531,6,"It's fine, but there are better options"),
    (435,66,532,8.5,"Works well, would buy again"),
    (436,20,533,7,"Good value for money"),
    (437,78,534,9.5,"Fantastic, highly recommended"),
    (438,14,535,4.5,"Below average, not worth it"),
    (439,62,536,10,"Best product I've ever used"),
    (440,48,537,7,"Does what it says, satisfied"),
    (441,1,538,6,"It's okay, but I've had better"),
    (442,28,539,9,"Very effective, no side effects"),
    (443,34,540,8,"Happy with the results, would recommend"),
    (444,74,541,7.5,"Good product, met my expectations"),
    (445,21,542,5,"Not great, but not terrible either"),
    (446,32,543,9.5,"Exceeded all my expectations"),
    (447,18,544,6.5,"Decent, but could use improvement"),
    (448,50,545,4,"Didn't work as advertised"),
    (449,64,546,7,"It's okay, nothing special"),
    (450,56,547,8.5,"Very effective, I'm impressed"),
    (451,26,548,7.5,"Does the job, I'm content"),
    (452,35,549,3,"Not satisfied, would not buy again"),
    (453,39,550,9,"Excellent product, highly recommend"),
    (454,31,551,8,"Works as expected, no complaints"),
    (455,44,552,6.5,"It's decent, but not the best out there"),
    (456,79,553,9,"Very pleased with this product"),
    (457,67,554,4.5,"Not worth the price"),
    (458,58,555,8,"Good product, would recommend"),
    (459,24,556,7,"Satisfactory, does the job"),
    (460,47,557,5.5,"It's okay, but could be better")
;


INSERT INTO Shipping (ShippingID, OrderID, ShipDate, DeliveryDate) VALUES
	(601,201,'2022-05-05','2022-05-06'),
    (602,202,'2022-09-05','2022-09-07'),
    (603,203,'2022-04-25','2022-04-26'),
    (604,204,'2022-01-25','2022-01-27'),
    (605,205,'2022-08-30','2022-08-30'),
    (606,206,'2022-10-10','2022-10-12'),
    (607,207,'2022-06-25','2022-06-29'),
    (608,208,'2022-07-12','2022-07-12'),
    (609,209,'2022-07-15','2022-07-17'),
    (610,210,'2022-08-21','2022-08-21'),
    (611,211,'2022-11-20','2022-11-22'),
    (612,212,'2023-01-28','2023-01-28'),
    (613,213,'2023-03-12','2023-03-15'),
    (614,214,'2022-04-25','2022-04-29'),
    (615,215,'2023-05-18','2023-05-18'),
    (616,216,'2023-11-30','2023-11-30'),
    (617,217,'2023-06-22','2023-06-25'),
    (618,218,'2023-04-14','2023-04-14'),
    (619,219,'2023-09-17','2023-09-18'),
    (620,220,'2022-02-18','2022-02-20')
;


INSERT INTO Shipping (ShippingID, OrderID, ShipDate, DeliveryDate) VALUES
    (621,221,'2022-03-15','2022-03-17'),
    (622,222,'2023-04-21','2023-04-23'),
    (623,223,'2022-05-14','2022-05-15'),
    (624,224,'2023-02-19','2023-02-20'),
    (625,225,'2022-07-11','2022-07-12'),
    (626,226,'2023-06-15','2023-06-16'),
    (627,227,'2023-08-10','2023-08-12'),
    (628,228,'2022-09-01','2022-09-02'),
    (629,229,'2022-10-05','2022-10-06'),
    (630,230,'2023-11-12','2023-11-13'),
    (631,231,'2022-01-19','2022-01-20'),
    (632,232,'2023-03-22','2023-03-23'),
    (633,233,'2022-02-18','2022-02-19'),
    (634,234,'2023-12-01','2023-12-02'),
    (635,235,'2022-04-14','2022-04-15'),
    (636,236,'2022-06-08','2022-06-09'),
    (637,237,'2022-07-30','2022-08-01'),
    (638,238,'2022-08-22','2022-08-23'),
    (639,239,'2022-09-14','2022-09-16'),
    (640,240,'2022-11-05','2022-11-06'),
    (641,241,'2023-01-09','2023-01-10'),
    (642,242,'2022-02-11','2022-02-12'),
    (643,243,'2023-03-15','2023-03-16'),
    (644,244,'2023-04-26','2023-04-27'),
    (645,245,'2022-05-08','2022-05-09'),
    (646,246,'2023-06-17','2023-06-18'),
    (647,247,'2022-07-12','2022-07-13'),
    (648,248,'2023-08-03','2023-08-04'),
    (649,249,'2022-09-20','2022-09-21'),
    (650,250,'2022-10-14','2022-10-15'),
    (651,251,'2023-11-21','2023-11-22'),
    (652,252,'2023-12-09','2023-12-10'),
    (653,253,'2022-01-22','2022-01-23'),
    (654,254,'2022-02-28','2022-03-01'),
    (655,255,'2023-04-14','2023-04-15'),
    (656,256,'2022-05-19','2022-05-20'),
    (657,257,'2022-06-25','2022-06-26'),
    (658,258,'2023-07-16','2023-07-17'),
    (659,259,'2022-08-30','2022-08-31'),
    (660,260,'2023-09-23','2023-09-24'),
    (661,261,'2022-10-27','2022-10-28'),
    (662,262,'2023-11-30','2023-12-01'),
    (663,263,'2023-12-20','2023-12-21'),
    (664,264,'2023-01-05','2023-01-06'),
    (665,265,'2022-02-15','2022-02-16'),
    (666,266,'2022-03-22','2022-03-23'),
    (667,267,'2023-04-27','2023-04-28'),
    (668,268,'2022-05-30','2022-05-31'),
    (669,269,'2023-06-18','2023-06-19'),
    (670,270,'2022-07-24','2022-07-25'),
    (671,271,'2022-08-27','2022-08-28'),
    (672,272,'2023-09-14','2023-09-15'),
    (673,273,'2022-10-31','2022-11-01'),
    (674,274,'2023-11-13','2023-11-14'),
    (675,275,'2022-12-02','2022-12-03'),
    (676,276,'2023-01-11','2023-01-12'),
    (677,277,'2022-02-18','2022-02-19'),
    (678,278,'2023-03-15','2023-03-16'),
    (679,279,'2023-04-12','2023-04-13'),
    (680,280,'2022-05-08','2022-05-09')
;


INSERT INTO Discounts (DiscountID, ProductID, DiscountAmount) VALUES
	(701,25,10),
    (702,1,30),
    (703,29,50),
    (704,72,40),
    (705,5,15),
    (706,54,10),
    (707,79,45),
    (708,57,20),
    (709,20,35),
    (710,32,100)
;

INSERT INTO Discounts (DiscountID, ProductID, DiscountAmount) VALUES
    (711,11,25),
    (712,9,20),
    (713,36,60),
    (714,43,15),
    (715,18,50),
    (716,62,40),
    (717,37,30),
    (718,52,70),
    (719,15,25),
    (720,28,55),
    (721,41,20),
    (722,12,45),
    (723,67,10),
    (724,58,25),
    (725,48,35),
    (726,22,50),
    (727,63,15),
    (728,39,60),
    (729,21,30),
    (730,30,40),
    (731,46,25),
    (732,68,75),
    (733,53,10),
    (734,14,50),
    (735,8,15),
    (736,66,45),
    (737,42,30),
    (738,74,20),
    (739,56,35),
    (740,31,60),
    (741,49,25),
    (742,23,45),
    (743,64,10),
    (744,17,20),
    (745,65,35),
    (746,26,50),
    (747,50,60),
    (748,70,15),
    (749,35,25),
    (750,75,40),
    (751,51,30)
;
-- We have created our database; now we will make our queries.

-- Q1) List all products along with their categories
SELECT Products.Name AS ProductName, Categories.CategoryName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID;

-- Q2) List the names of the products for which orders have been received.
SELECT DISTINCT Products.Name AS ProductName
FROM Products
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID;

-- Q3) List the names of the products for which orders have not been received.
SELECT Products.Name AS ProductName
FROM Products
LEFT JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
WHERE OrderDetails.ProductID IS NULL;

-- Q4) From the categories table, which categories have witnessed the maximum sales? Please show them in descending order.
SELECT Categories.CategoryName, SUM(OrderDetails.Quantity*Products.Price) AS TotalSales
FROM Categories
JOIN Products ON Products.CategoryID = Categories.CategoryID
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
GROUP BY Categories.CategoryName
ORDER BY TotalSales DESC;

-- Q5) In terms of quantity, how many orders has each category received?
SELECT Categories.CategoryName, SUM(OrderDetails.Quantity) AS QtySold
FROM Categories
JOIN Products ON Products.CategoryID = Categories.CategoryID
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
GROUP BY Categories.CategoryName
ORDER BY QtySold DESC;

-- Q6) Now that the orders have been sold, find out the remaining stock of each product and its value.
SELECT p.Name AS ProductName,
	   p.StockQuantity - COALESCE(SUM(od.Quantity),0) AS RemainingStock,
       (p.StockQuantity - COALESCE(SUM(od.Quantity),0))*p.Price AS RemainingStockValue
FROM Products p
LEFT JOIN OrderDetails od ON od.ProductID = p.ProductID
GROUP BY p.Name, p.StockQuantity, od.Quantity, p.price
ORDER BY RemainingStockValue DESC;

-- Q7) Find the details of orders placed by 'Priya Singh' including product names and quantities.
SELECT Orders.OrderID, Products.Name AS ProductName, OrderDetails.Quantity
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
WHERE Customers.Name = 'Priya Singh';

-- Q8) Get all reviews along with product names and customer names.
SELECT Customers.Name AS CustomerName, Products.Name AS ProductName, Reviews.Rating, Reviews.Comment
FROM Reviews
JOIN Customers ON Customers.CustomerID = Reviews.CustomerID
JOIN Products ON Products.ProductID = Reviews.ProductID;

-- Q9) List all customers who have placed orders along with the order dates and shipping dates.
SELECT Customers.Name, Orders.OrderDate, Shipping.ShipDate
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN Shipping ON Shipping.OrderID = Orders.OrderID;

-- Q10) Find the total quantity of each product ordered.
SELECT Products.Name AS ProductName, SUM(OrderDetails.Quantity) AS TotalQuantity
FROM Products
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.Name;

-- Q11) Get all orders and their respective discount amounts if they have discounts.
SELECT Orders.OrderID, Discounts.DiscountAmount
FROM Orders
LEFT JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
LEFT JOIN Discounts ON Discounts.ProductID = OrderDetails.ProductID;

-- Q12) What is the total discount amount applied to each order?
SELECT DISTINCT Orders.OrderID, COALESCE(SUM(Discounts.DiscountAmount),0) AS TotalDiscountAmount
FROM Orders
LEFT JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
LEFT JOIN Discounts ON OrderDetails.ProductID = Discounts.ProductID
GROUP BY Orders.OrderID;

-- Q13) List all orders with products and their respective shipping dates.
SELECT OrderDetails.OrderID, Products.Name AS ProductName, Shipping.ShipDate
FROM Products
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
JOIN Shipping ON Shipping.OrderID = OrderDetails.OrderID;

-- Q14) Find customers who have not placed any orders.
SELECT Customers.Name
FROM Customers
LEFT JOIN Orders ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderID IS NULL;

-- Q15) Get products with their discounts if available.
SELECT Products.Name AS PRODUCT_NAME, COALESCE(Discounts.DiscountAmount,"No Discount") AS DiscountAmount
FROM Products
LEFT JOIN Discounts ON Discounts.ProductID = Products.ProductID;

-- Q16) List all products that have been reviewed along with their review details.
SELECT Products.Name AS ProductName, Reviews.Rating, Reviews.Comment
FROM Products
JOIN Reviews ON Reviews.ProductID = Products.ProductID;

-- Q17) List products that have never been reviewed.
SELECT Products.ProductID, Products.Name, Reviews.Comment
FROM Products 
LEFT JOIN Reviews ON Reviews.ProductID = Products.ProductID
WHERE Reviews.ProductID IS NULL;

-- Q18) Find customers who have ordered products in the "Pediatrics" category.
SELECT DISTINCT Customers.Name AS CustomerName, Categories.CategoryName
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Categories.CategoryName = "Pediatrics";

-- Q19) List all customers who have reviewed a product they purchased.
SELECT DISTINCT Customers.Name AS CustomerName
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Reviews ON Reviews.ProductID = OrderDetails.ProductID
WHERE OrderDetails.ProductID = Reviews.ProductID;

-- Q20) Find the top 5 most expensive products and their categories.
SELECT Products.Name AS ProductName, Products.Price, Categories.CategoryName
FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
ORDER BY Products.Price DESC
LIMIT 5;

-- Q21) List all orders where the total price exceeds Rs 500.
SELECT Orders.OrderID, SUM(Products.Price*OrderDetails.Quantity) AS Total_Price
FROM Orders
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY Orders.OrderID
HAVING Total_Price > 500;

-- Q22) Find products in the "Gynecology" category with an average rating above 7.
SELECT Products.Name AS ProductName, AVG(Reviews.Rating) AS AverageRating
FROM Products
JOIN Reviews ON Reviews.ProductID = Products.ProductID
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Categories.CategoryName = "Gynecology"
GROUP BY Products.Name
HAVING AverageRating > 7;

-- Q23) List customers who have placed more than 3 orders.
SELECT Customers.Name, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.Name
HAVING OrderCount > 3;

-- Q24) Find all orders that include products with a discount.
SELECT DISTINCT Orders.OrderID
FROM Orders
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Discounts ON Discounts.ProductID = OrderDetails.ProductID

-- Q25) List products with a price higher than the average price of all products.
SELECT Name, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

-- Q26) Find the total number of products in each category.
SELECT Categories.CategoryName, COUNT(Products.Name) AS ProductCount
FROM Categories
JOIN Products ON Products.CategoryID = Categories.CategoryID
GROUP BY CategoryName;

-- Q27) Find customers who have made purchases in multiple categories.
SELECT Customers.Name AS CustomerName, COUNT(DISTINCT Products.CategoryID) AS CategoriesCount
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY Customers.Name
HAVING CategoriesCount > 1;

-- Q28) List the total sales value of each customer.
SELECT Customers.Name AS CustomerName, SUM(OrderDetails.Quantity * Products.Price) AS TotalSales
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY CustomerName
ORDER BY TotalSales DESC;

-- Q29) Find the product that has been ordered the most by quantity.
SELECT Products.Name AS ProductName, SUM(OrderDetails.Quantity) AS TotalQuantity
FROM Products
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
GROUP BY ProductName
ORDER BY TotalQuantity DESC
LIMIT 1;

-- Q30) Identify customers who have purchased a product that they later reviewed poorly (rating < 5).
SELECT DISTINCT Customers.Name AS CustomerName, Products.Name AS ProductName, Reviews.Rating
FROM Customers
JOIN Reviews ON Reviews.CustomerID = Customers.CustomerID
JOIN Products ON Products.ProductID = Reviews.ProductID
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
WHERE Reviews.Rating < 5;

-- Q31) List the orders that have the highest total discount applied.
SELECT Orders.OrderID, SUM(Discounts.DiscountAmount) AS Total_Discount
FROM Orders
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Discounts ON Discounts.ProductID = OrderDetails.ProductID
GROUP BY Orders.OrderID
ORDER BY Total_Discount DESC;

-- Q32) Find customers who have only placed one order.
SELECT Customers.Name AS Customer_Name, COUNT(Orders.OrderID) AS Order_Count
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customer_Name
HAVING Order_Count = 1;

-- Q33) Get the average price of products in each category.
SELECT Categories.CategoryName, AVG(Products.Price) AS Avg_Product_Price
FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName;

-- Q34) List the products that have been ordered but never reviewed.
SELECT Products.Name AS ProductName, Reviews.Comment
FROM Products
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
LEFT JOIN Reviews ON Reviews.ProductID = OrderDetails.ProductID
WHERE Reviews.ProductID IS NULL;

-- Q35) List all products with their categories that have a price higher than the average price in their category.
SELECT Products.Name AS ProductName, Products.Price, Categories.CategoryName
FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE Products.Price > (
	SELECT AVG(Price)
    FROM Products
    WHERE CategoryID = Products.CategoryID
);

-- Q36) Find the customer who has spent the most money in total.
SELECT Customers.Name AS CustomerName, SUM(OrderDetails.Quantity*Products.Price) AS Amount_Spent
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY CustomerName
ORDER BY Amount_Spent DESC
LIMIT 1;

-- Q37) Find all products with a rating below the average rating across all products.
SELECT Products.ProductID, Products.Name AS ProductName, Reviews.Rating
FROM Products
JOIN Reviews ON Reviews.ProductID = Products.ProductID
WHERE Reviews.Rating < (
						SELECT AVG(Reviews.Rating) 
                        FROM Reviews
                        );

-- Q38) Get the total number of orders each customer has placed in each year.
SELECT Customers.CustomerID, Customers.Name, COUNT(Orders.OrderID) AS OrderCount, YEAR(Orders.OrderDate) AS OrderYear
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, OrderYear
ORDER BY Customers.CustomerID;

-- Q39) Find the category with the lowest average product price
SELECT Categories.CategoryID, Categories.CategoryName, AVG(Products.Price) AS Avg_Price
FROM Categories
JOIN Products ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryID
ORDER BY Avg_Price ASC
LIMIT 1;

-- Q40) List all products that have not been ordered in the year 2022.
SELECT Products.Name AS ProductName, Orders.OrderDate
FROM Products
LEFT JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
LEFT JOIN Orders ON Orders.OrderID = OrderDetails.OrderID
WHERE Orders.OrderDate IS NULL
OR YEAR(Orders.OrderDate) <> 2022;

-- Q41) Identify the products that have the most reviews.
SELECT Products.ProductID, Products.Name AS ProductName, COUNT(Reviews.ReviewID) AS ReviewCount
FROM Products
JOIN Reviews ON Reviews.ProductID = Products.ProductID
GROUP BY Products.ProductID
ORDER BY ReviewCount DESC;

-- Q42) List customers along with the number of products they have reviewed.
SELECT Customers.CustomerID, 
	   Customers.Name,
       (
       SELECT COUNT(*)
       FROM Reviews
       WHERE Reviews.CustomerID = Customers.CustomerID
       ) AS ReviewCount
FROM 
Customers;

-- Q43) Get the details of the most expensive product in each category.
SELECT p.ProductID, p.Name AS ProductName, p.Price, p.StockQuantity, p.CategoryID
FROM Products p
WHERE p.Price = (
				 SELECT MAX(p2.Price) 
                 FROM Products p2 
                 WHERE p2.CategoryID = p.CategoryID
                 );

-- Q44) List the top 5 customers who have placed the most orders.
SELECT Customers.Name, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.Name
ORDER BY OrderCount DESC
LIMIT 5;

-- Q45) Find the most recent order date for each customer.
SELECT Customers.Name AS CustomerName, MAX(Orders.OrderDate) AS MostRecent_OrderDate
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY CustomerName;

-- Q46) List products that have been ordered more than 10 times and have a price greater than Rs 50.
SELECT Products.Name AS Prod_Name, SUM(OrderDetails.Quantity) AS Total_Qty, Products.Price
FROM Products
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.Name, Products.Price
HAVING Total_Qty > 10 AND Price > 50;

-- Q47) List products that have a discount applied and are priced above Rs 30.
SELECT Products.Name, Products.Price, Discounts.DiscountAmount
FROM Products
JOIN Discounts ON Discounts.ProductID = Products.ProductID
WHERE Products.Price > 30;

-- Q48) Find customers who have placed orders across multiple years.
SELECT Orders.CustomerID, Customers.Name
FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
GROUP BY Orders.CustomerID
HAVING COUNT(DISTINCT YEAR(OrderDate)) > 1;

-- Q49) Find orders that were shipped on the same day they were placed.
SELECT Orders.OrderID, Orders.OrderDate, Shipping.ShipDate
FROM Orders
JOIN Shipping ON Shipping.OrderID = Orders.OrderID
WHERE Shipping.ShipDate = Orders.OrderDate;

-- Q50) List customers who have made purchases in more than one category.
SELECT Customers.Name AS CustomerName, COUNT(DISTINCT Products.CategoryID) AS CategoryCount
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY CustomerName
HAVING CategoryCount > 1;

-- Q51) List all products along with the total amount spent on them
SELECT Products.Name AS Product_Name, SUM(OrderDetails.Quantity*Products.Price) AS Amt_Spent
FROM Products
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.Name;

/* Q52) Classify customers based on the total amount they have spent into three categories: 
		'Low Spender', 'Medium Spender', and 'High Spender'.*/
SELECT Customers.Name AS Person_Name, SUM(OrderDetails.Quantity*Products.Price) AS Money_Spent,
	CASE 
    WHEN SUM(OrderDetails.Quantity*Products.Price) > 2000 THEN "High_Spender"
    WHEN SUM(OrderDetails.Quantity*Products.Price) BETWEEN 500 AND 2000 THEN "Medium_Spender"
	ELSE "Low_Spender"
    END AS Spending_Category
FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY Customers.Name;


