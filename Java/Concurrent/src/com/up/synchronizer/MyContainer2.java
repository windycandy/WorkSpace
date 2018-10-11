package com.up.synchronizer;

import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class MyContainer2 <T> {
	
	private static int MAX = 10;
	private int i = 0;
	LinkedList<T> mlist = new LinkedList<>();
	
	Lock lock = new ReentrantLock();
	Condition p = lock.newCondition();
	Condition c = lock.newCondition();
	
	void put(T t){
		lock.lock();
		try{
			while(mlist.size() == MAX){
				try {
					p.await();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}			 
			}
			mlist.add(t);
			c.signalAll();
			i++;
		}finally{
			lock.unlock();
		}
	}
	
	T get(){
		T temp = null;
		lock.lock();
		try{
			while(mlist.size() == 0){
                try {
				c.await();
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			temp = mlist.removeFirst();
			p.signalAll();
			i--;
		}finally{
			lock.unlock();
		}
		return temp;
	}
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MyContainer2<String> c = new MyContainer2<>();
		
		for(int j =0 ; j < 10 ; j++){
			new Thread(()->{System.out.println(c.get());},"cusumer ").start();
		}
		for(int i =0; i < 2 ; i ++){
			new Thread(()->{
				for(int j=0; j<25; j++) {
					c.put(Thread.currentThread().getName() + " " + j);
				}
			},"producter " + i).start();
		}
	}

}
