public class Demo {
    public static void main() {
        List<sObject> objList = [SELECT Id, Name, Industry, AnnualRevenue
                                 FROM Account
                                 WHERE Industry = 'Banking' AND AnnualRevenue >= 100000];
        
        for(sObject obj : objList) {
			System.debug(obj);
        }
    }
}
