import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class Test {
    Lock lock = new ReentrantLock(true);
	
	void m(){
		for(int i=0; i<10; i++) {
			 lock.lock();
			 try{
	            System.out.println(Thread.currentThread().getName() + "  abc  "  + i);
	            
	            
			 }finally{
	                lock.unlock();
	         }
	    }
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

       //BlockingQueue<Thread> queue = new LinkedBlockingQueue<>();
		
	   List<Thread> queue = new ArrayList<>();
	   
       queue.add(new Thread(()->{ System.out.println(Thread.currentThread().getName());},"A..."));
       queue.add(new Thread(()->{ System.out.println(Thread.currentThread().getName());},"B..."));
       queue.add(new Thread(()->{ System.out.println(Thread.currentThread().getName());},"C..."));
       
       
       for(int i=0; i<3; i++) {
			
	    	Thread t = null;
			t = queue.get(i);
	    	
			t.start();
			while (t.isAlive());
	   }
      
         
	}

}
