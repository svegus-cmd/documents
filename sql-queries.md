Схема БД состоит из четырех таблиц:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, price, screen)
Printer(code, model, color, type, price)
Таблица Product представляет производителя (maker), номер модели (model) и тип ('PC' - ПК, 'Laptop' - ПК-блокнот или 'Printer' - принтер). 
Предполагается, что номера моделей в таблице Product уникальны для всех производителей и типов продуктов. 
В таблице PC для каждого ПК, однозначно определяемого уникальным кодом – code, указаны модель – model (внешний ключ к таблице Product), 
скорость - speed (процессора в мегагерцах), объем памяти - ram (в мегабайтах), размер диска - hd (в гигабайтах), 
скорость считывающего устройства - cd (например, '4x') и цена - price. 
Таблица Laptop аналогична таблице РС за исключением того, что вместо скорости CD содержит размер экрана -screen (в дюймах).
В таблице Printer для каждой модели принтера указывается, является ли он цветным - color ('y', если цветной), 
тип принтера - type (лазерный – 'Laser', струйный – 'Jet' или матричный – 'Matrix') и цена - price.

Задача 1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
```sql
select model, speed, hd 
from pc where price < 500;
```
Задача 2. Найдите производителей принтеров. Вывести: maker
```sql
select Distinct Maker
from Product where type = 'Printer';
```
Задача 3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
```sql
select model, ram, screen
from Laptop Where Price > 1000;
```
Задача 4. Найдите все записи таблицы Printer для цветных принтеров.
``` sql
select *
from Printer Where color = 'y';
```
Задача 5.Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
``` sql
select model, speed, hd
from PC
where (cd = '12x' or cd = '24x') and price < 600;
```
Задача 6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов.
Вывод: производитель, скорость.
```sql
select Distinct maker, speed
from Product
join Laptop on Product.model=Laptop.model
where hd >=10;
```
Задача 7. Найдите производителя, выпускающего ПК, но не ПК-блокноты.
```sql
select Distinct maker
from Product
where type = 'PC' and maker not in (Select maker From Product Where type = 'Laptop');
```
Задача 8. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
```sql
select Distinct maker
from Product
join PC on Product.model=PC.model
where speed >= 450;
```
Задаяа 9. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), 
Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
```sql
select Distinct a.model, b.model, b.speed, b.ram
from PC a
join PC b on a.ram=b.ram and a.speed=b.speed and a.model > b.model;
```
Задача 10. Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.
```sql
select speed, Avg(price) as Avg_price
from PC
where speed > 600
group by speed;
```











