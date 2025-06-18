public class Demo {
    public static void main() {
        List<sObject> objList = [SELECT Name, AnnualRevenue
                                 FROM Account
                                 WHERE AnnualRevenue != NUll
                                 ORDER BY AnnualRevenue DESC
                                 
                                ];
        
        for(sObject obj : objList) {
            System.debug(obj);
        }
    }
}

