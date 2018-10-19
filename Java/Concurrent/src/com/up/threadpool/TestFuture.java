package com.up.threadpool;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;

public class TestFuture {

	public static void main(String[] args) throws InterruptedException, ExecutionException {
		// TODO Auto-generated method stub

		FutureTask<Integer> futureTask1 = new FutureTask<Integer>(new Callable<Integer>() {
			@Override
			public Integer call() throws Exception {
				// TODO Auto-generated method stub
				return 1;
			}
		});
		
		FutureTask<Integer> futureTask = new FutureTask<>(()->{
			TimeUnit.SECONDS.sleep(5);
			return 3;
		});
		
		
		new Thread(futureTask).start();
		
		System.out.println(futureTask.get());
		
		
		ExecutorService service =  Executors.newFixedThreadPool(1);
		Future<Integer> f = service.submit(()->{
			try {
				TimeUnit.SECONDS.sleep(5);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return 100;
		});
		
		System.out.println(f.get());
		System.out.println(f.isDone());
	}

}
