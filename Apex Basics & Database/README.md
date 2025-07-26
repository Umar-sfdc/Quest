# Apex Basics & Database

> ⚠️ **Info** : After saving each class, Run all the Test class at once.

## 01. Create an Apex class with a method that returns a list of strings

Create an Apex class with a method that returns a list of formatted strings. The length of the list is determined by an integer parameter.

-   The Apex class must be called `StringListTest` and be in the public scope
-   The Apex class must have a public static method called `generateStringList`
-   The **generateStringList** method must return a list of strings
    -   The method must accept an incoming `Integer` as a parameter, which will be used to determine the number of returned strings
    -   The method must return a list of strings. Each element in the list must have the format **Test n**, where `n` is the index of the current string in the list. For example, if the input is **3**, then the output should be **\['Test 0', 'Test 1', 'Test 2'\]**. Remember that in Apex, the index position of the first element in a list is always `0`.


```java

  // create a apex class name StringListTest & paste the below code.

  public class StringListTest {
    public static List<String> generateStringList(Integer n) {
        List<String> TestList = new List<String>();
        for(Integer i=0;i<n;i++) {
            TestList.add('Test ' + i);
            System.debug(TestList[i]);
        }
    return TestList;
    }
}

/*

  // Save class & Run run this in anonymous window.
  StringListTest.generateStringList(5);

  // if the above line don't work then excute this line.
  List<String> testList = StringListTest.generateStringList(5);
  System.debug('Here is Test List : ' + testList);

*/

```


## 03. Create a method for inserting accounts.

To pass this challenge, create an Apex class that inserts a new account named after an incoming parameter. If the account is successfully inserted, the method should return the account record. If a DML exception occurs, the method should return null.

-   The Apex class must be called **AccountHandler** and be in the public scope
-   The Apex class must have a public static method called **insertNewAccount**
    -   The method must accept an incoming string as a parameter, which will be used to create the Account name
    -   The method must insert the account into the system and then return the record
    -   The method must also accept an empty string, catch the failed DML and then return null


```java

  // create a apex class name AccountHandler & paste the below code.

  public class AccountHandler {
   public static Account insertNewAccount(String AccountName){
        Account acct = new Account(Name=AccountName);
        try{
            insert acct;
        }
        catch(DMLException e){
            return Null;
        }
        return acct;
	}
}


/*

  // Save class & Run this in anonymous window.
  AccountHandler.insertNewAccount('Testing Account for Apex Basics & Databases');

  // then execute this.
  AccountHandler.insertNewAccount('');

*/

```

## 04. Create an Apex class that returns contacts based on incoming parameters.

For this challenge, you will need to create a class that has a method accepting two strings. The method searches for contacts that have a last name matching the first string and a mailing postal code matching the second. It gets the ID and Name of those contacts and returns them.

-   The Apex class must be called **ContactSearch** and be in the public scope
-   The Apex class must have a public static method called **searchForContacts**
    -   The method must accept two incoming strings as parameters
    -   The method should then find any contact that has a last name matching the first string, and mailing postal code (API name: **MailingPostalCode**) matching the second string
    -   The method should finally return a list of Contact records of type **List** that includes the ID and Name fields


```java

  // create a apex class name ContactSearch & paste the below code.

  public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String maillingpostalCode){
        List<Contact> contactList = [Select Id,Name from Contact where
                                  LastName =: lastName and 
                                  MailingPostalCode =: maillingpostalCode];
        return contactList;
    }
 
}

/*

  // Save class & Run this in anonymous window.
  ContactSearch.searchForContacts('Doe','123 Main Street');

  // or
  ContactSearch.searchForContacts();

*/
```

## 05. Create an Apex class that returns both contacts and leads based on a parameter.

To pass this challenge, create an Apex class that returns both contacts and leads that have first or last name matching the incoming parameter.

-   The Apex class must be called **ContactAndLeadSearch** and be in the public scope
-   The Apex class must have a public static method called **searchContactsAndLeads**
    -   The method must accept an incoming string as a parameter
    -   The method should then find any contact or lead whose first or last name match the string
    -   The method should finally use a return type of **List<List< sObject>>**
-   **NOTE:** Because SOSL indexes data for searching, you must create a Contact record and Lead record before checking this challenge. Both records must have the last name **Smith**. The challenge uses these records for the SOSL search


```java

  // Crate  a apex class name ContactAndLeadSearch & paste the below code.

  public class ContactAndLeadSearch {
 
    public static list<list< sObject >> searchContactsAndLeads(String lastName){
 
        list<list< sObject >> ContactLeadList = [ Find : lastName IN ALL FIELDS
                                                 RETURNING contact(name),
                                                 lead (Name) ];
      return ContactLeadList;
  }   
}


/*

  // Save class & Run this in anonymous window.
  ContactAndLeadSearch.searchContactsAndLeads('Smith');


  // if the above anonymous window code doesn't work go with this.
  Lead SmithLead = new Lead(
    Name = 'Smit',
    Company = 'Testing this challange'
  );
  insert SmithLead;

  Contact SmithContact = new Contact(
    lastName = 'Smit',
    Phone = '9876543210'
  );
  insert SmithContact;
  
  ContactAndLeadSearch.searchContactsAndLeads('Smith');

*/

```

> 💡 : Save all the classes & then run all one by one for better challenge completion!



