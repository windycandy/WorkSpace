import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class TestReflection {

	public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		System.out.println(TestReflection.class.getClassLoader().getClass().getName());
		System.out.println(TestReflection.class.getClassLoader().getParent().getClass().getName());
	
		
		System.out.println(String.class.getClassLoader()); // null，   Bootstrp loader获取不到
		
		System.out.println("----------------------------");
		
	    //T t  = new T();
		
		String t = "T";
		Class<?> c = Class.forName(t);
		Method[] Methods = c.getMethods();
		
		Object o = c.newInstance();
		
		for(Method m:Methods){
			//System.out.println(m.getName());
			
			if(m.getName().equals("get")){
			   	 int i = (int) m.invoke(o);
			   	 System.out.println(i);
			}
			
			
			if(m.getName().equals("set")){
				Object[] para = m.getParameterTypes();
				
				//m.invoke(o, 1,2);
				
			   	for(Object p:para){
			   		System.out.println(p);
			   	}
			}
		}
		
	}
}


class T {
	int i = 9 , j;
	
	static
	{
		System.out.println("class T loader");
	}
	
	T(){
		System.out.println("class T init");
	}
	
	public void set (int i, int j ){
		System.out.println("T set invoked");
	}
	
	
	public int get (){
		System.out.println("T get invoked");
		return i +j;
	}
}