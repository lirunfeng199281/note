1. kafka监听代码AOP生成过程
   - KafkaListenerAnnotationBeanPostProcessor.postProcessAfterInitialization
   - KafkaListenerAnnotationBeanPostProcessor.processListener
2. kafka ACK
   1. 0代表producer不用等待broker同步完成确认就可以发下一条
   2. 1代表producer要等leader成功收到数据并且确认才可以发下一条，如果leader死亡但是follwer尚未复制 那么数据会丢失
   3. -1producer要得到follwer确认才可以发下一条
3. Kafka读取配置顺序过程(以为Producer为例)

   1. KafkaProperties.buildProducerProperties 入口方法
2. KafkaProperties.buildCommonProperties 构建通用的 最后一步会读取properties属性
   3. KafkaProperties.buildProperties
4. 到此为止生成好一份Map配置和拥有这份那配置的Factory
   5. 发送消息会后会new Producer DefaultKafkaProducerFactory.createKafkaProducer
6. new KafkaProducer()进入初始化方法
   7. AbstractConfig初始化方法
8. ConfigDef为默认的配置 从ProducerConfig的static方法中
   9. 先取默认配置 然后用外面传来的config覆盖
4. 生产者几个比较常用的配置
   1. acks 同第二点
   2. buffer.memory, batch.size , linger.ms
5. 消费者几个比较常用的配置
   1. auto-offset-reset 当没有offset时候（例如已经存在了消息 然后新加了group）earliest:从头开始消费起 latest:消费最新的
   2. 
6. kafka命令
   1. kafka-topics.sh 主要是topic的增删改查
      1. --list 查看所有topic
      2. --describe -topic lrf-wms-test 查看topic分区 副本等情况
   2. kafka-console-producer.sh 模拟生产者发消息
   3. kafka-console-producer.sh 模拟消费者消费信息
   4. kafka-consumer-groups.sh
      1. --list 查看所有group
      2. --describe  --group wms 查看group情况 有offset情况



