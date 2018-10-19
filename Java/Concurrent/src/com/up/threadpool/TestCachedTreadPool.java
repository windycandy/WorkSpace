package com.up.threadpool;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class TestCachedTreadPool {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        ExecutorService service =  Executors.newCachedThreadPool();
        
		System.out.println(service);
		
		for(int i  = 0 ; i < 50; i++){
			service.submit(()->{
				try {
					TimeUnit.MICROSECONDS.sleep(200);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(Thread.currentThread().getName());
			});
		}
		
		System.out.println(service);
		
		try {
			TimeUnit.SECONDS.sleep(10);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(service);
		
		
	}

}
