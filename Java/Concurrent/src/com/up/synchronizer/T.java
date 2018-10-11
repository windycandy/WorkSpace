package com.up.synchronizer;
/*
 * Ïß³ÌËÀËøÀı
 */

import java.util.concurrent.TimeUnit;

public class T {

	Object o1 = new Object();
	Object o2 = new Object();

	void setx(){
		synchronized (o1) {
	         try {
	 			TimeUnit.SECONDS.sleep(2);
	 		} catch (InterruptedException e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 		}
			System.out.println("setx");
			gety();
		}

	}
	
	void getx(){
		synchronized (o1) {
			System.out.println("getx");	
		}
	}	
	
	void sety(){
		synchronized (o2) {
	         try {
	 			TimeUnit.SECONDS.sleep(2);
	 		} catch (InterruptedException e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 		}
			System.out.println("sety");	
			getx();
		}	
		
	}
	
	void gety(){
		synchronized (o2) {
			System.out.println("gety");	
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        T t = new T();  
		new Thread(()->{
			t.setx();
		},"t1").start();
		
		

		new Thread(()->{
			t.sety();
		},"t2").start();
		
	}

	
}
