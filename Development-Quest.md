# **`Salesforce Triggers Problems`**

---

### **🟩 Q18: Create a Task When Opportunity Stage Changes**

**🧠 Story:** Whenever an Opportunity moves from `"Qualification"` to `"Proposal"`, a follow-up task must be created automatically.

**🎯 Problem Statement:**  
 Write an `after update` trigger to detect stage transition and create a follow-up Task.

---

### **🟩 Q19: Auto-Generate Custom Unique Code for New Records**

**🧠 Story:** Your org uses a custom object `Asset__c`, and every time a record is created, it must be assigned a unique `Asset_Code__c` (e.g., ASSET-001, ASSET-002...).

**🎯 Problem Statement:**  
 Write a trigger to auto-generate an incrementing code for each new `Asset__c` record using a custom setting or custom metadata to store the last used number.

---

### **🟩 Q20: Auto-Close Tasks Older Than 30 Days**

**🧠 Story:** Tasks that remain open for more than 30 days are considered stale and should be marked as `Status = Completed`.

**🎯 Problem Statement:**  
 Write a `before update` trigger that automatically updates Tasks older than 30 days and still open, to mark them as completed.

---

## 

## 

## **🟢 Beginner Level – Set 3 (Q21 to Q30)**

---

### **🟩 Q21: Prevent Changing Account Type from 'Customer' to 'Prospect'**

**🧠 Story:** Once an Account becomes a Customer, it should never be changed back to a Prospect.

**🎯 Problem Statement:**  
 Write a `before update` trigger to block the update if the old value of `Type = Customer` and the new value is `Prospect`.

---

### 

### **🟩 Q22: Validate Email Domain for Lead**

**🧠 Story:** The business only accepts leads with corporate emails and wants to block common domains like gmail.com, yahoo.com, etc.

**🎯 Problem Statement:**  
 Write a `before insert` trigger to validate the `Email` field and throw an error if it contains a personal domain.

---

### **🟩 Q23: Send Custom Notification on Big Deals**

**🧠 Story:** Executives want to get notified via a custom notification whenever an Opportunity over $500,000 is created.

**🎯 Problem Statement:**  
 Write an `after insert` trigger to send a custom notification using the `Messaging` class for big deals.

---

### **🟩 Q24: Auto-Fill Country Based on State**

**🧠 Story:** Users often forget to fill the Country on the Contact. If the State is Maharashtra, Gujarat, or Rajasthan, auto-fill the Country as India.

**🎯 Problem Statement:**  
 Write a trigger that auto-fills the `Country` field based on known `State` values during insert/update.

---

### **🟩 Q25: Prevent Update to Closed Opportunities**

**🧠 Story:** Auditors have reported that closed Opportunities are being edited by mistake. You need to stop this.

**🎯 Problem Statement:**  
 Write a `before update` trigger that prevents any field changes if `StageName = Closed Won` or `Closed Lost`.

---

### 

### 

### **🟩 Q26: Assign Contact to Account Automatically**

**🧠 Story:** Contacts are created without linking to Accounts. If a Contact’s email domain matches an Account’s website, assign it to that Account.

**🎯 Problem Statement:**  
 Write a trigger that links a Contact to an Account by matching the `Email` domain to the `Website` of an Account.

---

### **🟩 Q27: Clone Custom Object on Status Change**

**🧠 Story:** On a custom object `Job__c`, when status changes from `"Open"` to `"Reopened"`, create a new cloned record for tracking.

**🎯 Problem Statement:**  
 Write a trigger that clones the `Job__c` record when the status is set to `"Reopened"`.

---

### **🟩 Q28: Prevent Deletion of Accounts with Opportunities**

**🧠 Story:** Users tried to delete Accounts that have active Opportunities. This should be blocked.

**🎯 Problem Statement:**  
 Write a `before delete` trigger to prevent Account deletion if related Opportunities exist.

---

### **🟩 Q29: Auto-Update Lead Score Based on Industry**

**🧠 Story:** Leads from Healthcare industry are considered premium. Such leads should have a `Score__c = 90`.

**🎯 Problem Statement:**  
 Write a `before insert` and `before update` trigger to update `Score__c` based on `Industry`.

---

### **🟩 Q30: Limit Number of Contacts per Account**

**🧠 Story:** To prevent crowding, the business allows only 5 Contacts per Account.

**🎯 Problem Statement:**  
 Write a `before insert` trigger that counts existing Contacts for the Account and throws an error if it exceeds 5\.

---

Great\! Let’s now level up your journey with **Intermediate Level Salesforce Trigger Questions (Q31–Q60)**. These questions will involve **cross-object logic, recursion handling, bulk-safe design, error handling, record relationships**, and more — everything you’d be expected to handle as a **Salesforce developer with 3 years of experience**.

---

## **🟠 Intermediate Level – Set 1 (Q31 to Q40)**

---

### **🟧 Q31: Auto Assign Opportunity Owner from Account Owner**

**🧠 Story:** Sales managers want every new Opportunity created under an Account to automatically be assigned to the **Account Owner**, regardless of who created it.

**🎯 Problem Statement:**  
 Write a **before insert** trigger that sets the Opportunity `OwnerId` to its related `Account.OwnerId`. Ensure it works in bulk.

---

### **🟧 Q32: Restrict Contact Creation if Account is Inactive**

**🧠 Story:** The client deactivates Accounts using a checkbox `Is_Active__c`. Users should not be able to create Contacts under such Accounts.

**🎯 Problem Statement:**  
 Write a `before insert` trigger to prevent Contact creation if `Account.Is_Active__c = false`.

---

### **🟧 Q33: Prevent Recursive Updates on Tasks**

**🧠 Story:** A trigger on `Task` updates related records, which in turn can trigger Task updates again, causing recursion.

**🎯 Problem Statement:**  
 Write a Task trigger with a **static Boolean variable** to prevent infinite recursion.

---

### **🟧 Q34: Auto Create Contact from Lead on Conversion**

**🧠 Story:** When a Lead is converted, the standard process creates a Contact. But the client wants to **create a child Contact manually with extra fields** copied from the Lead.

**🎯 Problem Statement:**  
 Write an `after update` trigger on Lead that checks for `IsConverted = true` and creates a Contact with `Custom_Notes__c` and `Region__c` fields copied from the Lead.

---

### **🟧 Q35: Create Case When Account is Flagged Risky**

**🧠 Story:** If an Account is marked as `Risk_Level__c = High`, create a Case automatically assigned to the Risk team.

**🎯 Problem Statement:**  
 Write an `after update` trigger on Account that inserts a new Case record assigned to a specific queue/user when `Risk_Level__c` is updated to `"High"`.

---

### **🟧 Q36: Update Open Opportunities When Account Name Changes**

**🧠 Story:** For data consistency, when an Account's `Name` is updated, all open Opportunities should reflect that name in a custom field `Account_Name__c`.

**🎯 Problem Statement:**  
 Write an `after update` trigger on Account to update all **open** Opportunities with the new name, ensuring bulk-safe logic.

---

### **🟧 Q37: Prevent Inactive Users from Creating Records**

**🧠 Story:** Some users have been marked `IsActive = false` in the User table. They shouldn’t be allowed to create Opportunities via integrations or external scripts.

**🎯 Problem Statement:**  
 Write a trigger that checks the `CreatedById` on insert and prevents record creation if the user is inactive.

---

### **🟧 Q38: Calculate Total Order Amount from Order Line Items**

**🧠 Story:** An `Order__c` object has child `Order_Line_Item__c` records. On insert or update of a line item, recalculate the parent’s `Total_Amount__c`.

**🎯 Problem Statement:**  
 Write an `after insert` and `after update` trigger on `Order_Line_Item__c` to calculate the sum of all related line items and update `Order__c.Total_Amount__c`.

---

### **🟧 Q39: Auto Add Case Team on New Case Creation**

**🧠 Story:** For high-priority Cases, a specific team of agents must be automatically added to the Case Team.

**🎯 Problem Statement:**  
 Write an `after insert` trigger that adds predefined Users to the Case Team if `Priority = High`.

---

### **🟧 Q40: Track Opportunity Stage History in Custom Object**

**🧠 Story:** Management wants to track every Opportunity stage change in a custom object `Stage_Change_History__c`.

**🎯 Problem Statement:**  
 Write an `after update` trigger to insert a new record in `Stage_Change_History__c` whenever the `StageName` of an Opportunity is changed.

---

## 

## **🟠 Intermediate Level – Set 2 (Q41 to Q50)**

---

### **🟧 Q41: Clone Product When Price Changes**

**🧠 Story:** Product managers want to retain price history. If a `Product__c.Price__c` is updated, clone the record with new price and mark the original as `Inactive`.

**🎯 Problem Statement:**  
 Write an `after update` trigger that clones `Product__c` when the price is changed and sets the original record’s `Status__c = "Inactive"`.

---

### **🟧 Q42: Avoid Mixed DML Error on User & Permission Update**

**🧠 Story:** You’re updating a User record and assigning it a Permission Set. DML fails due to Mixed DML error.

**🎯 Problem Statement:**  
 Design a trigger pattern using **future method** to assign the permission set to the User to avoid Mixed DML error.

---

### **🟧 Q43: Track Who Changed Account’s Rating**

**🧠 Story:** The client wants to track **who changed** the `Rating` field on Account and **what was the old and new value**.

**🎯 Problem Statement:**  
 Write an `after update` trigger to insert a record in a custom object `Account_Rating_History__c` with fields: `AccountId`, `Old_Value__c`, `New_Value__c`, `Changed_By__c`.

---

### **🟧 Q44: Dynamic Field Update Based on Record Type**

**🧠 Story:** On custom object `Application__c`, based on its `RecordType`, different fields should auto-populate.

**🎯 Problem Statement:**  
 Write a `before insert` trigger that checks RecordType and sets values for `Status__c`, `Priority__c`, and `Region__c` accordingly.

---

### **🟧 Q45: Prevent Cloning a Closed Case**

**🧠 Story:** The support team sometimes clones a Case to reuse details. But cloning a **Closed** case should be restricted.

**🎯 Problem Statement:**  
 Write a `before insert` trigger that checks if `Cloned_From__c` (lookup to Case) points to a Closed Case. If yes, block the creation.

---

### **🟧 Q46: Alert Manager When Multiple Opportunities Are Lost**

**🧠 Story:** If a sales rep loses more than 3 Opportunities in a week, their manager should get an alert.

**🎯 Problem Statement:**  
 Write an `after update` trigger that counts lost opportunities grouped by `OwnerId` and sends an alert to the manager if the count exceeds 3 in the last 7 days.

---

### **🟧 Q47: Merge Duplicate Contacts Automatically**

**🧠 Story:** When a new Contact is created with an email already existing in the system, merge the two records programmatically.

**🎯 Problem Statement:**  
 Write an `after insert` trigger that checks for duplicate emails and merges Contacts using the `Database.merge()` method.

---

### **🟧 Q48: Sync Custom Object to External System**

**🧠 Story:** When a new `Project__c` is created, it should sync with an external ERP system via a callout.

**🎯 Problem Statement:**  
 Write an `after insert` trigger that calls a future method to sync Project data to an external system.

---

### **🟧 Q49: Create Chatter Post When Big Deal is Won**

**🧠 Story:** Management loves celebration\! When an Opportunity worth more than 1M is Closed Won, post a Chatter message tagging the owner.

**🎯 Problem Statement:**  
 Write an `after update` trigger to post a Chatter message using `FeedItem` when an Opportunity crosses the threshold and is marked as Won.

---

### **🟧 Q50: Auto Create Related Records Based on Picklist**

**🧠 Story:** When a `Customer_Type__c = "Corporate"` is selected on Account, 2 related child records (`Agreement__c`) must be created.

**🎯 Problem Statement:**  
 Write an `after insert` and `after update` trigger to create Agreements if the customer type is Corporate.

---

Perfect\! Here's the final set of **Intermediate-Level Questions (Q51–Q60)** in the same **story \+ problem statement** format, tailored for someone with **3 years of Salesforce development experience**, helping you prepare for real-world challenges.

---

## **🟠 Intermediate Level – Set 3 (Q51 to Q60)**

---

### **🟧 Q51: Auto Update Related Contacts' Department**

**🧠 Story:** When the `Department__c` field on an Account is updated, all related Contacts should reflect the same department for alignment.

**🎯 Problem Statement:**  
 Write an `after update` trigger on Account that updates `Department__c` field on all related Contact records with the new department value. Make sure it's bulk-safe.

---

### **🟧 Q52: Lock a Case When Escalated**

**🧠 Story:** Escalated Cases should no longer be editable by support agents unless they are managers.

**🎯 Problem Statement:**  
 Write an `after update` trigger that sets a `Record_Locked__c = true` flag when `Status = Escalated`. Later, use validation rule \+ profile logic to restrict access.

---

### **🟧 Q53: Assign Follow-Up Task When Case is Closed**

**🧠 Story:** When a Case is Closed, a follow-up Task should automatically be created for the agent to ensure post-case service.

**🎯 Problem Statement:**  
 Write an `after update` trigger on Case that inserts a new Task with Subject "Follow-up", Due Date \= Today \+ 3 days, and assigned to the Case Owner.

---

### **🟧 Q54: Stop Product Update if Quoted**

**🧠 Story:** If a Product is already quoted in an Opportunity Line Item, users should not be able to modify its price.

**🎯 Problem Statement:**  
 Write a `before update` trigger that checks if a Product is linked to any OpportunityLineItem. If yes, and Price changed, throw an error.

---

### **🟧 Q55: Sync Account’s Primary Contact**

**🧠 Story:** Each Account has a lookup to a `Primary_Contact__c`. When the related Contact’s Phone or Email changes, it should update the Account.

**🎯 Problem Statement:**  
 Write an `after update` trigger on Contact that finds related Accounts and updates the `Primary_Contact_Phone__c` and `Primary_Contact_Email__c` fields.

---

### **🟧 Q56: Auto-Create Weekly Timesheet Entry**

**🧠 Story:** Employees log their hours weekly. When a new Employee record is created, the system should create a Timesheet record for the current week.

**🎯 Problem Statement:**  
 Write an `after insert` trigger on `Employee__c` that creates a `Timesheet__c` record with Week\_Start\_Date \= this Monday.

---

### **🟧 Q57: Notify Manager When High Priority Lead Created**

**🧠 Story:** When a Lead with `Rating = Hot` is created, the assigned User’s manager should receive a notification email.

**🎯 Problem Statement:**  
 Write an `after insert` trigger on Lead that queries the `User.ManagerId` and sends an email alert using `Messaging.sendEmail()`.

---

### **🟧 Q58: Update Related Child Records When Parent Field Is Nullified**

**🧠 Story:** When a field `Is_Eligible__c` on Account is set to `false`, the related `Benefit__c` records should also be disabled.

**🎯 Problem Statement:**  
 Write an `after update` trigger on Account that updates `Is_Active__c = false` on all related Benefit records when `Is_Eligible__c` changes to `false`.

---

### **🟧 Q59: Create Milestone Records for New Project**

**🧠 Story:** When a `Project__c` record is created, 3 default milestone records (`Kickoff`, `Design`, `Delivery`) should be created and linked.

**🎯 Problem Statement:**  
 Write an `after insert` trigger that inserts 3 child `Milestone__c` records with predefined names for every Project created.

---

### **🟧 Q60: Send Slack Notification on New Lead**

**🧠 Story:** Your team uses Slack for internal communication. Every time a new Lead is created, a notification should be sent to Slack with Lead name and Company.

**🎯 Problem Statement:**  
 Write an `after insert` trigger that uses a `@future` method to send a Slack webhook with the Lead details.

---

## **🔴 Advanced Level Salesforce Trigger Questions (Q61–Q100)**

Each question includes a **story-based real-world scenario** followed by a **problem statement**. These are designed for developers with **3+ years of Salesforce experience**, covering performance, recursion handling, complex relationships, and enterprise-level logic.

---

### **🔴 Q61: Multi-Object Trigger – Audit Custom Setting Changes**

**🧠 Story:** Your org uses a custom setting `Config__c` to store feature flags. When any setting value changes, a record of this change must be logged.

**🎯 Problem Statement:**  
 Write a `trigger on Config__c__c` (custom setting) to create a `Change_Log__c` record logging the changed fields, old value, and new value. Ensure it's bulkified and avoids recursion.

---

### **🔴 Q62: Prevent Trigger Recursion for Opportunity Updates**

**🧠 Story:** An `after update` trigger on Opportunity modifies related records, but causes recursion.

**🎯 Problem Statement:**  
 Refactor the Opportunity trigger using a static variable in a handler class to prevent recursion and ensure it only runs once per transaction.

---

### **🔴 Q63: Auto Reassign Opportunities Based on Product Category**

**🧠 Story:** Opportunities with products in "Security" category should be automatically reassigned to a Security Sales Rep.

**🎯 Problem Statement:**  
 Write a trigger that queries OpportunityLineItems, checks the related Product2 category, and updates the Opportunity owner if category is Security.

---

### **🔴 Q64: Create Complex Invoice Hierarchy From Order**

**🧠 Story:** When a new Order is created, it should generate a header Invoice and child line-item Invoices based on OrderItems.

**🎯 Problem Statement:**  
 Write an `after insert` trigger on Order that creates one Invoice\_\_c (header) and multiple child Invoice\_Line\_\_c records based on OrderItems.

---

### **🔴 Q65: Handle Recursive Roll-up Summary on Custom Object**

**🧠 Story:** A `Project__c` object has many `Task__c` child records. When Task status updates, roll-up total completed tasks to Project.

**🎯 Problem Statement:**  
 Create a roll-up summary mechanism using trigger on Task\_\_c to update `Completed_Tasks__c` on Project\_\_c. Prevent infinite loops and bulkify.

---

### **🔴 Q66: Parallel Trigger Execution Management**

**🧠 Story:** A large volume of `Lead` data is inserted via Data Loader. Your trigger logic must handle concurrency and avoid record-lock errors.

**🎯 Problem Statement:**  
 Design a trigger strategy that defers updates using `@future` or Queueable Apex to avoid mixed DML and locking issues.

---

### **🔴 Q67: Update Manager's Dashboard Metrics from Child Activities**

**🧠 Story:** Each time a user completes a Task, their manager’s dashboard metric should be updated.

**🎯 Problem Statement:**  
 Write an `after insert` trigger on Task that queries the owner’s manager and updates a Dashboard\_Metric\_\_c object with daily task count.

---

### **🔴 Q68: Asynchronous Callouts From Trigger**

**🧠 Story:** When a Case is closed, a third-party system must be notified via REST API.

**🎯 Problem Statement:**  
 Trigger on Case should enqueue a Queueable class to perform HTTP callout. Implement exception handling and retries for failed calls.

---

### **🔴 Q69: Dynamic Field Updates Using Metadata Description**

**🧠 Story:** Based on user input in a config record, specific fields on Account should be updated dynamically.

**🎯 Problem Statement:**  
 Write a trigger that reads field names from a Custom Metadata record and dynamically updates those fields using `SObject.put()`.

---

### **🔴 Q70: Maintain Historical Data Snapshot**

**🧠 Story:** When an Opportunity stage changes, a snapshot of the record should be saved to a `Opportunity_History__c` object.

**🎯 Problem Statement:**  
 Create a trigger that captures the entire Opportunity record (clone it) and inserts a historical version when stage changes.

---

### **🔴 Q71: Auto Create Child Records Based on Template Object**

### **🔴 Q72: Deactivate Trigger Temporarily Using Custom Setting**

### **🔴 Q73: Trigger Rollback on External System Failure**

### **🔴 Q74: Complex Trigger Handler Framework With Event Routing**

### **🔴 Q75: Recalculate Custom Forecast Metrics Based on Custom Fields**

### **🔴 Q76: Data Skew and Ownership Management**

### **🔴 Q77: Conditional Recursion for Interrelated Records**

### **🔴 Q78: Dynamic SOQL Filtering for Conditional Trigger Logic**

### **🔴 Q79: Implement Object-Based Trigger Control With Metadata**

### **🔴 Q80: Implement Multi-Language Notification from Trigger**

---

### **🔴 Q81 to Q100 (Complex Real-Time Enterprise-Scale Scenarios)**

* Q81: Orchestrate Multi-Object Trigger Chain With Rollback Support

* Q82: Design and Implement Apex Trigger Logging Framework

* Q83: Trigger-Based Object Archival Strategy

* Q84: Trigger Controlled by User's Role Hierarchy

* Q85: Handle Cross-Object Validation With Trigger

* Q86: Prevent Sensitive Data Changes Using Triggers

* Q87: Trigger for Detecting Duplicate Custom Logic Using Query

* Q88: Trigger That Defers DML and Executes via Platform Event

* Q89: Trigger That Integrates With External BI Tool

* Q90: Trigger That Creates Multiple Child Objects Based on Complex Rules

* Q91: Trigger-Based Budget Control Mechanism

* Q92: Trigger With Apex Scheduler to Cleanup Old Data

* Q93: Trigger That Uses Inherited Abstract Class Structure

* Q94: Trigger Strategy for Multi-Currency Rollups

* Q95: Modular Trigger With Dependency Injection

* Q96: Implement Policy Enforcement via Trigger \+ Flow

* Q97: Control Flow Between Trigger and Flow Execution

* Q98: Design Trigger That Supports Schema Flexibility Across Orgs

* Q99: Centralized Exception and Error Logging in Triggers

* Q100: Multi-Level Recursion Control With Orchestration Pattern

---
