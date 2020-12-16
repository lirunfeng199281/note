1. kafka监听代码AOP生成过程
   - KafkaListenerAnnotationBeanPostProcessor.postProcessAfterInitialization
   - KafkaListenerAnnotationBeanPostProcessor.processListener
2. kafka ACK
   1. 0代表producer不用等待broker同步完成确认就可以发下一条
   2. 1代表producer要等leader成功收到数据并且确认才可以发下一条，如果leader死亡但是follwer尚未复制 那么数据会丢失
   3. -1producer要得到follwer确认才可以发下一条
