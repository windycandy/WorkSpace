import java.util.ArrayList;
import java.util.List;


public class TestGeneric {

	public static void main(String[] args) {
		
		List<String> arrayList = new ArrayList<>();
		arrayList.add("aaaa");
		//arrayList.add(100);

		for(int i = 0; i< arrayList.size();i++){
		    String item = (String)arrayList.get(i);
		    System.out.println("泛型测试" + " item = " + item);
		}
		
		
		
		
		List<String> stringArrayList = new ArrayList<String>();
		List<Integer> integerArrayList = new ArrayList<Integer>();

		Class classStringArrayList = stringArrayList.getClass();
		Class classIntegerArrayList = integerArrayList.getClass();

		System.out.println("classStringArrayList = " + classStringArrayList);
		System.out.println("classIntegerArrayList = " + classIntegerArrayList);
		
		if(classStringArrayList.equals(classIntegerArrayList)){
			System.out.println("泛型测试"+"类型相同");
		}
		

		
		
		Generic<Integer> genericInteger = new Generic<Integer>(123456);
		Generic<String> genericString = new Generic<String>("key_vlaue");
		
		System.out.println("genericInteger = " + genericInteger.getClass());
		System.out.println("genericString = " + genericString.getClass());
		
		System.out.println("泛型测试"+" key is " + genericInteger.getKey());
		System.out.println("泛型测试"+" key is " + genericString.getKey());
		
		
	}

}



 class Generic<T>{ 
    //key这个成员变量的类型为T,T的类型由外部指定  
    private T key;

    public Generic(T key) { //泛型构造方法形参key的类型也为T，T的类型由外部指定
        this.key = key;
    }

    public T getKey(){ //泛型方法getKey的返回值类型为T，T的类型由外部指定
        return key;
    }
}