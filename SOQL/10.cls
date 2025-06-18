public class Demo {
    public static void main() {
        List<sObject> objList = [SELECT Name, Type
                                 FROM Account
                                 WHERE Type IN ('Customer - Channel', 'Partner', 'Customer - Direct')
                                ];
        
        for(sObject obj : objList) {
            System.debug(obj);
        }
    }
}

