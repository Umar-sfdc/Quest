public class Demo {
    public static void main() {
        List<sObject> objList = [SELECT Name
FROM Account
WHERE Name LIKE '%Global%'
                                ];
        
        for(sObject obj : objList) {
            System.debug(obj);
        }
    }
}

