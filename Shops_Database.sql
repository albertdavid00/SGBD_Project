--drop table orders;
--drop table clients;
--drop table shop_product;
--drop table products;
--drop table product_category;
--drop table employees;
--drop table shops;
--select * from audit_log;

create table clients(
        client_id         number(5)   primary key,
        last_name         varchar(55) not null,
        first_name        varchar(55) not null, 
        city              varchar2(30),
        address           varchar(100),
        email             varchar(55));

create table shops(
        shop_id     number(5)   primary key,
        shop_name   varchar(55) not null,
        city        varchar(55) not null); 

create table employees(
        employee_id     number(5)   primary key,
        last_name       varchar(55) not null,
        first_name      varchar(55) not null,
        salary          number(10)  not null,
        email           varchar(100),
        shop_id         number(5)   not null,
        bonus           number(10),
        foreign key(shop_id) references shops(shop_id) on delete cascade); 

create table product_category(
        category_id         number(5)       primary key,
        category_name       varchar(55)     not null,
        warranty            number(10),
        age_restriction     number(4));
        
create table products(
        product_id      number(5)       primary key,
        product_model   varchar(55)     not null,
        brand           varchar(55)     not null,
        category_id     number(5)       not null,
        foreign key(category_id) references product_category(category_id) on delete cascade);

alter table products
add constraint UC_Model unique (product_model);

create table shop_product(
        shop_id         number(5)       not null,
        product_id      number(5)       not null,
        price           number(10),
        stock           number(5),
        constraint PK_shop_product  primary key (shop_id, product_id),
        foreign key(shop_id) references shops(shop_id) on delete cascade,
        foreign key(product_id) references products(product_id) on delete cascade);

create table orders(
        client_id       number(5)       not null,
        product_id      number(5)       not null,
        shop_id         number(5)       not null,
        order_date      date            not null,
        delivery_date   date,
        constraint PK_orders  primary key (client_id, product_id, shop_id),
        foreign key(shop_id) references shops(shop_id) on delete cascade,
        foreign key(product_id) references products(product_id) on delete cascade,
        foreign key(client_id) references clients(client_id) on delete cascade);
        
        
insert into clients values (1,'Popescu', 'Ion', 'Bucuresti', 'strada Unirii nr 54', null);
insert into clients values (2,'Gherghe', 'Andrei', 'Iasi' ,'strada Lirei nr 21', null);
insert into clients values (3,'Popa', 'Iulian', null, null, null);
insert into clients values (4,'Nicolescu', 'Stefan', 'Craiova','strada Lunii nr 3', 'stefann@gmail.com');
insert into clients values (5,'Matei', 'Andreea', 'Cluj', 'strada Industriei nr 99', 'andreeam@gmail.com');
insert into clients values (6,'Stefanescu', 'Liviu', 'Tulcea', 'strada Unirii nr 2', 'liviustef@yahoo.com');
insert into clients values (7,'Tudorescu', 'Gabriel', 'Constanta', 'strada Ecaterina Teodoroiu nr 312', 'tudorgabi@gmail.com');
insert into clients values (8,'Vasiliu', 'Alex', 'Pitesti','strada Ciocarliei nr 11', null);
insert into clients values (9,'Hora', 'George', 'Timisoara', 'strada Victoriei nr 73', 'horageorgel@gmail.com');
insert into clients values (10,'Afrim', 'Andrei', 'Alexandria', 'strada Unirii nr 23', 'deiuafrim@gmail.com');
insert into clients values (11,'Stancu', 'Felix', 'Galati', 'strada Victoriei nr 161', 'lifxeS@yahoo.com');
insert into clients values (12,'Teodosie', 'Iulian', 'Ploiesti', 'strada Popa Sapca nr 1', 'IuliTeo@gmail.com');
insert into clients values (13,'Olaru', 'Ciprian', 'Targu Jiu','strada Independentei nr 32', 'olycipri@gmail.com');
insert into clients values (14,'Enescu', 'Teodora', 'Bucuresti', 'strada Unirii nr 112', null);
insert into clients values (15,'Ionescu', 'Silviu', 'Bucuresti', null, null);
insert into clients values (16,'Costin', 'Toma', 'Cluj', null, null);
insert into clients values (17,'Cretan', 'Lucian', 'Timisoara', null, null);
insert into clients values (18,'Rotaru', 'Serban', 'Cluj', 'strada Henri Coanda nr 68', 'rotaserb@gmail.com');
insert into clients values (19,'Brancusi', 'Elena', 'Iasi','strada Mihai Eminescu nr 5', 'ElenaB@gmail.com');
insert into clients values (20,'Serbanescu', 'Miruna', 'Bucuresti', 'strada I.L. Caragiale nr 15', 'miruser@gmail.com');
insert into clients values (21,'Pop', 'Lavinia', 'Bucuresti', null, 'Lavinia@gmail.com');
insert into clients values (22,'Rotaru', 'Liviu', 'Pitesti', null, 'RLiviu@gmail.com');

select * from clients;

insert into shops values (1, 'Altex', 'Bucuresti');
insert into shops values (2, 'Emag', 'Timisoara');
insert into shops values (3, 'Media Galaxy', 'Cluj');
insert into shops values (4, 'PC Garage', 'Bucuresti');
insert into shops values (5, 'Smec', 'Galati');
insert into shops values (6, 'Tech Shop', 'Constanta');

select * from shops;

insert into employees values (1, 'Davids', 'Paul', 5000,'pauldavids@yahoo.com', 1, 400);
insert into employees values (2, 'Bond', 'James', 4200,'mrjames@yahoo.com', 3, 300);
insert into employees values (3, 'Peters', 'Alfred', 2300,'petersal@yahoo.com', 2, 150);
insert into employees values (4,  'Jonas', 'Chris', 3350,'jchris01@yahoo.com', 2, 350);
insert into employees values (5, 'Butler', 'Nick', 2300, 'nickB@gmail.com', 1, null);
insert into employees values (6, 'Carlson', 'Fred', 6300,'fredCarlson@yahoo.com', 2, null);
insert into employees values (7, 'Carlson', 'Steven',2950,'steviecarl@yahoo.com', 1, 250);
insert into employees values (8, 'Cross', 'Toni', 4900,'tonicross@gmail.com', 1,0);
insert into employees values (9, 'Trent', 'Alexander', 1900,'Talex@gmail.com', 4, 450);
insert into employees values (10, 'Johnson', 'Pamela', 3100,'mrsjohnson@yahoo.com', 1, 125);
insert into employees values (11, 'Maverik', 'Kate', 1230,'mk0115@yahoo.com', 5, 200);
insert into employees values (12, 'Katy', 'Ela', 2100,'elakaty@yahoo.com', 4, null);
insert into employees values (13, 'Manson', 'John', 2500,'johnmanson@gmail.com', 5, null);
insert into employees values (14, 'Carlsen', 'Magnus', 7100,'magnuscarlsen@yahoo.com', 2, 200);
insert into employees values (15, 'Henry', 'Paul', 1500,'paulhenry@yahoo.com', 3, null);
insert into employees values (16, 'Olsen', 'Gregory', 4700,'gregolsen@yahoo.com', 2, 0);
insert into employees values (17, 'Larsen', 'Nick', 2300,'larsenn@gmail.com', 3, 600);
insert into employees values (18, 'James', 'Joseph', 1500,'JosephJ@yahoo.com', 3, 200);
insert into employees values (19, 'Stonie', 'Matt', 2500,'MStonie@yahoo.com', 4, 100);
insert into employees values (20, 'Stevens', 'Carl', 3300,'CarlS@yahoo.com', 5, 150);
insert into employees values (21, 'Mosby', 'Ted', 6100,'TedMosby@yahoo.com', 6, 0);

select * from employees;

insert into product_category values(1, 'Televizoare', 4, null);
insert into product_category values(2, 'Telefoane', 2, 5);
insert into product_category values(3, 'Boxe', 1, null);
insert into product_category values(4, 'Aparate foto', 2, 5);
insert into product_category values(5, 'Camere video', 2, 5);
insert into product_category values(6, 'Casti', 2, null);
insert into product_category values(7, 'Laptop', 3, 6);
insert into product_category values(8, 'Videoproiectoare', null, 7);
insert into product_category values(9, 'Sistem Desktop', 4, 7);
insert into product_category values(10, 'Mouse', 2, null);
insert into product_category values(11, 'Tablete', 2, 4);
insert into product_category values(12, 'Monitor PC', null, 3);
insert into product_category values(13, 'Tastaturi', 1, 5);
insert into product_category values(14, 'Controller Gaming', null, null);

select * from product_category;

insert into products values(1, 'Galaxy S10', 'Samsung', 2);
insert into products values(2, 'Galaxy S20 Ultra', 'Samsung', 2);
insert into products values(3, 'Iphone X', 'Apple', 2);
insert into products values(4, 'Iphone 12 Pro', 'Apple', 2);
insert into products values(5, 'Mate Xs', 'Huawei', 2);
insert into products values(6, 'Galaxy S9', 'Samsung', 2);
insert into products values(7, 'Led-TV Smart Bravia', 'Sony', 1);
insert into products values(8, 'QLED Smart 50Q', 'LG', 1);
insert into products values(9, 'NanoCell 50NANO793NE', 'LG', 1);
insert into products values(10, 'SMART-TV UHD S20Q50A', 'Samsung', 1);
insert into products values(11, 'Control X', 'JBL', 3);
insert into products values(12, 'DSLR D2500', 'Nikon', 4);
insert into products values(13, 'Coolpix B500', 'Canon', 4);
insert into products values(14, 'Hero 8', 'GoPro', 5);
insert into products values(15, 'Kraken 7.1', 'Razer', 6);
insert into products values(16, 'Pro X LightSpeed', 'Logitech', 6);
insert into products values(17, 'TUF F15', 'Asus', 7);
insert into products values(18, 'ROG Strix G15', 'Asus', 7);
insert into products values(19, 'Macbook Air mq12', 'Apple', 7);
insert into products values(20, 'Macbook Pro 10', 'Apple', 7);
insert into products values(21, 'VP PD1520', 'Acer', 8);
insert into products values(22, 'Desktop Gaming ROG GT15', 'Asus', 9);
insert into products values(23, 'Digital V26', 'Myria', 9);
insert into products values(24, 'Basilisk Ultimate', 'Razer', 10);
insert into products values(25, 'Lightspeed G605', 'Logitech', 10);
insert into products values(26, 'Rival 710', 'Steelseries', 10);
insert into products values(27, 'Ipad Air 3', 'Apple', 11);
insert into products values(28, 'Galaxy Tab S7', 'Samsung', 11);
insert into products values(29, 'Led IPS', 'Dell', 12);
insert into products values(30, 'BlackWidow Pro', 'Razer', 13);
insert into products values(31, 'Xbox One Elite', 'Microsoft', 14);

select * from products;

insert into shop_product values (1, 1, 2500, 20);
insert into shop_product values (2, 1, 2400, 15);
insert into shop_product values (3, 1, 2500, 26);
insert into shop_product values (5, 1, 2700, 10);
insert into shop_product values (1, 2, 6500, 35);
insert into shop_product values (2, 2, 6700, 12);
insert into shop_product values (3, 2, 6600, 9);
insert into shop_product values (6, 2, 7100, null);
insert into shop_product values (1, 3, 3500, 39);
insert into shop_product values (2, 3, 3550, null);
insert into shop_product values (3, 3, 3500, null);
insert into shop_product values (5, 3, 3900, 14);
insert into shop_product values (1, 4, 5500, 21);
insert into shop_product values (2, 4, 5500, 33);
insert into shop_product values (3, 4, 6000, 11);
insert into shop_product values (1, 5, 2900, 6);
insert into shop_product values (2, 5, 3100, 17);
insert into shop_product values (3, 6, null, null);
insert into shop_product values (4, 7, 3200, 10);
insert into shop_product values (5, 7, 2950, 5);
insert into shop_product values (6, 7, 2955, null);
insert into shop_product values (1, 8, 8000, 3);
insert into shop_product values (2, 9, 5500, 20);
insert into shop_product values (6, 9, 4700, 12);
insert into shop_product values (2, 10, 9000, 5);
insert into shop_product values (3, 10, 8900, 7);
insert into shop_product values (1, 11, 900, 23);
insert into shop_product values (3, 11, 890, 10);
insert into shop_product values (5, 12, 699, 15);
insert into shop_product values (6, 13, 499, 13);
insert into shop_product values (2, 14, 1200, 11);
insert into shop_product values (5, 14, 1355, 6);
insert into shop_product values (1, 15, 299, 30);
insert into shop_product values (2, 15, 299, 45);
insert into shop_product values (4, 15, 350, 19);
insert into shop_product values (3, 16, 399, 26);
insert into shop_product values (6, 16, 389, null);
insert into shop_product values (3, 17, 4500, null);
insert into shop_product values (5, 17, 4490, 5);
insert into shop_product values (2, 18, 5190, 10);
insert into shop_product values (4, 18, 5299, 11);
insert into shop_product values (1, 19, 9199, 9);
insert into shop_product values (4, 20, null, 1);
insert into shop_product values (5, 21, 799, 20);
insert into shop_product values (6, 21, null, null);
insert into shop_product values (1, 22, 2600, 51);
insert into shop_product values (2, 22, 2690, 40);
insert into shop_product values (4, 22, 2500, 10);
insert into shop_product values (3, 23, 3100, 11);
insert into shop_product values (6, 23, 3100, 21);
insert into shop_product values (2, 24, 900, 8);
insert into shop_product values (4, 24, 1100, 12);
insert into shop_product values (4, 25, 699, 100);
insert into shop_product values (5, 26, 300, 60);
insert into shop_product values (6, 26, 290, 0);
insert into shop_product values (6, 27, 2000, 5);
insert into shop_product values (1, 27, 2200, 8);
insert into shop_product values (2, 28, 1800, 32);
insert into shop_product values (4, 29, 700, 40);
insert into shop_product values (1, 30, 590, 35);
insert into shop_product values (2, 30, 9000, 5);
insert into shop_product values (1, 31, 299, 17);
insert into shop_product values (2, 31, 299, null);

select * from shop_product;

insert into orders values (1, 1, 1, to_date('23/11/2019', 'DD/MM/YYYY'), to_date('19/01/2020', 'DD/MM/YYYY'));
insert into orders values (1, 5, 2, to_date('05/12/2019', 'DD/MM/YYYY'), to_date('11/12/2019', 'DD/MM/YYYY'));
insert into orders values (2, 1, 5, to_date('16/05/2018', 'DD/MM/YYYY'), to_date('20/05/2018', 'DD/MM/YYYY'));
insert into orders values (3, 15, 4, to_date('25/09/2019', 'DD/MM/YYYY'), to_date('02/10/2019', 'DD/MM/YYYY'));
insert into orders values (3, 30, 1, to_date('05/12/2019', 'DD/MM/YYYY'), to_date('10/12/2019', 'DD/MM/YYYY'));
insert into orders values (4, 4, 2, to_date('01/11/2020', 'DD/MM/YYYY'), to_date('07/11/2020', 'DD/MM/YYYY'));
insert into orders values (4, 10, 3, to_date('23/06/2020', 'DD/MM/YYYY'), to_date('30/06/2020', 'DD/MM/YYYY'));
insert into orders values (4, 14, 5, to_date('07/08/2020', 'DD/MM/YYYY'), to_date('14/08/2020', 'DD/MM/YYYY'));
insert into orders values (5, 17, 3, to_date('12/06/2020', 'DD/MM/YYYY'), to_date('17/06/2020', 'DD/MM/YYYY'));
insert into orders values (6, 16, 6, to_date('25/09/2020', 'DD/MM/YYYY'), to_date('01/10/2020', 'DD/MM/YYYY'));
insert into orders values (7, 26, 5, to_date('11/04/2020', 'DD/MM/YYYY'), to_date('16/04/2020', 'DD/MM/YYYY'));
insert into orders values (8, 27, 1, to_date('20/12/2020', 'DD/MM/YYYY'), null);
insert into orders values (8, 31, 2, to_date('15/12/2020', 'DD/MM/YYYY'), to_date('20/12/2020', 'DD/MM/YYYY'));
insert into orders values (9, 7, 4, to_date('19/05/2020', 'DD/MM/YYYY'), to_date('05/06/2020', 'DD/MM/YYYY'));
insert into orders values (9, 14, 2, to_date('11/12/2020', 'DD/MM/YYYY'), null);
insert into orders values (10, 22, 4, to_date('12/07/2020', 'DD/MM/YYYY'), to_date('16/07/2020', 'DD/MM/YYYY'));
insert into orders values (10, 30, 1, to_date('12/07/2020', 'DD/MM/YYYY'), to_date('15/07/2020', 'DD/MM/YYYY'));
insert into orders values (10, 24, 2, to_date('13/07/2020', 'DD/MM/YYYY'), to_date('17/07/2020', 'DD/MM/YYYY'));
insert into orders values (11, 12, 5, to_date('09/05/2020', 'DD/MM/YYYY'), to_date('14/05/2020', 'DD/MM/YYYY'));
insert into orders values (11, 29, 4, to_date('02/06/2020', 'DD/MM/YYYY'), to_date('11/06/2020', 'DD/MM/YYYY'));
insert into orders values (12, 7, 6, to_date('01/07/2020', 'DD/MM/YYYY'), to_date('06/07/2020', 'DD/MM/YYYY'));
insert into orders values (13, 2, 3, to_date('15/06/2020', 'DD/MM/YYYY'), to_date('20/06/2020', 'DD/MM/YYYY'));
insert into orders values (14, 18, 2, to_date('19/12/2020', 'DD/MM/YYYY'), null);
insert into orders values (15, 19, 1, to_date('05/02/2020', 'DD/MM/YYYY'), to_date('14/02/2020', 'DD/MM/YYYY'));
insert into orders values (15, 20, 4, to_date('01/06/2020', 'DD/MM/YYYY'), to_date('10/06/2020', 'DD/MM/YYYY'));
insert into orders values (16, 21, 5, to_date('09/09/2019', 'DD/MM/YYYY'), to_date('15/09/2019', 'DD/MM/YYYY'));
insert into orders values (16, 16, 3, to_date('19/08/2020', 'DD/MM/YYYY'), to_date('29/08/2020', 'DD/MM/YYYY'));
insert into orders values (17, 10, 3, to_date('23/06/2020', 'DD/MM/YYYY'), to_date('28/06/2020', 'DD/MM/YYYY'));
insert into orders values (18, 14, 2, to_date('09/04/2020', 'DD/MM/YYYY'), to_date('01/05/2020', 'DD/MM/YYYY'));
insert into orders values (19, 14, 2, to_date('12/06/2020', 'DD/MM/YYYY'), to_date('18/06/2020', 'DD/MM/YYYY'));
insert into orders values (19, 6, 3, to_date('15/06/2020', 'DD/MM/YYYY'), to_date('22/06/2020', 'DD/MM/YYYY'));
insert into orders values (20, 7, 6, to_date('23/06/2020', 'DD/MM/YYYY'), to_date('30/06/2020', 'DD/MM/YYYY'));
insert into orders values (20, 3, 3, to_date('11/06/2020', 'DD/MM/YYYY'), to_date('30/06/2020', 'DD/MM/YYYY'));
insert into orders values (20, 31, 2, to_date('21/09/2020', 'DD/MM/YYYY'), to_date('30/09/2020', 'DD/MM/YYYY'));
insert into orders values (20, 26, 5, to_date('03/06/2020', 'DD/MM/YYYY'), to_date('08/06/2020', 'DD/MM/YYYY'));

select * from orders;

--Ex 6
create or replace procedure emp_buy_products(venit number)
as
    type tab_ind is table of employees%rowtype index by pls_integer;
    type tab_ind2 is table of shop_product%rowtype index by pls_integer;
    t_emp           tab_ind;
    t_prod          tab_ind2;
    k_prod          number(6);
    income          number(10);
    suma            number(10);
    no_employees    exception;
begin
    select * bulk collect into t_emp
    from employees 
    where salary + nvl(bonus,0) >= venit;
    
    select * bulk collect into t_prod
    from shop_product
    order by price;
    if t_emp.count = 0 then
        raise no_employees;
    end if;
    
    for i in t_emp.first..t_emp.last loop
        suma := 0;
        k_prod := 0;
        income := t_emp(i).salary + nvl(t_emp(i).bonus, 0);
        for j in t_prod.first..t_prod.last loop
            if t_prod(j).stock = 0 then
                continue;
            end if;
            suma := suma + t_prod(j).price;
            if suma <= income then 
                k_prod := k_prod + 1;
            else 
                exit;
            end if;
        end loop;
        dbms_output.put_line(i || '. Angajatul ' || t_emp(i).first_name || ' ' ||t_emp(i).last_name
        || ' cu venitul ' || income || ' poate cumpara ' || k_prod || ' produse.');
    end loop;  
exception 
    when no_employees then 
         dbms_output.put_line('Nu exista angajati cu un venit destul de mare.');
	 raise_application_error(-20001,'Nu exista angajati cu un venit destul de mare.');
end emp_buy_products;
/
execute emp_buy_products(&venit);

--Ex 7
create or replace procedure shopmaxprice
is
    v_shop          shops.shop_name%type;
    v_model         products.product_model%type;
    v_brand         products.brand%type;
    v_categ         product_category.category_name%type;
    v_price         shop_product.price%type;
    max_price       number(10):= 0;
    current_shop    shops.shop_name%type := ' ';
    aux_model       products.product_model%type;
    aux_brand       products.brand%type;
    aux_categ       product_category.category_name%type;       
    cursor c is 
        select shop_name, product_model, brand, category_name, nvl(price,0)
        from shops join shop_product using (shop_id) 
                   join products using (product_id) 
                   join product_category using (category_id)
        order by 1, 5 desc;
begin
    open c;
        fetch c into v_shop, v_model, v_brand, v_categ, v_price;
        current_shop := v_shop;
        aux_model := v_model;
        aux_brand := v_brand;
        aux_categ := v_categ;
        max_price := v_price;
        dbms_output.put_line('Magazin: ' || current_shop);
        while c%found loop
            if current_shop != v_shop then
                current_shop := v_shop;
                aux_model := v_model;
                aux_brand := v_brand;
                aux_categ := v_categ;
                max_price := v_price;
                dbms_output.put_line('Magazin: ' || current_shop);
            end if;
            if v_price = max_price then
                aux_model := v_model;
                aux_brand := v_brand;
                aux_categ := v_categ;
                dbms_output.put_line(' - ' || aux_categ || ': ' || aux_brand || ' ' || aux_model || '; pret: ' || max_price);
            end if;
            fetch c into v_shop, v_model, v_brand, v_categ, v_price;
        end loop;
    close c;
end;
/
execute shopmaxprice();


--Ex 8
create or replace function orderedProducts(pModel products.product_model%type) return number
is
    garantie    number(2);
    null_warr   exception;
begin
    select warranty into garantie
    from product_category join products using (category_id) join orders using (product_id)
    where to_char(order_date, 'YYYY') = '2020' and lower(product_model) = lower(pModel);
    
    if garantie is null then
        raise null_warr;
    end if;
    return garantie;
    
exception 
    when no_data_found then
        raise_application_error(-20001,'Nu exista produse comandate in 2020 cu un astfel de model.');
    when too_many_rows then
        raise_application_error(-20001,'Exista mai multe produse comandate.');  -- Hero 8
    when null_warr then
        dbms_output.put_line('Garantia produsului este necunoscuta.');      -- Led IPS
        raise_application_error(-20002, 'Garantie necunoscuta.');
    when others then
        raise_application_error(-20002, 'Alta eroare');
end;
/
begin
    dbms_output.put_line('Garantia produsului este ' || orderedProducts('&model'));
end;
/

--Ex 9
create or replace procedure client_orders(nume clients.last_name%type)
as
var_name        clients.last_name%type;
var_client      clients.client_id%type;
total_money     number(10):= 0;
c_isEmpty         boolean:= true;
cursor c is
    select brand, product_model, pc.category_name, nvl(price,0) price, shop_name, o.order_date
    from orders o join products p on (o.product_id = p.product_id)
                  join product_category pc on (p.category_id = pc.category_id)
                  join shop_product sp on (sp.product_id = p.product_id and o.shop_id = sp.shop_id)
                  join shops s on (s.shop_id = sp.shop_id)
    where o.client_id = var_client;
begin
    select client_id, last_name into var_client, var_name
    from clients
    where lower(last_name) = lower(nume);
       
    for i in c loop
        if i.order_date between to_date('01/06/2020', 'DD/MM/YYYY') and to_date('01/09/2020', 'DD/MM/YYYY') then
            total_money := total_money + 0.75*i.price;
        else
            total_money := total_money + i.price;
        end if;
        c_isEmpty := false;
    end loop;
    dbms_output.put_line ('Clientul ' || var_name || ' a cheltuit ' || total_money || ' lei.');
    if c_isEmpty = false then
        dbms_output.put_line ('Produsele comandate sunt: ');
    else 
        dbms_output.put_line ('Clientul nu a cumparat niciun produs.');
    end if;
    for i in c loop
        if i.order_date between to_date('01/06/2020', 'DD/MM/YYYY') and to_date('01/09/2020', 'DD/MM/YYYY') then
            dbms_output.put_line(i.category_name || ': ' ||i.brand || ' ' || i.product_model
            || ' cu pretul la reducere ' || i.price*0.75 || ' lei de la magazinul ' || i.shop_name);
        else
            dbms_output.put_line(i.category_name || ': ' ||i.brand || ' ' || i.product_model
            || ' cu pretul ' || i.price || ' lei de la magazinul ' || i.shop_name);    
        end if;
    end loop;
    
exception
    when no_data_found then
        dbms_output.put_line('Nu exista client cu acest nume.');
    when too_many_rows then
        dbms_output.put_line('Exista mai multi clienti cu acest nume.');
    when others then
        dbms_output.put_line('Alta eroare');
end client_orders;
/
execute client_orders('&nume');

--Ex 10
create or replace trigger trig_ang_prog
    before insert or update or delete on employees
begin
    if inserting then
        if sysdate between to_date('01/09', 'dd/mm') and to_date('01/12', 'dd/mm') then
            if to_char(sysdate, 'D') = 1 then
                raise_application_error(-20001, 'Nu se pot insera date Duminica!');
            elsif to_char(sysdate, 'hh24') not between 7 and 23 then
                raise_application_error(-20002, 'Nu se pot insera date decat in timpul programului de lucru!');
            end if;
        else 
            raise_application_error(-20003, 'Nu se pot adauga angajati! Magazinele angajeaza doar in toamna.');
        end if;
    elsif updating then
        if to_char(sysdate, 'D') = 1 then
                raise_application_error(-20004, 'Nu se pot actualiza date Duminica!');
            elsif to_char(sysdate, 'hh24') not between 7 and 23 then
                raise_application_error(-20005, 'Nu se pot actualiza date decat in timpul programului de lucru!');
        end if;
    else
        if to_char(sysdate, 'D') = 1 then
                raise_application_error(-20006, 'Nu se pot sterge date Duminica!');
            elsif to_char(sysdate, 'hh24') not between 7 and 23 then
                raise_application_error(-20007, 'Nu se pot sterge date decat in timpul programului de lucru!');
        end if;
    end if;
end;
/

--insert into employees values (22, 'Star', 'James', 3100,'stj@yahoo.com', 6, 0);
--update employees set salary = 3000 where employee_id = 21;
--delete from employees where last_name = 'Bond';

-- Ex 11
create or replace package pachet_trig
as 
    type rec is record (pid     shop_product.product_id%type,
                        med_price   shop_product.price%type);
    type varr is varray(101) of rec;
    prod_med     rec;
    v_medii      varr := varr();
end pachet_trig;
/

create or replace trigger trig_pret1
before update of price on shop_product
declare 
    k     number := 1;
    cursor c is
        select product_id, avg(nvl(price, 0)) pret
        from shop_product
        group by product_id
        order by 1;
begin
    for i in c loop
        pachet_trig.prod_med.pid := i.product_id; 
        pachet_trig.prod_med.med_price := i.pret;
        pachet_trig.v_medii.extend;
        pachet_trig.v_medii(k) := pachet_trig.prod_med;
        k := k + 1;
    end loop;
end;
/

create or replace trigger trig_pret2
before update of price on shop_product
for each row
declare pretMediu       shop_product.price%type;
begin
    for i in pachet_trig.v_medii.first..pachet_trig.v_medii.last loop
        if pachet_trig.v_medii(i).pid = :new.product_id then
            pretMediu := pachet_trig.v_medii(i).med_price;
        end if;
    end loop;
    pachet_trig.v_medii.trim(pachet_trig.v_medii.count); -- golesc vectorul dupa ce am folosit informatiile
    if (:new.price < pretMediu / 2) then
        raise_application_error(-20001, 'Pretul este prea mic!');
    elsif (:new.price > 2 * pretMediu) then
         raise_application_error(-20002, 'Pretul este prea mare!');
    end if;
end;
/
-- insert into products values(32, 'Dualshock', 'Sony', 14);
-- insert into shop_product values (1, 32, 200, 10);
-- insert into shop_product values (2, 32, 400, 7);
-- insert into shop_product values (3, 32, 250, 5);
--select * from products join shop_product using (product_id) order by 1 desc;
-- update shop_product
-- set price = 600
-- where product_id = 32 and shop_id = 1;

--Ex 12
create table audit_log(username     varchar2(30),
                       db_name      varchar2(50),
                       event        varchar2(20),
                       object_name  varchar2(30),
                       event_date   date);
                       
create or replace trigger trig_audit
    after create or drop or alter on schema
begin
    insert into audit_log
    values (sys.login_user, sys.database_name, sys.sysevent, sys.dictionary_obj_name, sysdate);
end;
/
--create index myInd on employees(last_name);
--drop index myInd;
--select * from audit_log;

--Ex 13
create or replace package my_package
is
    procedure emp_buy_products(venit number);
    procedure shopmaxprice;
    function orderedProducts(pModel products.product_model%type) return number;
    procedure client_orders(nume clients.last_name%type);
end my_package;
/
create or replace package body my_package
is
    procedure emp_buy_products(venit number)
    as
        type tab_ind is table of employees%rowtype index by pls_integer;
        type tab_ind2 is table of shop_product%rowtype index by pls_integer;
        t_emp           tab_ind;
        t_prod          tab_ind2;
        k_prod          number(6);
        income          number(10);
        suma            number(10);
        no_employees    exception;
    begin
        select * bulk collect into t_emp
        from employees 
        where salary + nvl(bonus,0) >= venit;
        
        select * bulk collect into t_prod
        from shop_product
        order by price;
        if t_emp.count = 0 then
            raise no_employees;
        end if;
        
        for i in t_emp.first..t_emp.last loop
            suma := 0;
            k_prod := 0;
            income := t_emp(i).salary + nvl(t_emp(i).bonus, 0);
            for j in t_prod.first..t_prod.last loop
                if t_prod(j).stock = 0 then
                    continue;
                end if;
                suma := suma + t_prod(j).price;
                if suma <= income then 
                    k_prod := k_prod + 1;
                else 
                    exit;
                end if;
            end loop;
            dbms_output.put_line(i || '. Angajatul ' || t_emp(i).first_name || ' ' ||t_emp(i).last_name
            || ' cu venitul ' || income || ' poate cumpara ' || k_prod || ' produse.');
        end loop;  
    exception 
        when no_employees then 
             dbms_output.put_line('Nu exista angajati cu un venit destul de mare.');
         raise_application_error(-20001,'Nu exista angajati cu un venit destul de mare.');
    end emp_buy_products;
    
    procedure shopmaxprice
    is
        v_shop          shops.shop_name%type;
        v_model         products.product_model%type;
        v_brand         products.brand%type;
        v_categ         product_category.category_name%type;
        v_price         shop_product.price%type;
        max_price       number(10):= 0;
        current_shop    shops.shop_name%type := ' ';
        aux_model       products.product_model%type;
        aux_brand       products.brand%type;
        aux_categ       product_category.category_name%type;       
        cursor c is 
            select shop_name, product_model, brand, category_name, nvl(price,0)
            from shops join shop_product using (shop_id) join products using (product_id) join product_category using (category_id)
            order by 1, 5 desc;
    begin
        open c;
            fetch c into v_shop, v_model, v_brand, v_categ, v_price;
            current_shop := v_shop;
            aux_model := v_model;
            aux_brand := v_brand;
            aux_categ := v_categ;
            max_price := v_price;
            dbms_output.put_line('Magazin: ' || current_shop);
            while c%found loop
                if current_shop != v_shop then
                    current_shop := v_shop;
                    aux_model := v_model;
                    aux_brand := v_brand;
                    aux_categ := v_categ;
                    max_price := v_price;
                    dbms_output.put_line('Magazin: ' || current_shop);
                end if;
                if v_price = max_price then
                    aux_model := v_model;
                    aux_brand := v_brand;
                    aux_categ := v_categ;
                    dbms_output.put_line(' - ' || aux_categ || ': ' || aux_brand || ' ' || aux_model || '; pret: ' || max_price);
                end if;
                fetch c into v_shop, v_model, v_brand, v_categ, v_price;
            end loop;
        close c;
    end shopmaxprice;
    
    function orderedProducts(pModel products.product_model%type) return number
    is
        garantie    number(2);
        null_warr   exception;
    begin
        select warranty into garantie
        from product_category join products using (category_id) join orders using (product_id)
        where to_char(order_date, 'YYYY') = '2020' and lower(product_model) = lower(pModel);
        
        if garantie is null then
            raise null_warr;
        end if;
        return garantie;
        
    exception 
        when no_data_found then
            raise_application_error(-20001,'Nu exista produse comandate in 2020 cu un astfel de model.');
        when too_many_rows then
            raise_application_error(-20001,'Exista mai multe produse comandate.');  -- Hero 8
        when null_warr then
            dbms_output.put_line('Garantia produsului este necunoscuta.');      -- Led IPS
            raise_application_error(-20002, 'Garantie necunoscuta.');
        when others then
            raise_application_error(-20002, 'Alta eroare');
    end orderedProducts;
    
    procedure client_orders(nume clients.last_name%type)
    as
    var_name        clients.last_name%type;
    var_client      clients.client_id%type;
    total_money     number(10):= 0;
    c_isEmpty         boolean:= true;
    cursor c is
        select brand, product_model, pc.category_name, nvl(price,0) price, shop_name, o.order_date
        from orders o join products p on (o.product_id = p.product_id)
                      join product_category pc on (p.category_id = pc.category_id)
                      join shop_product sp on (sp.product_id = p.product_id and o.shop_id = sp.shop_id)
                      join shops s on (s.shop_id = sp.shop_id)
        where o.client_id = var_client;
    begin
        select client_id, last_name into var_client, var_name
        from clients
        where lower(last_name) = lower(nume);
           
        for i in c loop
            if i.order_date between to_date('01/06/2020', 'DD/MM/YYYY') and to_date('01/09/2020', 'DD/MM/YYYY') then
                total_money := total_money + 0.75*i.price;
            else
                total_money := total_money + i.price;
            end if;
            c_isEmpty := false;
        end loop;
        dbms_output.put_line ('Clientul ' || var_name || ' a cheltuit ' || total_money || ' lei.');
        if c_isEmpty = false then
            dbms_output.put_line ('Produsele comandate sunt: ');
        else 
            dbms_output.put_line ('Clientul nu a cumparat niciun produs.');
        end if;
        for i in c loop
            if i.order_date between to_date('01/06/2020', 'DD/MM/YYYY') and to_date('01/09/2020', 'DD/MM/YYYY') then
                dbms_output.put_line(i.category_name || ': ' ||i.brand || ' ' || i.product_model
                || ' cu pretul la reducere ' || i.price*0.75 || ' lei de la magazinul ' || i.shop_name);
            else
                dbms_output.put_line(i.category_name || ': ' ||i.brand || ' ' || i.product_model
                || ' cu pretul ' || i.price || ' lei de la magazinul ' || i.shop_name);    
            end if;
        end loop;
    exception
        when no_data_found then
            dbms_output.put_line('Nu exista client cu acest nume.');
        when too_many_rows then
            dbms_output.put_line('Exista mai multi clienti cu acest nume.');
        when others then
            dbms_output.put_line('Alta eroare');
    end client_orders;
end my_package;
/

execute my_package.emp_buy_products(&venit);
execute my_package.shopmaxprice();
begin
    dbms_output.put_line('Garantia produsului este ' || my_package.orderedProducts('&model'));
end;
/
execute my_package.client_orders('&nume');


--Ex14
create or replace package pack14
is
    function categ_count(nr out number) return number;
    function find_client(pNume clients.last_name%type) return boolean;
    procedure add_order(nume clients.last_name%type, produs products.product_model%type);

end pack14;
/

create or replace package body pack14
is
    function categ_count(nr out number) return number
    is 
        nrCateg     number(2):= 0;
    begin
        select count(*) into nrCateg
        from product_category;
        nr := nrCateg;
        return nrCateg;
    end categ_count;    
-----------------------------------------------------------------------------------
    function find_client(pNume clients.last_name%type) return boolean
    is 
        nr_clienti        number(2);
    begin
        select count(*) into nr_clienti
        from clients 
        where last_name = pNume;
        
        if nr_clienti > 0 then 
            return true;
        else 
            return false;
        end if;
    end find_client;
------------------------------------------------------------------------------------------
    procedure add_order(nume clients.last_name%type, produs products.product_model%type)
    is
        comandaExistenta    exception;
        nr                  number;
        type v_linie is varray(2) of number;
        type matrice is varray(101) of v_linie;
        var_linie       v_linie := v_linie(1,2);
        categorii       matrice := matrice(var_linie);
        var_shop        shops.shop_id%type;
        minPrice        number:= 999999;
        nume_client     clients.last_name%type;
        checkClient     boolean;
        prodId          number;
        clientId        number;
        k               number :=0;
        aux             number;
        aux2            number;
        nr_categ        number;
        categ_prod      number;
        existsOrder     number;
        checkShop       boolean:= false;
        noShop          exception;
        cursor c is 
            select shop_id, product_id, stock, price
            from shop_product join products using (product_id) 
            where product_model = produs;
    begin
        select product_id into prodId
        from products
        where product_model = produs;
        
        for i in c loop
            if i.stock > 0 then
                if i.price < minPrice then
                    checkShop := True;
                    minPrice := i.price;
                    var_shop := i.shop_id;
                end if;
            end if;
        end loop;
        if checkShop = false then
            raise noShop;
        end if;
        checkClient := find_client(nume);
        if checkClient = true then      -- daca exista deja clientul in baza de date
        
            select client_id into clientId
            from clients 
            where nume = last_name;
            
            select count(*) into existsOrder
            from orders
            where shop_id = var_shop and product_id = prodId and clientId = client_id;
            
            if existsOrder = 1 then
                raise comandaExistenta;
            elsif existsOrder = 0 then
                insert into orders values (clientId, prodId, var_shop, sysdate, null);
            end if;
        else 
            select count(*) into clientId
            from clients;
            clientId := clientId + 1;
            insert into clients values (clientId ,nume, ' ', null, null, null);
            insert into orders values (clientId, prodId, var_shop, sysdate, null);
        end if;
        
        update shop_product             -- scad din stocul magazinului pt produsul respectiv
        set stock = stock - 1
        where product_id = prodId and shop_id = var_shop;
        
        select category_id into categ_prod
        from products
        where product_id = prodId;
        
        select nvl(warranty, 0), nvl(age_restriction,0) into aux, aux2
        from product_category
        where category_id = 1;
        
        categorii(1)(1) := aux;     -- garantia
        categorii(1)(2) := aux2;    -- restrictia de varsta
        
        nr_categ := categ_count(nr); 
        for i in 2..nr_categ loop
            select nvl(warranty, 0), nvl(age_restriction,0) into aux, aux2
            from product_category
            where category_id = i;
            categorii.extend;
            categorii(i) := v_linie(aux, aux2);
        end loop;
            
        for i in 1..categorii.count loop
            if i = categ_prod then
                aux := categorii(i)(1);
                aux2 := categorii(i)(2);
            end if;
        end loop;
        dbms_output.put_line('Comanda pt produsul ' || produs || ' care are garantia ' 
        || aux || ' si restrictia de varsta ' || aux2 || ' a fost plasata.');
        
        exception
            when no_data_found then
                raise_application_error(-20005,'Produsul nu a fost gasit.');
            when too_many_rows then
                raise_application_error(-20005,'Exista mai multi clienti cu acest nume!');
            when comandaExistenta then 
                raise_application_error(-20006, 'Comanda exista deja in baza de date');
            when noShop then
                raise_application_error(-20007, 'Nu exista magazin cu produsul respectiv in stoc.');
    end add_order; 
end;
/
execute pack14.add_order('Felix', 'Iphone X');

select * from clients join orders using (client_id) order by 2;
select * from products join shop_product using (product_id);