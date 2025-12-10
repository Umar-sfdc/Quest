# **Formulas, Validation Rules, and Lookup Filters**

## **Math Operators**

- **Addition (+)**
- **Subtraction (-)**
- **Multiplication (\*)**
- **Division (/)**
- **Parentheses ()** --> Used to group expressions. Expressions inside parentheses are evaluated first.
- **Exponentiation (^)** --> Raises a number to a power of a specified number.

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

### Concatenate (&, +)

Used to combine multiple text values.

```java

  "Expense-" & Trip_Name__c & "-" & ExpenseNum__c

```

---

## **Date and Time Functions**

### ADDMONTHS(date, number_of_months)

Returns a date that is the specified number of months before or after the given date.

**Examples:**

```java
ADDMONTHS(20 September 2025, 5) = 20 February 2026
ADDMONTHS(30 September 2025, 5) = 28 February 2026
```

**Notes:**

- If a date falls on the last day of a month, the result is adjusted to the last day of the resulting month.

---

### Date(year, month, day)

Returns a date value from the year, month, and day values you enter. Salesforce displays an error on the detail page if the value of the DATE function in a formula field is an invalid date, such as February 29 in a non-leap year.

```java

DATE(2025, 02, 20) Creates a Date Field of February 02, 2025
```

---

### DATEVALUE(expression)

DATEVALUE(expression) and replace expression with a date/time or text value, merge field, or expression.

**Notes**

    If the field referenced in the function isn't a valid text or date/time field, the formula field displays #ERROR!
    When entering a date, surround the date with quotes and use this format: YYYY-MM-DD, that is, a four-digit year, two-digit month, and two-digit day.
    If the expression doesn't match valid date ranges, such as the MM isn't between 01 and 12, the formula field displays #ERROR!
    Dates and times are always calculated using the user’s time zone, except in list views, reports, and related lists. These items calculate dates and times using Coordinated Universal Time.

```java
DATEVALUE("2005-11-15") returns November 15, 2005 as a date value.
```

    > Note : Dates and times are always calculated using the user’s time zone, except in list views, reports, and related lists. These items calculate dates and times using Coordinated Universal Time.

---

### DATETIMEVALUE(expression)

DATETIMEVALUE(expression) and replace expression with a date/time or text value, merge field, or expression.

**Notes**

    - DATETIMEVALUE is always calculated using GMT time zone and can’t be changed.
    - When entering a specific date, surround the date with quotes and use the following format: YYYY-MM-DD, that is, a four-digit year, two-digit month, and two-digit day.
    - If the expression doesn't match valid date ranges, such as the MM isn't between 01 and 12, the formula field displays #ERROR!

Closed Date Example,

```java
DATETIMEVALUE("2005-11-15 17:00:00") returns November 15, 2005 5:00 PM GMT as a date and time value.
```

---

Here you go — I’ve filled in **all the remaining functions** and added **2–3 examples for each**, including **what the output looks like and its data type**. I’ve kept your style and headings.

---

### DATEVALUE(expression)

`DATEVALUE(expression)`
Converts a **Date/Time or text** expression into a **Date** value (`YYYY-MM-DD`).

**Key points**

- Works with text like `"2025-12-10"` or a Date/Time field like `CreatedDate`.
- If expression is invalid (wrong format / impossible date), formula shows `#ERROR!`
- Uses **user’s timezone** when converting a Date/Time.

```java
DATEVALUE("2005-11-15")
// Output (Date): 2005-11-15
```

```java
DATEVALUE(CloseDateTime__c)
// If CloseDateTime__c = 2025-12-10 15:30
// Output (Date): 2025-12-10
```

```java
DATEVALUE("2024-02-29")
// Output (Date): 2024-02-29   // 2024 is a leap year
```

---

### DATETIMEVALUE(expression)

`DATETIMEVALUE(expression)`
Converts a **Date or text** expression into a **Date/Time** value.

**Key points**

- Always calculated in **GMT (UTC)** internally.
- Date-only input becomes midnight GMT of that date, then shown in user’s timezone.
- Invalid expressions give `#ERROR!`.

```java
DATETIMEVALUE("2005-11-15 17:00:00")
// Output (Date/Time, GMT): 2005-11-15 17:00:00
// Shown to user adjusted to their timezone.
```

```java
DATETIMEVALUE("2025-01-01 09:30:00")
// Output (Date/Time): 2025-01-01 09:30:00 (GMT)
```

```java
DATETIMEVALUE(TODAY())
// If TODAY() = 2025-12-10
// Output (Date/Time, GMT): 2025-12-10 00:00:00
// Shown shifted to user timezone.
```

---

### DAY(date)

Returns the **day of month** (1–31) from a **Date** value.

```java
DAY(DATE(2025, 12, 10))
// Output (Number): 10
```

```java
DAY(TODAY())
// If TODAY() = 2025-12-10
// Output (Number): 10
```

```java
DAY(DATEVALUE(CloseDate))
// If CloseDate = 2025-03-05 14:00
// DATEVALUE(CloseDate) = 2025-03-05
// DAY(...) Output (Number): 5
```

---

### DAYOFYEAR(date)

Returns the **day number of the year** (1–365 or 366 for leap year).

```java
DAYOFYEAR(DATE(2024, 1, 1))
// Output (Number): 1
```

```java
DAYOFYEAR(DATE(2024, 12, 31))
// 2024 is leap year
// Output (Number): 366
```

```java
DAYOFYEAR(TODAY())
// If TODAY() = 2025-03-01 (for example)
// Output (Number): 60  (depends on actual date)
```

---

### FORMATDURATION(...)

`FORMATDURATION(numSeconds[, includeDays])` **or**
`FORMATDURATION(datetimeOrTime1, datetimeOrTime2)`

Returns the **difference** between two Date/Times (or Time values) or a number of seconds as **Text** in `DD:HH:MM:SS`.

```java
FORMATDURATION(
    DATETIMEVALUE("2024-01-01 10:00:00"),
    DATETIMEVALUE("2024-01-02 11:30:00")
)
// Difference = 1 day, 1 hour, 30 minutes
// Output (Text): "01:01:30:00"
```

```java
FORMATDURATION(90)
// 90 seconds = 1 minute 30 seconds
// Output (Text): "00:00:01:30"
```

```java
FORMATDURATION(
    Start_Time__c,
    End_Time__c
)
// If Start = 2025-01-01 09:00, End = 2025-01-01 17:15
// Output (Text): "00:08:15:00"
```

---

### HOUR(time)

Returns the **hour** (1–24) from a **Time** or **Date/Time**.

```java
HOUR(TIMEVALUE("17:30:45.125"))
// Output (Number): 17
```

```java
HOUR(TIMEVALUE("00:05:00.000"))
// Output (Number): 0 or 24 (implementation varies; conceptually midnight)
```

```java
HOUR(ClosedDate)
// If ClosedDate = 2025-12-10 06:45
// Output (Number): 6   (local user time)
```

---

### ISOYEAR(date)

Returns the **ISO 8601 year** for a given Date (can differ from calendar year for dates in first/last week of year).

```java
ISOYEAR(DATE(2023, 6, 15))
// Output (Number): 2023   (normal mid-year date)
```

```java
ISOYEAR(DATE(2021, 1, 1))
// ISO week for 2021-01-01 belongs to ISO year 2020
// Output (Number): 2020
```

```java
ISOYEAR(TODAY())
// Output (Number): ISO year of “today’s” date
```

---

### ISOWEEK(date)

Returns the **ISO 8601 week number** (1–53) for a Date.

```java
ISOWEEK(DATE(2023, 6, 15))
// Output (Number): 24   (ISO week 24 of 2023)
```

```java
ISOWEEK(DATE(2021, 1, 1))
// Output (Number): 53   (last ISO week of 2020)
```

```java
ISOWEEK(TODAY())
// Output (Number): ISO week number of “today’s” date
```

---

### MILLISECOND(time)

Returns the **milliseconds** (0–999) from a Time or Date/Time.

```java
MILLISECOND(TIMEVALUE("10:15:30.987"))
// Output (Number): 987
```

```java
MILLISECOND(TIMENOW())
// Output (Number): current millisecond part, e.g., 123
```

```java
MILLISECOND(CreatedDate)
// If CreatedDate has no ms part, usually
// Output (Number): 0
```

---

### MINUTE(time)

Returns the **minute** part (0–59/60) from a Time or Date/Time.

```java
MINUTE(TIMEVALUE("17:30:45.125"))
// Output (Number): 30
```

```java
MINUTE(TIMENOW())
// Output (Number): current minute, e.g., 42
```

```java
MINUTE(CreatedDate)
// If CreatedDate = 2025-12-10 09:05
// Output (Number): 5
```

---

### MONTH(date) _(you wrote MONTHS, actual function name is `MONTH`)_

Returns the **month number** (1–12) from a Date.

```java
MONTH(DATE(2025, 12, 10))
// Output (Number): 12
```

```java
MONTH(TODAY())
// If TODAY() = 2025-03-10
// Output (Number): 3
```

```java
MONTH(DATEVALUE(CloseDate))
// CloseDate: 2025-07-01 10:00
// DATEVALUE(...) = 2025-07-01
// Output (Number): 7
```

---

### NOW()

Returns the **current Date/Time** (moment) as a **Date/Time** value.

> Calculated using the **user’s timezone**.

```java
NOW()
// Output (Date/Time): current date & time
// e.g., 2025-12-10 05:15 PM (user’s local time)
```

```java
NOW() + 3
// Adds 3 days
// Output (Date/Time): 3 days from now, same time
```

```java
NOW() - CreatedDate
// Output (Number): days between CreatedDate and now
```

---

### SECOND(time)

Returns the **seconds** part (0–59) from a Time or Date/Time.

```java
SECOND(TIMEVALUE("17:30:45.125"))
// Output (Number): 45
```

```java
SECOND(TIMENOW())
// Output (Number): current seconds, e.g., 12
```

```java
SECOND(ClosedDate)
// If ClosedDate = 2025-12-10 09:00:30
// Output (Number): 30
```

---

### TIMENOW()

Returns the **current time** (without date) as a **Time** value, in **GMT**, then shown in user’s timezone.

```java
TIMENOW()
// Output (Time): current time
// e.g., 14:05:23.250
```

```java
HOUR(TIMENOW())
// Output (Number): current hour (0–23/24)
```

```java
TIMENOW() - TIMEVALUE("09:00:00.000")
// Output (Number): fraction of a day between now and 9 AM
// To convert to hours: (TIMENOW() - TIMEVALUE("09:00:00.000")) * 24
```

---

### TIMEVALUE(expression)

Converts a **Date/Time or text** expression into a **Time** value (`HH:MM:SS.MS`).

```java
TIMEVALUE("17:30:45.125")
// Output (Time): 17:30:45.125
```

```java
TIMEVALUE(ClosedDate)
// If ClosedDate = 2025-12-10 09:15:00
// Output (Time): 09:15:00.000
```

```java
TIMEVALUE("06:00:00.000") + (2/24)
// Adds 2 hours
// Output (Time): 08:00:00.000
```

---

### TODAY()

Returns **today’s date** (no time) as a **Date**.

```java
TODAY()
// Output (Date): current date
// e.g., 2025-12-10
```

```java
TODAY() - CreatedDate
// CreatedDate is Date (not Date/Time)
// Output (Number): days between CreatedDate and today
```

```java
TODAY() + 7
// Output (Date): date 7 days in the future
```

---

### UNIXTIMESTAMP(expression)

`UNIXTIMESTAMP(dateTimeOrTime)`

Returns the number of **seconds since 1970-01-01 00:00:00 UTC** (“Unix epoch”).

```java
UNIXTIMESTAMP(DATETIMEVALUE("1970-01-01 00:00:00"))
// Output (Number): 0
```

```java
UNIXTIMESTAMP(DATETIMEVALUE("1970-01-01 00:01:40"))
// 100 seconds after epoch
// Output (Number): 100
```

```java
UNIXTIMESTAMP(TIMEVALUE("01:30:00.000"))
// Seconds from start of day = 1 * 3600 + 30 * 60 = 5400
// Output (Number): 5400
```

---

### WEEKDAY(date)

Returns **day of week** as a number:
**1 = Sunday, 2 = Monday, …, 7 = Saturday**

```java
WEEKDAY(DATE(2025, 12, 07))
// 7 Dec 2025 is Sunday
// Output (Number): 1
```

```java
WEEKDAY(TODAY())
// Output (Number): depends on today’s weekday
// e.g., 4 for Wednesday
```

```java
WEEKDAY(DATEVALUE(CloseDate))
// If CloseDate is 2025-03-14 10:00 (Friday)
// Output (Number): 6
```

---

### YEAR(date)

Returns the **year** from a Date.

```java
YEAR(DATE(2025, 12, 10))
// Output (Number): 2025
```

```java
YEAR(TODAY())
// Output (Number): current year
```

```java
YEAR(DATEVALUE(CloseDate))
// If CloseDate = 2023-09-01 11:00
// DATEVALUE(...) = 2023-09-01
// Output (Number): 2023
```

---

## **Logical Functions**

### AND(logical1, logical2, ...)

Returns TRUE if **all** conditions are TRUE.

### Key Points

- Every argument must be a Boolean expression.
- If any condition is FALSE, the result is FALSE.
- Commonly used in validation rules.

### Examples

```
AND(TRUE, TRUE)
Output: TRUE
```

```
AND(Amount > 1000, StageName = "Closed Won")
Output: TRUE (if both conditions are met)
```

```
AND(NOT(ISBLANK(Phone)), ISNUMBER(SUBSTITUTE(Phone, "-", "")))
Output: TRUE (if phone is filled and numeric)
```

### Tips

- Use when all conditions must be satisfied.
- You can also use the && operator in most places.

### Limitations

- No short-circuiting: all arguments are evaluated.
- Passing a non-Boolean value causes a type error.

---

## BLANKVALUE(expression, substitute_expression)

If expression is blank, returns the substitute. Otherwise returns expression.

### Key Points

- Best used to provide default values.
- Works with text, date, number fields.

### Examples

```
BLANKVALUE(Account.Name, "No Name")
Output: "Acme" or "No Name"
```

```
BLANKVALUE(Due_Date__c, CreatedDate + 7)
Output: Due_Date__c or default 7 days after created
```

```
BLANKVALUE(SLA_Hours__c, 0)
Output: 0 if field is blank
```

### Tips

- Ideal for replacing blanks that cause calculation issues.

### Limitations

- A space (" ") is not considered blank.
- For numbers, behavior may change based on “Treat blank fields as zero” formula setting.

---

## CASE(expression, value1, result1, ..., else_result)

Compares an expression to several values and returns the matching result.

### Key Points

- Useful for replacing complex nested IFs.
- All results must be of the same data type.

### Examples

```
CASE(Term__c, "12", 12*Fee__c, "24", 24*Fee__c, 0)
Output: Term-based calculation
```

```
CASE(Priority__c, "High", "4 Hours", "Medium", "1 Day", "3 Days")
Output: Text result
```

```
CASE(TEXT(Region__c), "North", "John", "South", "Jane", "Unassigned")
Output: Assign based on region
```

### Tips

- Best suited for picklist branching.
- Use TEXT() when working with picklists.

### Limitations

- Missing else_result causes an error if no match is found.
- Invalid values in any branch can cause the whole CASE to fail.

---

## IF(logical_test, value_if_true, value_if_false)

Returns value_if_true when condition is true; otherwise value_if_false.

### Key Points

- Fundamental for conditional logic.
- Both return values must have compatible data types.

### Examples

```
IF(Amount > 100000, "High", "Normal")
Output: "High" or "Normal"
```

```
IF(CloseDate < TODAY(), "Overdue", "On Track")
Output: Text value
```

```
IF(ISPICKVAL(StageName, "Closed Won"), Amount * 0.05, 0)
Output: Commission amount
```

### Tips

- Use CASE() when checking the same field for multiple possible values.

### Limitations

- Too many nested IFs become unreadable.
- logical_test must return a Boolean value.

---

## ISNULL(expression)

Returns TRUE if expression is null; otherwise FALSE.

### Key Points

- Supported mainly for backward compatibility.
- Recommended to use ISBLANK() instead.

### Examples

```
ISNULL(Discount__c)
Output: TRUE if the number field is blank
```

```
ISNULL(CloseDate)
Output: TRUE if date field is blank
```

```
ISNULL(Text_Field__c)
Output: FALSE (text fields are never null)
```

### Tips

- Prefer ISBLANK for new formulas.

### Limitations

- Text fields always return FALSE, even when empty.
- Behavior is inconsistent across field types.

---

## ISCLONE()

Returns TRUE if a record is being created through the "Clone" action.

### Key Points

- Useful when preventing copying sensitive fields on cloned records.
- Commonly used in validation rules and flows.

### Examples

```
ISCLONE()
Output: TRUE if record is being cloned
```

```
AND(ISCLONE(), ISPICKVAL(Status__c, "Closed"))
Output: TRUE if a cloned record is being closed
```

```
AND(ISCLONE(), NOT(ISBLANK(Approval__c)))
Output: TRUE when a clone contains old approval data
```

### Tips

- Use to restrict or adjust behavior for cloned records.

### Limitations

- Works only in rules/flows, not formula fields.

---

## ISNEW()

Returns TRUE when the formula runs during record creation.

### Key Points

- Works only in validation rules, workflow, and flows.

### Examples

```
ISNEW()
Output: TRUE when creating a new record
```

```
AND(ISNEW(), ISBLANK(Source__c))
Output: TRUE when Source__c is required on create
```

### Tips

- Good for fields required only on creation, not update.

### Limitations

- Cannot be used in formula fields.
- Behavior may vary during integration-upsert scenarios.

---

## ISNUMBER(expression)

Returns TRUE if the text expression is a valid number.

### Key Points

- Works on text values only.
- Helps validate numeric input in text fields.

### Examples

```
ISNUMBER("123")
Output: TRUE
```

```
ISNUMBER("12A3")
Output: FALSE
```

```
ISNUMBER(Phone__c)
Output: TRUE if Phone__c contains only digits
```

### Tips

- Use SUBSTITUTE to remove symbols before checking numeric validity.

### Limitations

- Cannot test number fields (they are always valid numbers).
- Symbols, commas, currency signs cause FALSE unless cleaned.

---

## NOT(logical)

Returns the opposite Boolean value.

### Examples

```
NOT(TRUE)
Output: FALSE
```

```
NOT(Amount > 1000)
Output: TRUE if amount <= 1000
```

```
AND(NOT(ISBLANK(Code__c)), NOT(ISNUMBER(Code__c)))
Output: TRUE if Code__c has text but not numeric
```

### Tips

- Often used to invert results of ISBLANK, ISNUMBER, AND, OR.

### Limitations

- Argument must be a Boolean expression.

---

## NUMVALUE (Note: Salesforce Equivalent Is VALUE())

Salesforce does not have NUMVALUE(). Use VALUE(text) instead.

### Key Points

- Converts text to a number.
- Useful when importing numeric data stored as text.

### Examples

```
VALUE("123")
Output: 123
```

```
VALUE("12.5") * 2
Output: 25
```

```
VALUE(Score_Text__c)
Output: numeric value of the text
```

### Tips

- Use after MID, LEFT, RIGHT when extracting numeric substrings.

### Limitations

- Returns an error if the text is not a valid number.

---

## OR(logical1, logical2, ...)

Returns TRUE if any condition is TRUE.

### Key Points

- Opposite of AND().

### Examples

```
OR(TRUE, FALSE)
Output: TRUE
```

```
OR(ISBLANK(Email), ISBLANK(Phone))
Output: TRUE if either is blank
```

```
OR(ISPICKVAL(StageName, "Prospecting"), ISPICKVAL(StageName, "Qualification"))
Output: TRUE for early pipeline stages
```

### Tips

- Use OR to trigger validation when any bad condition happens.

### Limitations

- All arguments must be Boolean.

---

## PRIORVALUE(field)

Returns the value a field had **before** the current change.

### Key Points

- Used only in rules, workflows, flows.
- Does not work in formula fields.

### Examples

```
PRIORVALUE(Status__c)
Output: previous status
```

```
AND(ISPICKVAL(Status__c, "Closed"), PRIORVALUE(Status__c) <> "Closed")
Output: TRUE when closing for the first time
```

```
Amount > PRIORVALUE(Amount)
Output: TRUE if amount increased
```

### Tips

- Best for tracking change in fields like Status, Amount, Owner.

### Limitations

- Not available for all field types.
- On insert, PRIORVALUE equals the current value.
- Clearing a field can sometimes return unexpected previous values based on context.

---

If you want, I can combine this and the Date/Time sheet into a **clean formatted PDF** or **Markdown cheat sheet**.

## **Text Function**

### BLANKVALUE(fieldValue, substitute_expression)

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

### CASESAFEID(id)

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

### BEGINS(text, compare_text)

Checks whether a text value starts with specified characters.

```java
IF(BEGINS(ProductType__c, "ICU"), "Medical", "Tech")
```

**Notes:**

- This function is case-sensitive.
- In validation rules and workflow rules, blank fields are considered valid.

---

Below is a **clean, official-style, simple-format reference** for ALL the functions you listed.
No emojis, no links, no citations — only pure text, examples, outputs, tips, and limitations.

---

# CONTAINS(text, compare_text)

## Definition

Returns TRUE if `compare_text` appears anywhere inside `text`.

## Key Points

- Case-sensitive.
- Both arguments must be text or convertible to text.

## Examples

```
CONTAINS("Salesforce Admin", "Admin")
Output: TRUE
```

```
CONTAINS("ABC123", "123")
Output: TRUE
```

```
CONTAINS("Hello", "hello")
Output: FALSE (case-sensitive)
```

## Tips

- Wrap picklists inside TEXT() before using CONTAINS.

## Limitations

- Cannot search inside multi-select picklists reliably; use INCLUDES() for that.

---

# FIND(search_text, text [, start_num])

## Definition

Returns the **position (number index)** of `search_text` within `text`.

## Key Points

- Case-sensitive.
- If `start_num` is provided, searching begins from that position.
- Returns an error if not found.

## Examples

```
FIND("A", "SALESFORCE")
Output: 2
```

```
FIND("force", "salesforce")
Output: 6
```

```
FIND("Z", "APPLE")
Output: Error
```

## Tips

- Use with LEFT(), RIGHT(), MID() to parse text.

## Limitations

- Cannot safely use without checking if the substring exists (use CONTAINS first).

---

# GETSESSIONID()

## Definition

Returns the **current user’s session ID** as text.

## Key Points

- Works only in formula fields for buttons/links and Visualforce contexts.
- Not allowed in many modern Lightning contexts.
- Sensitive: treat carefully.

## Examples

```
GETSESSIONID()
Output: A Salesforce session ID string
```

## Tips

- Mainly used for integrations with buttons passing session ID.

## Limitations

- Not available in Lightning components, flows, Apex formulas, or most modern UI.
- Should not be used casually for security reasons.

---

# HTMLENCODE(text)

## Definition

Converts special characters into HTML-safe encoded characters.

## Key Points

- Protects against HTML interpretation.
- Converts characters like < > & into encoded versions.

## Examples

```
HTMLENCODE("<b>Hello</b>")
Output: "&lt;b&gt;Hello&lt;/b&gt;"
```

```
HTMLENCODE("Tom & Jerry")
Output: "Tom &amp; Jerry"
```

## Tips

- Useful in email templates and Visualforce formulas.

## Limitations

- Not used inside LWC or Apex formulas.

---

# HYPERLINK(url, friendly_name [, target])

## Definition

Creates a clickable link.

## Key Points

- `target` controls where the link opens ("\_blank", "\_self").

## Examples

```
HYPERLINK("/" & Id, Name)
Output: Link to the record
```

```
HYPERLINK("https://google.com", "Google", "_blank")
Output: Opens Google in new tab
```

## Tips

- Useful for formula fields that redirect to external pages.

## Limitations

- Not clickable in all list views (depends on configuration).

---

# INCLUDES(multiselect_picklist, text)

## Definition

Returns TRUE if the multi-select picklist contains the specified value.

## Key Points

- Works only with multi-select picklists.

## Examples

```
INCLUDES(Products__c, "Laptop")
Output: TRUE
```

```
INCLUDES(Hobbies__c, "Reading")
Output: TRUE
```

```
INCLUDES(Hobbies__c, "Swimming")
Output: FALSE
```

## Tips

- Best used in validation rules.

## Limitations

- Does not work on single picklist fields.

---

# ISPICKVAL(picklist, text)

## Definition

Returns TRUE if the picklist value equals the given text.

## Key Points

- Only for single-select picklists.

## Examples

```
ISPICKVAL(Status__c, "Open")
Output: TRUE
```

```
ISPICKVAL(StageName, "Closed Won")
Output: TRUE or FALSE
```

## Tips

- Often used in validation rules and workflow conditions.

## Limitations

- For multi-select picklists, use INCLUDES instead.

---

# LEFT(text, number)

## Definition

Returns the leftmost characters of a text.

## Examples

```
LEFT("Salesforce", 5)
Output: "Salesf"
```

```
LEFT("Hello", 1)
Output: "H"
```

---

# LEN(text)

## Definition

Returns the number of characters in a text string.

## Examples

```
LEN("Salesforce")
Output: 10
```

```
LEN("")
Output: 0
```

---

# LPAD(text, padded_length, pad_string)

## Definition

Pads a text string on the **left** to reach a required length.

## Examples

```
LPAD("25", 5, "0")
Output: "00025"
```

```
LPAD("A", 3, "*")
Output: "**A"
```

## Tips

- Useful for ID formatting or serial numbers.

---

# RPAD(text, padded_length, pad_string)

## Definition

Pads a text string on the **right**.

## Examples

```
RPAD("25", 5, "0")
Output: "25000"
```

```
RPAD("AB", 5, "-")
Output: "AB---"
```

---

# RIGHT(text, number)

## Definition

Returns the rightmost characters of a text string.

## Examples

```
RIGHT("Salesforce", 4)
Output: "orce"
```

```
RIGHT("12345", 2)
Output: "45"
```

---

# TEXT(expression)

## Definition

Converts a value (number, date, picklist) into text.

## Examples

```
TEXT(StageName)
Output: StageName as text
```

```
TEXT(123)
Output: "123"
```

```
TEXT(TODAY())
Output: "2025-12-10" (example format)
```

## Tips

- Required when comparing picklists using CONTAINS or CASE.

---

# SUBSTITUTE(text, old_text, new_text)

## Definition

Replaces all occurrences of old_text with new_text.

## Examples

```
SUBSTITUTE("a-b-c", "-", "")
Output: "abc"
```

```
SUBSTITUTE("2025/12/10", "/", "-")
Output: "2025-12-10"
```

```
SUBSTITUTE("aaa", "a", "b")
Output: "bbb"
```

## Tips

- Useful for cleaning phone numbers before ISNUMBER checks.

---

# TRIM(text)

## Definition

Removes leading and trailing spaces from text.

## Examples

```
TRIM("  Hello  ")
Output: "Hello"
```

```
TRIM(" Salesforce ")
Output: "Salesforce"
```

---

# UPPER(text)

## Definition

Converts all letters to uppercase.

## Examples

```
UPPER("salesforce")
Output: "SALESFORCE"
```

```
UPPER("Hello World")
Output: "HELLO WORLD"
```

---

# LOWER(text)

## Definition

Converts all letters to lowercase.

## Examples

```
LOWER("SALESFORCE")
Output: "salesforce"
```

```
LOWER("Hello World")
Output: "hello world"
```

---

# VALUE(text)

## Definition

Converts a numeric text string into a number.

## Examples

```
VALUE("123")
Output: 123
```

```
VALUE("12.5")
Output: 12.5
```

```
VALUE(LEFT("1000A", 4))
Output: 1000
```

## Tips

- Combine with LEFT, RIGHT, MID for numeric extraction.

## Limitations

- Errors if text cannot be converted into a number.

---

## **Math Function**

Below is a clean, official-style, simple-format explanation for each function you listed — **no emojis, no links, no extra styling**, just pure documentation with definition, key points, examples, tips, and limitations.

---

# CEILING(number)

## Definition

**CEILING(number)**
Returns the **smallest integer greater than or equal to** the given number.

## Key Points

- Always rounds **up** to the next whole number.
- Even if the decimal is very small (e.g., 3.0001), it still rounds up.
- Works only with Number values.

## Examples

```
CEILING(2.1)
Output: 3
```

```
CEILING(5.0)
Output: 5
```

```
CEILING(-2.3)
Output: -2
```

## Tips

- Useful when you need to round up hours, billing units, or quantity.

## Limitations

- Cannot accept text; use VALUE() for text-to-number conversion first.
- Always rounds up, even if very close to the lower integer.

---

# DISTANCE(geoLocation1, geoLocation2, unit)

## Definition

**DISTANCE(location1, location2, unit)**
Returns the distance between two **geolocation points** in **miles** or **kilometers**.

## Key Points

- Works only with **Geolocation fields** or GEOLOCATION() function.
- `unit` must be `"mi"` (miles) or `"km"` (kilometers).
- Commonly used in formulas to determine nearest locations.

## Examples

```
DISTANCE(
    GEOLOCATION(37.7749, -122.4194),
    GEOLOCATION(34.0522, -118.2437),
    "mi"
)
Output: Approx. 347
```

```
DISTANCE(Location__c, GEOLOCATION(40.7128, -74.0060), "km")
Output: Distance from record's location to New York
```

```
DISTANCE(Location_A__c, Location_B__c, "km")
Output: Numeric distance in kilometers
```

## Tips

- Use with validation rules or reports to calculate proximity.
- Good for delivery tracking, territory management, and service radius.

## Limitations

- Only works with values that are valid latitude/longitude pairs.
- Returns an error if unit is anything other than "mi" or "km".

---

# EXP(number)

## Definition

**EXP(number)**
Returns _e_ raised to the power of the number.
Where **e = 2.718281828...**

## Key Points

- Mathematical exponential function.
- Often used in financial, scientific, or growth-related calculations.

## Examples

```
EXP(1)
Output: 2.718281828
```

```
EXP(0)
Output: 1
```

```
EXP(2)
Output: 7.389056099
```

## Tips

- Combine with LN() for percentage growth calculations.

## Limitations

- Large numbers grow rapidly, causing overflow or large results.

---

# FLOOR(number)

## Definition

**FLOOR(number)**
Returns the **largest integer less than or equal to** the given number.

## Key Points

- Always rounds **down**.
- Works with positive and negative numbers.

## Examples

```
FLOOR(4.9)
Output: 4
```

```
FLOOR(7.0)
Output: 7
```

```
FLOOR(-2.3)
Output: -3
```

## Tips

- Useful for rounding down quantities, time slots, or page counts.

## Limitations

- Does not consider rounding rules; always rounds down.

---

# GEOLOCATION(latitude, longitude)

## Definition

**GEOLOCATION(latitude, longitude)**
Creates a geolocation value using latitude and longitude.

## Key Points

- Latitude must be between -90 and 90.
- Longitude must be between -180 and 180.
- Returned value can only be used with Geolocation-supported functions like DISTANCE().

## Examples

```
GEOLOCATION(37.7749, -122.4194)
Output: Geolocation value for San Francisco
```

```
GEOLOCATION(19.0760, 72.8777)
Output: Geolocation value for Mumbai
```

```
DISTANCE(GEOLOCATION(37, -121), GEOLOCATION(38, -122), "km")
Output: Numeric distance
```

## Tips

- Useful when storing coordinates manually inside formulas.

## Limitations

- Only usable with DISTANCE.
- Invalid coordinates cause formula errors.

---

# ROUND(number, num_digits)

## Definition

**ROUND(number, num_digits)**
Rounds a number to a specified number of decimal places.

## Key Points

- Uses standard rounding rules (0–4 down, 5–9 up).
- num_digits can be positive, zero, or negative.

## Examples

```
ROUND(3.14159, 2)
Output: 3.14
```

```
ROUND(1234.56, -2)
Output: 1200
```

```
ROUND(5.555, 2)
Output: 5.56
```

## Tips

- Use negative num_digits to round to nearest tens/hundreds.
- Good for currency, tax, and percentage calculations.

## Limitations

- Rounding inconsistencies may occur with floating point precision.

---

# PICKLISTCOUNT(picklistMultiSelectField)

## Definition

**PICKLISTCOUNT(field)**
Returns the number of selected values in a **multi-select picklist**.

## Key Points

- Works only with **multi-select picklist** fields.
- Returns an integer.

## Examples

```
PICKLISTCOUNT(Products__c)
// If "TV; Laptop; Mobile"
// Output: 3
```

```
PICKLISTCOUNT(Hobbies__c)
// If only "Reading"
// Output: 1
```

```
PICKLISTCOUNT(Hobbies__c)
// If blank
// Output: 0
```

## Tips

- Useful to enforce maximum/minimum multi-select values in validation rules.

## Limitations

- Does not work on regular picklist fields.
- Counting depends on semicolon-separated values internally.

---

## **Advanced Functions**

Here is the **clean, simple, official-style documentation** for the remaining Salesforce functions you listed.
No emojis, no links, no formatting tricks — just pure text with definition, key points, examples, tips, and limitations.

---

# PARENTGROUPVAL(summary_field, group_level)

## Definition

Returns the value of a summary field **from a parent group** in a report.

## Key Points

- Works only inside **report formulas** (not in fields, flows, or Apex).
- Used in **matrix** and **summary** reports.
- group_level indicates which parent grouping to reference.

## Examples

```
PARENTGROUPVAL(SUM(Amount), GRAND_SUMMARY)
Output: Sum of Amount at the grand total level
```

```
PARENTGROUPVAL(SUM(Amount), REGION)
Output: Sum of Amount for the Region group
```

## Tips

- Useful for percentage-of-total calculations in reports.

## Limitations

- Only works in reporting context.
- Cannot be used in formula fields on objects.

---

# PREVGROUPVAL(summary_field, group_level [, increment])

## Definition

Returns a summary value from the **previous group** in a report.

## Key Points

- Only available in report formulas.
- increment determines how many groups back to look.

## Examples

```
PREVGROUPVAL(SUM(Amount), REGION)
Output: Sum of Amount from the previous Region
```

```
PREVGROUPVAL(SUM(Revenue__c), MONTH, 1)
Output: Revenue from the previous month grouping
```

## Tips

- Commonly used for period-to-period comparisons.

## Limitations

- Works only in reports.
- Not available in formula fields on objects.

---

# CURRENCYRATE(currencyIsoCode)

## Definition

Returns the **conversion rate** between a specified currency and the corporate currency.

## Key Points

- Works only in **multi-currency orgs**.
- Argument must be a valid ISO currency code (e.g., "USD", "EUR").

## Examples

```
CURRENCYRATE("USD")
Output: numeric rate relative to corporate currency
```

```
Amount * CURRENCYRATE("EUR")
Output: Amount converted to EUR
```

```
100 / CURRENCYRATE("INR")
Output: Converts 100 corporate currency units to INR
```

## Tips

- Use for displaying different currency values inside formulas.

## Limitations

- Not supported in some orgs without multi-currency enabled.
- Cannot convert between two non-corporate currencies directly.

---

# GETRECORDIDS()

## Definition

Returns a list of record IDs currently selected in a **Lightning page list view** or Salesforce Console.

## Key Points

- Used in **custom buttons** or **actions**.
- Returns a text collection.

## Examples

```
GETRECORDIDS()
Output: A comma-separated list of selected record IDs
```

```
"Selected IDs: " & GETRECORDIDS()
Output: Text showing selected IDs
```

## Tips

- Often used to pass selected records into a Flow.

## Limitations

- Only works in Lightning list views or console views.
- Cannot be used in formula fields.

---

# INCLUDE()

## Definition

Used in **Salesforce Knowledge** to include the content of one article inside another.

## Key Points

- Works only in Knowledge Article rich text formula fields.
- Helps maintain reusable text blocks.

## Examples

```
INCLUDE("Article_ID")
Output: Inserts the content of that article
```

```
INCLUDE("Troubleshooting_Steps")
Output: The referenced article's text
```

## Tips

- Ideal for shared disclaimers, legal text, or repeated instructions.

## Limitations

- Cannot be used outside Knowledge.
- Fails if the referenced article is archived or deleted.

---

# ISCHANGED(field)

## Definition

Returns TRUE if the field value has changed in the current transaction.

## Key Points

- Works in **validation rules**, **workflow**, **flows**, **Process Builder**, and **record-triggered automation**.
- Does not work in formula fields.

## Examples

```
ISCHANGED(Status__c)
Output: TRUE if Status changed
```

```
AND(ISCHANGED(Amount), Amount > PRIORVALUE(Amount))
Output: TRUE if Amount increased
```

```
ISCHANGED(OwnerId)
Output: TRUE when owner changes
```

## Tips

- Use PRIOVALUE(field) to compare old vs new values.

## Limitations

- Always FALSE on initial record creation.
- Not available in formula fields.

---

# PREDICT(predictionField, modelName)

## Definition

Returns the prediction value from an **Einstein Prediction Builder** model.

## Key Points

- Works only if prediction fields and model are deployed.
- modelName is the API name of the prediction model.

## Examples

```
PREDICT(Churn_Score__c, "ChurnModel")
Output: The predicted churn score
```

```
PREDICT(Risk__c, "LoanRiskModel")
Output: The evaluated risk value
```

```
IF(PREDICT(Score__c, "LeadScoreModel") > 0.8, "High", "Low")
Output: Classification based on score
```

## Tips

- Useful for real-time decision making inside formulas.

## Limitations

- Requires Einstein predictions to be enabled.
- Model must support formula access.

---

# REGEX(text, regexPattern)

## Definition

Returns TRUE if text matches the regular expression pattern.

## Key Points

- Powerful for data validation.
- Pattern must be valid Salesforce-compatible regex.

## Examples

```
REGEX(Phone, "[0-9]{10}")
Output: TRUE if phone has 10 digits
```

```
REGEX(Email, "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
Output: TRUE if email is valid
```

```
REGEX(Postal_Code__c, "[A-Z][0-9][A-Z] [0-9][A-Z][0-9]")
Output: Canadian postal code check
```

## Tips

- Best function for strict input validation.

## Limitations

- Complex patterns can be difficult to maintain.
- Performance decreases with very long text fields.

---
