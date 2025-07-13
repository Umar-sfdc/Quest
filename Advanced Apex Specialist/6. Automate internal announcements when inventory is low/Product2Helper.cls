public class Product2Helper {

    /**
     * @name COLLABORATION_GROUP
     * @description List of CollaborationGroup used in both business and test logic
    **/
    static List<CollaborationGroup> COLLABORATION_GROUP = [
        SELECT Id
        FROM CollaborationGroup
        //WHERE Name = 'group name'
        WHERE Name = :Constants.INVENTORY_ANNOUNCEMENTS
        OR Name = :('TEST'+Constants.INVENTORY_ANNOUNCEMENTS)
        LIMIT 1
    ];

    /**
     * @name afterUpdate
     * @description called by product2 Trigger on After Update
     * @param List<Product2> newList
     * @param List<Product2> oldList
    **/
    public static void AfterUpdate(List<Product2> newList){
//        public static void AfterUpdate(List<Product2> newList, List<Product2> oldList){
        
        List<Product2> needsAnnouncement = new List<Product2>();
        
        Map<String, Inventory_Setting__mdt> records = 
            new Map<String, Inventory_Setting__mdt>();

        List<Inventory_Setting__mdt> inventorySettings = [SELECT Label, Low_Quantity_Alert__c FROM Inventory_Setting__mdt];
        for(Inventory_Setting__mdt inventorySetting:inventorySettings){
            records.put(inventorySetting.Label,inventorySetting);
        }
        
        for(Integer i=0;i<newList.size();i++){
            Inventory_Setting__mdt inventorySetting = 
                    (Inventory_Setting__mdt)records.get(newList[i].Family);
            Integer alertQuantity = (Integer)inventorySetting.Low_Quantity_Alert__c;
            
            if( newList[i].Quantity_Remaining__c <= alertQuantity ){
                   needsAnnouncement.add(newList[i]);
               }
            
            /*(if( newList[i].Quantity_Remaining__c <= alertQuantity && 
               oldList[i].Quantity_Remaining__c > alertQuantity){
                   needsAnnouncement.add(newList[i]);
               }*/
        }
        
        PostAlerts(needsAnnouncement);
        
        
        //ToDo: Declare a List of Product2 records named needsAnnouncement

        //ToDo: Declare a Map of Strings to Inventory_Setting__mdt records

        //ToDo: Loop through a query of Inventory_Setting__mdt records and populate the Map with Name as the key

        //ToDo: Loop through the Products in newList
        // Use the corresponding Inventory Setting record to determine the correct Low Quantity Alert
        // If the Product's Quantity Remaining has been changed to less than the Low Quantity Alert
        //      add it to the needsAnnouncement list

        //ToDo: Pass records to the postAlerts method
    }

    /**
     * @name postAlerts
     * @description called by product2 Trigger on After Update
     * @param List<Product2> productList
    **/
    public static void PostAlerts(List<Product2> productList){
        List<ConnectApi.AnnouncementInput> toPost = new List<ConnectApi.AnnouncementInput>();
        for ( Product2 p : productList ){
            
            ConnectApi.AnnouncementInput announcement = 
                new ConnectApi.AnnouncementInput();
            ConnectApi.MessageBodyInput messageBodyInput = 
                new ConnectApi.MessageBodyInput();
            
            List<ConnectApi.MessageSegmentInput> messageSegmentInput = 
                new List<ConnectApi.MessageSegmentInput>();
            
            ConnectApi.TextSegmentInput bodySegmentInput = new ConnectApi.TextSegmentInput();
            bodySegmentInput.text = p.Name + ' ' + Constants.INVENTORY_LEVEL_LOW;
            messageSegmentInput.add(bodySegmentInput);
            messageBodyInput.messageSegments = messageSegmentInput;
            
            announcement.parentId = COLLABORATION_GROUP.get(0).Id;
            announcement.sendEmails = false;
            announcement.expirationDate = System.today()+1;
            announcement.body = messageBodyInput;
            
            toPost.add(announcement);

            // ToDo: Construct a new AnnouncementInput for the Chatter Group so that it:
            // expires in a day
            // does not notify users via email.
            // and has a text body that includes the name of the product followed by the INVENTORY_LEVEL_LOW constant
        }
        AnnouncementQueueable announcementQueuable = new AnnouncementQueueable(toPost);
//        announcementQueuable.toPost = toPost;
        
        Id jobId = System.enqueueJob(announcementQueuable);
        
        // ToDo: Create and enqueue an instance of the announcementQueuable class with the list of Products
    }
}
