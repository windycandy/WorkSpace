package com.up.concurrent;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/*
 * д�Ĵ���û��ԭ���ԣ�����1000��ʱ��ͣ������
 */


public class TestVolatileExt {

	volatile AtomicInteger i  = new AtomicInteger(0);
	volatile boolean flag = true;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		 TestVolatileExt t = new TestVolatileExt();
		 
		 new Thread(()->{
			 while(t.flag){
				 t.i.incrementAndGet();
				 
				
				 System.out.println(Thread.currentThread().getName() +  " " +  t.i.get());
			 }
		 },"t2").start();
		 
		 
		 

		 
		 new Thread(()->{
			 while(true){
				 if(t.i.get() == 1000){
					 System.out.println("---------------------");
					 System.out.println(Thread.currentThread().getName() +  " " +  t.i);
					 t.flag = false;
				 }
				 
			 }
		 },"t1").start();
		 
		 System.out.println(Thread.currentThread().getName() +  " " +  t.i);
		 
		 try {
			TimeUnit.SECONDS.sleep(3);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 System.out.println("----------end-----------"); 
	}

}
