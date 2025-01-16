# Advanced and Beginner Questions on Apex Collection Data Types

### 1. **Employee Directory**
Your company wants to maintain an alphabetical list of employee names. 
- **Task:** Write an Apex method to:
  - Add names to the list.
  - Ensure no duplicates exist.
  - Sort the list alphabetically.

---

### 2. **Inventory Tracker**
A warehouse needs a Set to store unique product IDs.
- **Task:**
  - Dynamically add new product IDs as they arrive.
  - Verify if a specific product ID is already in stock.

---

### 3. **City Populations**
Build a Map where city names are keys, and their populations are values.
- **Task:**
  - Add a new city.
  - Retrieve its population.
  - Delete outdated entries.

---

### 4. **Contact Validator**
You’ve been tasked to clean up a List of Contact records.
- **Task:** Remove any Contact that doesn’t have a valid email address and return the cleaned List.

---

### 5. **Student ID Organizer**
A school stores unique student IDs in a Set.
- **Task:** Convert the Set into a List, sort it in descending order, and return the sorted List.

---

### 6. **Account Lookup**
Query all Account records and store their Ids and Names in a Map.
- **Task:** Iterate through the Map and print each Account’s details.

---

### 7. **Department Check**
An HR system stores department names as keys and employee counts as values in a Map.
- **Task:** Write a method to verify if a department exists in the Map.

---

### 8. **Skill Filter**
A company has a List of employee skill names.
- **Task:** Remove all skill names shorter than 3 characters and return the updated List.

---

### 9. **Milestone Tracker**
Your team maintains a List of project milestones.
- **Task:** Write a method to clone the List so you can test updates without modifying the original.

---

### 10. **Opportunity Sorting**
A sales team wants a List of Opportunity objects sorted by their "Amount" field.
- **Task:** Write the sorting logic to arrange the List in ascending order.

---

### 11. **Category Pricing**
A store categorizes products by type and stores prices in a Map.
- **Task:**
  - The Map uses the category as the key and a List of prices as the value.
  - Write a method to calculate the average price of all products in a specific category.

---

### 12. **Regional Management**
A logistics system tracks regions and their cities in a nested Map.
- **Task:**
  - Add, update, or delete city population data within specific regions.

---

### 13. **Recent Accounts**
Sort a List of Account records by their "CreatedDate" field in descending order.
- **Task:** Use a custom Comparator to implement the sorting logic.

---

### 14. **Contact Name Updater**
A CRM system allows bulk updates to Contact records.
- **Task:** Write a method that:
  - Uses a Map of Contact Ids to new LastNames.
  - Updates the records.
  - Ensures only valid updates are processed.

---

### 15. **Employee Salary Merge**
Two payroll systems store employee IDs and their salaries in separate Maps.
- **Task:**
  - Merge these Maps.
  - Resolve conflicts when the same employee ID exists with different salary values.

---

### 16. **Number Filter**
Given a List of integers:
- **Task:** Return only the even numbers.
  - **Hint:** Use Apex’s `mod` operator and filter logic.

---

### 17. **Product Inventory**
A retailer maintains a Set of custom Product objects to avoid duplicates.
- **Task:** Implement `equals()` and `hashCode()` in the Product class to support Set operations.

---

### 18. **Bulk Contact Creation**
A new policy requires creating Contact records for every active Account.
- **Task:**
  - Query all active Accounts.
  - Associate multiple Contacts with each Account in bulk.

---

### 19. **Dynamic Account Query**
Write a method that accepts a user-defined limit.
- **Task:** Retrieve that many Account records using a dynamic SOQL query and store the results in a List.

---

### 20. **Opportunity Analysis**
Analyze sales data by querying all Opportunities.
- **Task:**
  - Group them by Account.
  - Calculate the total Opportunity amount for each Account.
  - Store the results in a Map with Account Id as the key and total Opportunity amount as the value.
  - **Hint:** Use `AggregateResult` in your SOQL query.
