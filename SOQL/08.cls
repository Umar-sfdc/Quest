public class Demo {
    public static void main() {
        List<sObject> objList = [SELECT Name, Industry 
FROM Account
WHERE Industry = null
                                ];
        
        for(sObject obj : objList) {
            System.debug(obj);
        }
    }
}

