package com.up.threadpool;

import java.util.Arrays;
import java.util.Random;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.ForkJoinTask;
import java.util.concurrent.RecursiveTask;

public class TestForkJoin {
	static int [] num = new int[100000];
	int sum;
	
	static Random r = new Random();
	
	static{
		for(int i = 0; i< 100000; i++){
			num[i] = 100000+ r.nextInt(100000);
		}
	}
	
	public static void main(String[] args) throws InterruptedException, ExecutionException {
         System.out.println(Arrays.stream(num).sum());
         
         ForkJoinPool  fork =  new ForkJoinPool();
         Task t = new Task(0, num.length);
         fork.execute(t);
         t.join();
         System.out.println(">>>>" + t.get());
	}

	
	static class Task extends RecursiveTask<Integer> {

		int start,end;
		Task(int k , int l ){
			this.start = k;
			this.end = l;
		}
		
		@Override
		protected Integer compute() {
			// TODO Auto-generated method stub
			
			if(end-start < 10000){
				int sum = 0;
				for(int i=start; i<end; i++) sum += num[i];
                return sum;
			}else{
				Task t1 = new Task(start, start + (end-start)/2);
				Task t2 = new Task(start + (end-start)/2, end);
				t1.fork();
				t2.fork();
				return t1.join()  + t2.join();
			}
			
		}
 
		
	}
	
}
