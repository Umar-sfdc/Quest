@isTest

public class OrderTests {


    @testSetup

    public static void SetupTestData(){

        

        TestDataFactory.InsertTestData(5);   

    }



    static testmethod void OrderUpdate_UnitTest (){

        test.startTest();

        Order rec = [select id, Status from Order limit 1];

        Product2 prod = [SELECT Family,Id,Name,Quantity_Ordered__c,Quantity_Remaining__c FROM Product2 limit 1];

        system.debug('kkk '+prod.Quantity_Ordered__c);

        rec.status = constants.ACTIVATED_ORDER_STATUS;

        Update rec;

        Product2 updatedprod = [SELECT Family,Id,Name,Quantity_Ordered__c,Quantity_Remaining__c FROM Product2 limit 1];

        

        system.debug('kkk '+updatedprod.Quantity_Ordered__c);

        TestDataFactory.VerifyQuantityOrdered(prod,updatedprod,constants.DEFAULT_ROWS);

         Test.stopTest();

    }

}
