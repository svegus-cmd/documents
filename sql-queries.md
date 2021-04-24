The database scheme consists of four tables:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, screen, price)
Printer(code, model, color, type, price)
The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.

Exercise: 1. Find the model number, speed and hard drive capacity for all the PCs with prices below $500.
Result set: model, speed, hd.
```sql
select model, speed, hd 
from pc where price < 500;
```
Exercise: 2. List all printer makers. Result set: maker.
```sql
select Distinct Maker
from Product where type = 'Printer';
```
Exercise: 3. Find the model number, RAM and screen size of the laptops with prices over $1000.
```sql
select model, ram, screen
from Laptop Where Price > 1000;
```
Exercise: 4. Find all records from the Printer table containing data about color printers.
``` sql
select *
from Printer Where color = 'y';
```
Exercise: 5. Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.
``` sql
select model, speed, hd
from PC
where (cd = '12x' or cd = '24x') and price < 600;
```
Exercise: 6. For each maker producing laptops with a hard drive capacity of 10 Gb or higher, find the speed of such laptops. Result set: maker, speed.
```sql
select Distinct maker, speed
from Product
join Laptop on Product.model=Laptop.model
where hd >=10;
```
Exercise: 7. Find the makers producing PCs but not laptops.
```sql
select Distinct maker
from Product
where type = 'PC' and maker not in (Select maker From Product Where type = 'Laptop');
```
Exercise: 8. Find the makers of PCs with a processor speed of 450 MHz or more. Result set: maker.
```sql
select Distinct maker
from Product
join PC on Product.model=PC.model
where speed >= 450;
```
Exercise: 9. Get pairs of PC models with identical speeds and the same RAM capacity. Each resulting pair should be displayed only once, i.e. (i, j) but not (j, i). Result set: model with the bigger number, model with the smaller number, speed, and RAM.
```sql
select Distinct a.model, b.model, b.speed, b.ram
from PC a
join PC b on a.ram=b.ram and a.speed=b.speed and a.model > b.model;
```
Exercise: 10. For each value of PC speed that exceeds 600 MHz, find out the average price of PCs with identical speeds.
Result set: speed, average price.
```sql
select speed, Avg(price) as Avg_price
from PC
where speed > 600
group by speed;
```











