public class Demo {
    public static void main() {
        List<sObject> objList = [SELECT Id, Name, Industry
                                 FROM Account];
        
        for(sObject obj : objList) {
			System.debug(obj);
        }
    }
}
