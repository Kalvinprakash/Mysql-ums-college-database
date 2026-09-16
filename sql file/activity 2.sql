# show  all the tables
show tables;
# insert into  student info;

INSERT into Student_Info
(Reg_Number, Student_Name, Branch, Contact_Number,
 Date_of_Birth, Date_of_Joining, Address, Email_ID)
VALUES
('MC101301','James','MCA','9714589787',
 '1984-01-12','2010-07-08','No 10, South Block, Nivea','james.mca@yahoo.com'),

('BEC111402','Manio','ECE','8912457875',
 '1983-02-23','2011-06-25','8/12, Park View, Sieera','manioma@gmail.com'),

('BEEI101204','Mike','EI','8974567897',
 '1983-02-10','2010-08-25','Cross villa, NY','mike.james@ymail.com'),

('MB111305','Paulson','MBA','8547986123',
 '1984-12-13','2010-08-08','Lake view, NJ','paul.son@rediffmail.com');
 
 #show the student info 
 DESCRIBE Student_Info;
 SHOW COLUMNS FROM Student_Info;
 SELECT * FROM Student_Info;
 
 # 
 
