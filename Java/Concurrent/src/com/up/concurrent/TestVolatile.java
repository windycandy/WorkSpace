package com.up.concurrent;

import java.util.concurrent.TimeUnit;

/*
 * 
 */


public class TestVolatile {
    boolean running = true; //对比一下有无volatile的情况下，整个程序运行结果的区别
    void m() {
        System.out.println("m start");
        while(running) {
        }
        System.out.println("m end!");
    }
    
    public static void main(String[] args) {
    	TestVolatile t = new TestVolatile();
        
        new Thread(t::m, "t1").start();
        
        try {
            TimeUnit.SECONDS.sleep(1);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        
        t.running = false;
    }

}
