package test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

class WakenUpEvent{
	long time;
	String loc;
	
	public WakenUpEvent(long time, String loc) {
		super();
		this.time = time;
		this.loc = loc;
	}
	
	public long getTime() {
		return time;
	}
	
	public void setTime(long time) {
		this.time = time;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}

}


class Child implements Runnable{
	//StateChangeLisener lisener;// = new StateChangeLisener();
	private List<StateChangeLisener> stateChangeLisener = new ArrayList<StateChangeLisener>();
	
	public Child(StateChangeLisener lisener) {
		super();
		//this.lisener = lisener;
		stateChangeLisener.add(lisener);
	}

	@Override
	public void run() {
         try {
			TimeUnit.SECONDS.sleep(5);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
        Wakeup(); 
	}

	private void Wakeup() {
		System.out.println("bady wake up ....");
		//lisener.doSomething(new WakenUpEvent(System.currentTimeMillis(),"bad"));
		
		for(int i = 0 ; i < stateChangeLisener.size()  ; i++){
			StateChangeLisener m = stateChangeLisener.get(i);
			m.doSomething(new WakenUpEvent(System.currentTimeMillis(),"dad"));
		}
		
	}
}



class Dad implements StateChangeLisener{

	@Override
	public void doSomething(WakenUpEvent event) {
		// TODO Auto-generated method stub
		System.out.println("Dad do some thing ....");
	}
	
}



interface StateChangeLisener{
	public void doSomething(WakenUpEvent event);
}


class PropertyMgr {
	private static Properties props = new Properties();
	
	static {
		try {
			props.load(Obersver.class.getClassLoader().getResourceAsStream("system.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getProperty(String key) {
		return props.getProperty(key);
	}
}


public class Obersver {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Dad d = new Dad();
        Child c = new  Child(d);
        new Thread(c).start();
        
        String[] observers = PropertyMgr.getProperty("observers").split(",");
        for(String s : observers) {
        	try {
				System.out.println(Class.forName(s));
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
	}
}
