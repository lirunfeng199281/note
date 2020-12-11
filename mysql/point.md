1. 查看mysql连接

   1. ```mysql
      SELECT * FROM INFORMATION_SCHEMA.PROCESSLIST
      ```

   2. 无法从mysql-connector上面获取连接id

   3. TIME是保持当前状态的时间

2. 查看当前事务(开启了没有commit/rollback)

   1. ```mysql
      SELECT * FROM INFORMATION_SCHEMA.INNODB_TRX
      ```

   2. 如果开启了事务 就会有记录

   3. trx_mysql_thread_id对应上面的连接id

   4. trx_state RUNNING 不一定是在跑sql 可能是等待commit LOCK WAIT等待锁 

   5. trx_requested_lock_id 持有锁null 等锁的有ID

3. 查看当前锁情况

   1. ```mysql
      SELECT * FROM INFORMATION_SCHEMA.INNODB_LOCKS;
      ```

   2. lock_mode S读锁 X写锁

4. 查看等锁情况

   1. ```mysql
      SELECT * FROM INFORMATION_SCHEMA.INNODB_LOCK_WAITS;
      ```

   2. request等锁 block持有锁