import java.util.ArrayList;
import java.util.List;


public class TestGeneric {

	public static void main(String[] args) {
		
		List<String> arrayList = new ArrayList<>();
		arrayList.add("aaaa");
		//arrayList.add(100);

		for(int i = 0; i< arrayList.size();i++){
		    String item = (String)arrayList.get(i);
		    System.out.println("���Ͳ���" + " item = " + item);
		}
		
		
		
		
		List<String> stringArrayList = new ArrayList<String>();
		List<Integer> integerArrayList = new ArrayList<Integer>();

		Class classStringArrayList = stringArrayList.getClass();
		Class classIntegerArrayList = integerArrayList.getClass();

		System.out.println("classStringArrayList = " + classStringArrayList);
		System.out.println("classIntegerArrayList = " + classIntegerArrayList);
		
		if(classStringArrayList.equals(classIntegerArrayList)){
			System.out.println("���Ͳ���"+"������ͬ");
		}
		

		
		
		Generic<Integer> genericInteger = new Generic<Integer>(123456);
		Generic<String> genericString = new Generic<String>("key_vlaue");
		
		System.out.println("genericInteger = " + genericInteger.getClass());
		System.out.println("genericString = " + genericString.getClass());
		
		System.out.println("���Ͳ���"+" key is " + genericInteger.getKey());
		System.out.println("���Ͳ���"+" key is " + genericString.getKey());
		
		
	}

}



 class Generic<T>{ 
    //key�����Ա����������ΪT,T���������ⲿָ��  
    private T key;

    public Generic(T key) { //���͹��췽���β�key������ҲΪT��T���������ⲿָ��
        this.key = key;
    }

    public T getKey(){ //���ͷ���getKey�ķ���ֵ����ΪT��T���������ⲿָ��
        return key;
    }
}