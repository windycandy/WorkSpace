package com.up.concurrent;

import java.util.concurrent.TimeUnit;

/*
 * 
 */


public class TestVolatileExt {

	volatile int i  = 0;
	volatile boolean flag = true;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		 TestVolatileExt t = new TestVolatileExt();
		 
		 new Thread(()->{
			 while(t.flag){
				 t.i++;
				 
				
				 System.out.println(Thread.currentThread().getName() +  " " +  t.i);
			 }
		 },"t2").start();
		 
		 
		 

		 
		 new Thread(()->{
			 
				 
					 System.out.println("---------------------");
					 System.out.println(Thread.currentThread().getName() +  " " +  t.i);
					 t.flag = false;
	
				 
			 
		 },"t1").start();
		 
		 System.out.println(Thread.currentThread().getName() +  " " +  t.i);
		 
		 try {
			TimeUnit.SECONDS.sleep(30);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 System.out.println("----------end-----------"); 
	}

}
