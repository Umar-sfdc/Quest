@isTest
private class TestWellnessJourneyRewardsBatch {

    // Success mock implementation
    private class MockSuccess implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            res.setBody('{"status":"success"}');
            res.setStatusCode(200);
            return res;
        }
    }

    // Failure mock implementation (throws an exception)
    private class MockFailure implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            throw new CalloutException('Simulated callout failure');
        }
    }

    @isTest
    static void testBatchWithRewardsCallout_Success() {
        Test.setMock(HttpCalloutMock.class, new MockSuccess());

        User testUser = [SELECT Id FROM User WHERE Profile.Name = 'System Administrator' LIMIT 1];

        System.runAs(testUser) {
            List<Wellness_Journey__c> journeys = new List<Wellness_Journey__c>();
            Date completionDate = Date.today().addMonths(-2); // Previous quarter

            for (Integer i = 0; i < 12; i++) {
                journeys.add(new Wellness_Journey__c(
                    Name = 'Journey ' + i,
                    OwnerId = testUser.Id,
                    Status__c = 'Complete',
                    Completion_Date__c = completionDate
                ));
            }
            insert journeys;

            Test.startTest();
            Database.executeBatch(new WellnessJourneyRewardsBatch(), 20); // batch size > records
            Test.stopTest();
        }
    }

    @isTest
    static void testBatchWithRewardsCallout_Exception() {
        Test.setMock(HttpCalloutMock.class, new MockFailure());

        User testUser = [SELECT Id FROM User WHERE Profile.Name = 'System Administrator' LIMIT 1];

        System.runAs(testUser) {
            List<Wellness_Journey__c> journeys = new List<Wellness_Journey__c>();
            Date completionDate = Date.today().addMonths(-2); // Previous quarter

            for (Integer i = 0; i < 12; i++) {
                journeys.add(new Wellness_Journey__c(
                    Name = 'Journey ' + i,
                    OwnerId = testUser.Id,
                    Status__c = 'Complete',
                    Completion_Date__c = completionDate
                ));
            }
            insert journeys;

            Test.startTest();
            Database.executeBatch(new WellnessJourneyRewardsBatch(), 20);
            Test.stopTest();
        }
    }
}
___________________________________________________________________________
