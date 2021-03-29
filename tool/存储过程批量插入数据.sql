drop procedure if exists auto_insert;
create procedure auto_insert()
BEGIN
    declare i int default 1;
    while(i<3000000)do
        insert into share_order(order_no,status) values(concat('O',i),1);
        set i=i+1;
    end while;
END;


call auto_insert();
