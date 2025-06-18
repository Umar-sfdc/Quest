public class Demo {
    public static void main() {
        List<sObject> objList = [SELECT Name, Industry, AnnualRevenue
                                 FROM Account 
                                 WHERE Industry IN ('Technology', 'Banking') 
                                 AND AnnualRevenue >= 500000
                                ];
        
        for(sObject obj : objList) {
            System.debug(obj);
        }
    }
}

