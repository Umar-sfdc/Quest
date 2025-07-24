# SOQL For Admins 

## 2.Create a for loop to iterate through a SOQL query

Write a query to get the name and annual revenue of all accounts. Then use a for loop to iterate through each account, printing the name and annual revenue of each account to the debug log.

-   Create a class
    -   Name: `AccountUtility`
-   Create a method
    -   Name: `viewAnnualRevenue`
    -   Keywords: `public, static,` and `void`
-   Create a list
    -   Name: `accountsList`
-   Create a query and assign the results to a list
    -   Fields: `Account Name` and `Annual Revenue` (Hint: Use API names, not field names or labels)
    -   Object: `Account`
-   Create a for loop that iterates through the query results
    -   Object: `Account`
    -   List name: `accountsList`
    -   For each item, concatenate the account name, followed by a colon, followed by the account’s annual revenue: <_Account Name_\> : <_Annual Revenue_\>
    -   Store the concatenated string in a variable named `acctRev`
    -   Print the `acctRev` variable to the debug log


```java

public class AccountUtility {
	
    public static void  viewAnnualRevenue() {

        List<Account> accountsList = new List<Account>();
        
        accountsList = [SELECT Id, Name, AnnualRevenue 
                        FROM Account
                       	];
    
        for(Account acc : accountsList) {
            String acctRev = acc.Name + ':' + acc.AnnualRevenue;
            System.debug('acctRev' + acctRev);
        }
        
    }
    
}

```

> :bulb: **Tip:** Execute this line in Aynonemous Window `AccountUtility.viewAnnualRevenue();`.




## 4.Create a Relationship Query
Use SOQL to identify properties listed with DreamHouse Realty in the last 30 days.

If you didn’t already install the DreamHouse package and import sample data, follow the instructions at the beginning of this unit to do that now.

Create a Relationship Query

Use SOQL to identify properties listed with DreamHouse Realty in the last 30 days.

If you didn’t already install the DreamHouse package and import sample data, follow the instructions at the beginning of this unit to do that now.

> :warning: **Warning:** Before Attempting this Challange first go to DreamHouse & Import the Sample Data from Settings.
> * Dream House : 04t3h000004mBpiAAE *


-   Create a class
    -   Name: `PropertyUtility`
-   Create a method
    -   Name: `newListedProperties`
    -   Keywords: `public, static`, and `void`
-   Create a list
    -   Name: `newPropList`
-   Create a query and assign the query results to the list
    -   Get this information:
        -   The name of the property
        -   The broker’s email address
        -   How long the property has been on market(Hint: Use API names, not field names or field labels)
    -   Object: Property
    -   Condition: The property was listed within the last 30 days
-   Create a for loop that iterates through the query results
    -   Object: Property
    -   List name: `newPropList`
    -   For each item, concatenate the property name, followed by a colon, followed by the broker’s email address: <_Property Name_\> : <_Broker Email_\>
    -   Store the concatenated string in a variable named `propEmail`
    -   Print the `propEmail` variable to the debug log

```java

public class PropertyUtility {
    
    public static void newListedProperties() {
    	
        List<Property__c> newPropList = new List<Property__c>();
        
        newPropList = [SELECT Id, Name, Broker__r.Email__c, Days_on_market__c
                       FROM Property__c 
                       WHERE Days_on_market__c <= 30];
        
        for(Property__c prop : newPropList) {
			String propEmail = prop.Name + ':' + prop.Broker__r.Email__c;
            System.debug(propEmail);
        }
    }
}


```

> :bulb: **Tip:** Execute this line in Aynonemous Window `newListedProperties.newListedProperties();`.





