# Mastering SOQL Through a Story - 20 Questions from Simple to Complex

### Chapter 1: The Foundation

1. **Setting the Stage**
   - You are tasked with fetching all the records from the `Account` object. How will you write the SOQL query for this?

   ```sql
   -- Fetch all Account records
   SELECT ... FROM Account
   ```

2. **Discovering Fields**
   - Your manager asks you to display the `Name`, `Industry`, and `AnnualRevenue` fields from all `Account` records. Can you build this query?

3. **Adding Filters**
   - The company wants to identify accounts in the `Banking` industry. Modify the query to filter accounts with `Industry = 'Banking'`.

4. **Working with Operators**
   - Filter the accounts that have `AnnualRevenue` greater than 1,000,000.

5. **Sorting the Results**
   - Display accounts in descending order of their `AnnualRevenue`. How will you achieve this?

### Chapter 2: Expanding the Horizons

6. **Limiting Results**
   - Fetch only the top 5 accounts with the highest `AnnualRevenue`. What will your query look like?

7. **Combining Filters**
   - Display accounts in the `Technology` or `Banking` industry and with `AnnualRevenue` greater than 5,000,000.

8. **Using NULL Filters**
   - Find accounts where the `Industry` field is not populated. What will you write?

9. **Working with LIKE**
   - Fetch accounts whose `Name` starts with the word “Global”.

10. **Using IN**
    - Display accounts with `Type` either as `Customer - Direct`, `Customer - Channel`, or `Partner`.

### Chapter 3: Relationships Unveiled

11. **Parent-to-Child Relationship**
    - Retrieve all `Account` records along with their related `Contact` records. Write a query to include `Contact.Name` and `Contact.Email`.

12. **Child-to-Parent Relationship**
    - Fetch all `Contact` records with the `Account.Name` and `Account.Industry`. What will this query look like?

13. **Nested Queries**
    - Display accounts along with the names of contacts where the contact's `Email` contains "example.com".

### Chapter 4: Advanced Filters and Functions

14. **Aggregate Functions**
    - Calculate the total `AnnualRevenue` of all accounts. Write the query to sum up this field.

15. **Grouping Data**
    - Group accounts by `Industry` and calculate the average `AnnualRevenue` for each industry.

16. **Having Clause**
    - Display industries where the average `AnnualRevenue` exceeds 10,000,000. How will you write this?

### Chapter 5: Becoming the Pro

17. **Using Subqueries**
    - Fetch accounts that do not have any contacts associated with them. Write the SOQL query using subqueries.

18. **Complex Filters**
    - Find contacts where the parent account has `Industry` as `Banking` and `AnnualRevenue` greater than 20,000,000.

19. **Dynamic SOQL**
    - Write a query that dynamically selects fields from the `Account` object based on a list of field names provided at runtime. How will you implement this?

20. **Big Data Optimization**
    - You need to retrieve 50,000+ records from the `Opportunity` object. Design a query that handles this scenario efficiently.

---

