# **Formulas, Validation Rules, and Lookup Filters**

## **Math Operators**

- **Addition (+)**
- **Subtraction (-)**
- **Multiplication (\*)**
- **Division (/)**
- **Parentheses ()**
  Used to group expressions. Expressions inside parentheses are evaluated first.

---

## **Logical Operators**

- **Equal To (==, ===)**
- **Not Equal To (!=, <>)**
- **Less Than (<)**
- **Greater Than (>)**
- **Less Than or Equal To (<=)**
- **Greater Than or Equal To (>=)**
- **AND (&&)**
- **OR (||)**

---

## **Text Operators**

- **Concatenate (&, +)**
  Used to combine multiple text values.

---

## **Date and Time Functions**

### **ADDMONTHS(date, number_of_months)**

Returns a date that is the specified number of months before or after the given date.

**Examples:**

```java
ADDMONTHS(20 September 2025, 5) = 20 February 2026
ADDMONTHS(30 September 2025, 5) = 28 February 2026
```

**Notes:**

- If a date falls on the last day of a month, the result is adjusted to the last day of the resulting month.

---

### **AND(logical_expression1, logical_expression2, ...)**

Returns **TRUE** only if all expressions evaluate to TRUE. Otherwise returns FALSE.

> The `&&` operator can be used as an alternative.

---

### **BEGINS(text, compare_text)**

Checks whether a text value starts with specified characters.

```java
IF(BEGINS(ProductType__c, "ICU"), "Medical", "Tech")
```

**Notes:**

- This function is case-sensitive.
- In validation rules and workflow rules, blank fields are considered valid.

---

### **BLANKVALUE(fieldValue, substitute_expression)**

Returns the field value if it contains a value; otherwise returns the substitute expression.

```java
BLANKVALUE(Department, "Undesignated")
```

```java
BLANKVALUE(Payment_Due_Date__c, StartDate + 5)
```

**Notes:**

- Use BLANKVALUE instead of NULLVALUE for new formulas.
- A field containing a space character is **not** considered empty.
- Use BLANKVALUE to output a substitute string; use ISBLANK to only check emptiness.
- For numeric fields, the substitute expression is returned only when the field is empty and not treated as zero.

---

### **BR()**

Inserts a line break in formula text fields such as custom buttons, email templates, and text formulas.

---

### **CASE(expression, value1, result1, value2, result2, ..., else_result)**

Compares an expression to a series of values and returns the corresponding result.
If no value matches, returns the `else_result`.

**Notes:**

- All value expressions must be of the same data type.
- All result expressions must be of the same data type.
- Cannot contain functions that return TRUE or FALSE. Convert Boolean to numeric if needed.
- The `else_result` is mandatory.
- If the field value is blank, the `else_result` is returned.
- If any CASE expression returns an error, the entire formula errors.

**Examples:**

```java
CASE(Days_Open__c,
  3, "Reassign",
  2, "Assign Task",
  "Maintain")
```

```java
CASE(MONTH(LastActivityDate),
  1, "January",
  2, "February",
  3, "March",
  4, "April",
  5, "May",
  6, "June",
  7, "July",
  8, "August",
  9, "September",
  10, "October",
  11, "November",
  12, "December",
  "None")
```

```java
CASE($User.Country,
  "Japan", "Japanese",
  "US", "English",
  "unknown")
```

---

### **CASESAFEID(id)**

Converts a 15-character case-sensitive ID to an 18-character case-insensitive ID.

**Notes:**

- Useful when exporting to Excel.
- Available in most formula contexts except reports and s-controls.
- In Lightning Experience, any 15-character input is converted.
  Contact Salesforce Support if you need classic-style validation.

**Examples:**

```java
CASESAFEID(Id)
```

```java
CASESAFEID("A01xx000003DHur") → returns the same value (invalid ID)
CASESAFEID("001xx000003DHur") → returns 18–character version
```

---

### **CEILING(number)**

Rounds a number up to the nearest integer.

---

### **CONTAINS(first_string, compare_string)**

Returns TRUE if _compare_string_ is found within _first_string_.

```java
IF(CONTAINS(Product_Type__c, "part"), "Parts", "Service")
```

**Notes:**

- Case-sensitive.
- Blank fields are considered valid in validation/workflow rules.
- Does not support multi-select picklists.
  Use **INCLUDES** for multi-select values.

---
