public class Demo {
    public static void main() {
        List<sObject> objList = [SELECT Id, Name, Industry, AnnualRevenue
                                 FROM Account
                                 WHERE Industry = 'Banking'];
        
        for(sObject obj : objList) {
			System.debug(obj);
        }
    }
}
