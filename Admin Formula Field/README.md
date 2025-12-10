# Formulas, Validation Rules, and Lookup Filters – Reference

## 1. Operators

### 1.1 Math Operators

- **Addition (+)** – Adds two numbers.
- **Subtraction (-)** – Subtracts one number from another.
- **Multiplication (\*)** – Multiplies numbers.
- **Division (/)** – Divides one number by another.
- **Parentheses ()** – Group expressions; inside parentheses is evaluated first.
- **Exponentiation (^)** – Raises a number to the power of another number.

**Examples**

```java
Amount__c + Tax__c
Discount__c - 10
Quantity__c * UnitPrice__c
Total__c / 12
(Amount__c + Tax__c) * 0.18
Power__c ^ 2
```

---

### 1.2 Logical Operators

- **Equal To (==, ===)**
- **Not Equal To (!=, <>)**
- **Less Than (<)**
- **Greater Than (>)**
- **Less Than or Equal To (<=)**
- **Greater Than or Equal To (>=)**
- **AND (&&)**
- **OR (||)**

**Examples**

```java
Amount__c >= 1000
StageName == "Closed Won"
(Amount__c > 1000) && (Discount__c > 0)
(ISBLANK(Email) || ISBLANK(Phone))
```

---

### 1.3 Text Operators

#### Concatenation (&, +)

Used to combine multiple text values.

```java
"Expense-" & Trip_Name__c & "-" & ExpenseNum__c

Account.Name & " (" & TEXT(Industry) & ")"
```

> Note: In Salesforce formulas, `&` is the standard text concatenation operator. `+` is primarily numeric.

---

## 2. Date and Time Functions

---

### 2.1 ADDMONTHS(date, number_of_months)

**Definition**
Returns a date that is the given number of months before or after a specified date.

**Key Points**

- If the starting date is the last day of a month, the result is adjusted to the last day of the resulting month.
- Works with Date values.

**Examples**

```java
ADDMONTHS(DATE(2025, 9, 20), 5)
// Output: 2026-02-20
```

```java
ADDMONTHS(DATE(2025, 9, 30), 5)
// Output: 2026-02-28 (adjusted to last day)
```

```java
ADDMONTHS(CloseDate, -3)
// Output: date three months before CloseDate
```

**Tips**

- Useful for subscription, contract end dates, and follow-up schedules.

**Limitations**

- Day adjustments may surprise you when starting from end-of-month dates.

---

### 2.2 DATE(year, month, day)

**Definition**
Returns a Date value from numeric year, month, and day.

**Key Points**

- If the resulting date is invalid (for example, 29 Feb in a non-leap year), the formula errors.
- Year must be four digits for clarity.

**Examples**

```java
DATE(2025, 2, 20)
// Output: 2025-02-20
```

```java
DATE(YEAR(TODAY()), 12, 31)
// Output: Last day of current year
```

```java
DATE(2024, 2, 29)
// Valid leap year date
```

**Tips**

- Use with YEAR, MONTH, and DAY to rebuild or adjust dates.

**Limitations**

- Invalid combinations cause formula errors.

---

### 2.3 DATEVALUE(expression)

**Definition**
Converts a Date/Time or text expression into a Date value (no time).

**Key Points**

- Text must be in `YYYY-MM-DD` format when typed as a literal.
- Uses the user’s time zone when converting from Date/Time.
- Invalid expressions show `#ERROR!`.

**Examples**

```java
DATEVALUE("2005-11-15")
// Output: 2005-11-15
```

```java
DATEVALUE(CloseDateTime__c)
// If CloseDateTime__c = 2025-12-10 15:30
// Output: 2025-12-10
```

```java
DATEVALUE("2024-02-29")
// Output: 2024-02-29
```

**Tips**

- Use to strip time from Date/Time fields for date-only calculations.

**Limitations**

- Wrong format or impossible dates (like 2025-13-40) cause errors.

---

### 2.4 DATETIMEVALUE(expression)

**Definition**
Converts a Date or text expression into a Date/Time value.

**Key Points**

- Calculated in GMT (UTC) internally.
- Date-only input is treated as midnight GMT, then displayed in user’s time zone.
- Invalid expressions cause `#ERROR!`.

**Examples**

```java
DATETIMEVALUE("2005-11-15 17:00:00")
// Output: 2005-11-15 17:00:00 (GMT)
```

```java
DATETIMEVALUE("2025-01-01 09:30:00")
// Output: 2025-01-01 09:30:00 (GMT)
```

```java
DATETIMEVALUE(TODAY())
// Output: [today’s date] 00:00:00 (GMT)
```

**Tips**

- Use when you must convert text or date fields into Date/Time for time-based calculations.

**Limitations**

- Only accepts valid Date/Time strings.

---

### 2.5 DAY(date)

**Definition**
Returns the day of the month (1–31).

**Examples**

```java
DAY(DATE(2025, 12, 10))
// Output: 10
```

```java
DAY(TODAY())
// Output: today’s day of month
```

```java
DAY(DATEVALUE(CloseDate))
// Output: day part of CloseDate
```

**Tips**

- Combine with MONTH and YEAR for date analysis.

---

### 2.6 DAYOFYEAR(date)

**Definition**
Returns the day number of the year (1–365 or 366 in leap year).

**Examples**

```java
DAYOFYEAR(DATE(2024, 1, 1))
// Output: 1
```

```java
DAYOFYEAR(DATE(2024, 12, 31))
// Output: 366
```

```java
DAYOFYEAR(TODAY())
// Output: current day-of-year number
```

---

### 2.7 FORMATDURATION(start, end) or FORMATDURATION(seconds)

**Definition**
Returns the duration between two Date/Time or Time values, or a number of seconds, as text in `DD:HH:MM:SS`.

**Key Points**

- Output is text, not a numeric time.
- Can take two Date/Times or a numeric seconds value.

**Examples**

```java
FORMATDURATION(
  DATETIMEVALUE("2024-01-01 10:00:00"),
  DATETIMEVALUE("2024-01-02 11:30:00")
)
// Output: "01:01:30:00"
```

```java
FORMATDURATION(90)
// Output: "00:00:01:30"
```

---

### 2.8 HOUR(time_or_datetime)

**Definition**
Returns the hour (0–23) from a Time or Date/Time value.

**Examples**

```java
HOUR(TIMEVALUE("17:30:45.125"))
// Output: 17
```

```java
HOUR(ClosedDate)
// If ClosedDate = 2025-12-10 06:45
// Output: 6
```

---

### 2.9 ISOYEAR(date)

**Definition**
Returns the ISO 8601 year for a given date.

**Examples**

```java
ISOYEAR(DATE(2023, 6, 15))
// Output: 2023
```

```java
ISOYEAR(DATE(2021, 1, 1))
// May return 2020, depending on ISO week rules
```

---

### 2.10 ISOWEEK(date)

**Definition**
Returns the ISO 8601 week number (1–53).

**Examples**

```java
ISOWEEK(DATE(2023, 6, 15))
// Output: week number (for example, 24)
```

```java
ISOWEEK(TODAY())
// Output: current ISO week number
```

---

### 2.11 MILLISECOND(time_or_datetime)

**Definition**
Returns the millisecond part (0–999) of a Time or Date/Time.

**Examples**

```java
MILLISECOND(TIMEVALUE("10:15:30.987"))
// Output: 987
```

```java
MILLISECOND(TIMENOW())
// Output: current milliseconds (implementation dependent)
```

---

### 2.12 MINUTE(time_or_datetime)

**Definition**
Returns the minute part (0–59) of a Time or Date/Time.

**Examples**

```java
MINUTE(TIMEVALUE("17:30:45.125"))
// Output: 30
```

```java
MINUTE(CreatedDate)
// Output: minute of created time
```

---

### 2.13 MONTH(date)

**Definition**
Returns the month part (1–12) of a Date.

**Examples**

```java
MONTH(DATE(2025, 12, 10))
// Output: 12
```

```java
MONTH(TODAY())
// Output: current month number
```

---

### 2.14 NOW()

**Definition**
Returns the current date and time as a Date/Time, in the user’s time zone.

**Examples**

```java
NOW()
// Output: current date/time
```

```java
NOW() + 3
// Output: date/time 3 days from now
```

```java
NOW() - CreatedDate
// Output: number of days between created and now
```

---

### 2.15 SECOND(time_or_datetime)

**Definition**
Returns the seconds part (0–59) of a Time or Date/Time.

**Examples**

```java
SECOND(TIMEVALUE("17:30:45.125"))
// Output: 45
```

```java
SECOND(TIMENOW())
// Output: current seconds
```

---

### 2.16 TIMENOW()

**Definition**
Returns the current time (no date) as a Time value.

**Examples**

```java
TIMENOW()
// Output: current time
```

```java
HOUR(TIMENOW())
// Output: current hour
```

---

### 2.17 TIMEVALUE(expression)

**Definition**
Converts a Date/Time or text expression into a Time value.

**Examples**

```java
TIMEVALUE("17:30:45.125")
// Output: 17:30:45.125
```

```java
TIMEVALUE(ClosedDate)
// Output: time part of ClosedDate
```

---

### 2.18 TODAY()

**Definition**
Returns today’s date (no time) as a Date.

**Examples**

```java
TODAY()
// Output: today's date
```

```java
TODAY() + 7
// Output: date 7 days from today
```

```java
TODAY() - CreatedDate
// Output: number of days difference
```

---

### 2.19 UNIXTIMESTAMP(expression)

**Definition**
Returns the number of seconds since 1970-01-01 00:00:00 UTC.

**Examples**

```java
UNIXTIMESTAMP(DATETIMEVALUE("1970-01-01 00:00:00"))
// Output: 0
```

```java
UNIXTIMESTAMP(TIMENOW())
// Output: seconds-from-midnight today
```

---

### 2.20 WEEKDAY(date)

**Definition**
Returns a number representing the day of week:
1 = Sunday, 2 = Monday, ..., 7 = Saturday.

**Examples**

```java
WEEKDAY(DATE(2025, 12, 7))
// Output: 1 (Sunday)
```

```java
WEEKDAY(TODAY())
// Output: current weekday number
```

---

### 2.21 YEAR(date)

**Definition**
Returns the year part of a Date.

**Examples**

```java
YEAR(DATE(2025, 12, 10))
// Output: 2025
```

```java
YEAR(TODAY())
// Output: current year
```

---

## 3. Logical and Conditional Functions

---

### 3.1 AND(logical1, logical2, ...)

**Definition**
Returns TRUE if all conditions are TRUE; otherwise FALSE.

**Key Points**

- All arguments must be Boolean expressions.

**Examples**

```java
AND(TRUE, TRUE)
// Output: TRUE
```

```java
AND(Amount > 1000, StageName = "Closed Won")
// Output: TRUE or FALSE
```

```java
AND(NOT(ISBLANK(Phone)), ISNUMBER(SUBSTITUTE(Phone, "-", "")))
// Output: TRUE if phone is filled and numeric
```

**Tips**

- Use when all conditions must be met (e.g., complex validation rules).

**Limitations**

- No short-circuit behavior; all arguments are evaluated.

---

### 3.2 BLANKVALUE(expression, substitute_expression)

**Definition**
Returns `expression` if it is not blank; otherwise returns `substitute_expression`.

**Key Points**

- Good for providing default values.
- Works for text, numbers, dates.

**Examples**

```java
BLANKVALUE(Account.Name, "No Name")
// Output: existing name or "No Name"
```

```java
BLANKVALUE(Payment_Due_Date__c, StartDate__c + 5)
// Output: due date or StartDate + 5
```

```java
BLANKVALUE(SLA_Hours__c, 0)
// Output: field value or 0
```

**Tips**

- Use to avoid null/blank issues in numeric formulas.

**Limitations**

- A space " " is not considered blank.
- For numeric fields, behavior is affected by the “Treat blank fields as zero” setting.

---

### 3.3 CASE(expression, value1, result1, ..., else_result)

**Definition**
Compares `expression` to multiple values and returns the matching result; otherwise returns `else_result`.

**Key Points**

- All results must be same data type.
- Replaces complex nested IFs.

**Examples**

```java
CASE(Days_Open__c,
  3, "Reassign",
  2, "Assign Task",
  "Maintain"
)
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
  "None"
)
```

```java
CASE($User.Country,
  "Japan", "Japanese",
  "US", "English",
  "unknown"
)
```

**Tips**

- Use TEXT() for picklists: `CASE(TEXT(StageName), ...)`.

**Limitations**

- Missing else_result or invalid branches cause formula errors.

---

### 3.4 IF(logical_test, value_if_true, value_if_false)

**Definition**
Returns one value if condition is TRUE, another if FALSE.

**Key Points**

- Both return values must be compatible types.

**Examples**

```java
IF(Amount > 100000, "High", "Normal")
```

```java
IF(CloseDate < TODAY(), "Overdue", "On Track")
```

```java
IF(ISPICKVAL(StageName, "Closed Won"), Amount * 0.05, 0)
```

**Tips**

- Use CASE for many branches based on the same field.

---

### 3.5 ISNULL(expression)

**Definition**
Returns TRUE if expression is null; otherwise FALSE.
(Primarily for backward compatibility.)

**Key Points**

- Behavior differs by field type; text fields are never null.

**Examples**

```java
ISNULL(Discount__c)
// TRUE if number field is blank
```

```java
ISNULL(CloseDate)
// TRUE if CloseDate is blank
```

```java
ISNULL(Text_Field__c)
// Usually FALSE, even if appears blank
```

**Tips**

- Prefer ISBLANK in new formulas.

---

### 3.6 ISCLONE()

**Definition**
Returns TRUE if the current record was created via the Clone action.

**Key Points**

- Intended for validation rules, flows, and automation.

**Examples**

```java
ISCLONE()
// TRUE on cloned records
```

```java
AND(ISCLONE(), ISPICKVAL(Status__c, "Closed"))
// Block closing cloned records
```

---

### 3.7 ISNEW()

**Definition**
Returns TRUE when the formula is evaluated during record creation (before first save).

**Key Points**

- Used in validation rules, workflow, and flows.

**Examples**

```java
ISNEW()
```

```java
AND(ISNEW(), ISBLANK(Source__c))
// Require Source__c on create only
```

---

### 3.8 ISNUMBER(text_expression)

**Definition**
Returns TRUE if the text is a valid number; otherwise FALSE.

**Examples**

```java
ISNUMBER("123")
// TRUE
```

```java
ISNUMBER("12A3")
// FALSE
```

```java
ISNUMBER(SUBSTITUTE(Phone__c, "-", ""))
// TRUE if phone digits only after removing dashes
```

**Tips**

- Use SUBSTITUTE to remove spaces, dashes, or symbols first.

---

### 3.9 NOT(logical)

**Definition**
Returns TRUE if argument is FALSE; returns FALSE if argument is TRUE.

**Examples**

```java
NOT(TRUE)
// FALSE
```

```java
NOT(Amount > 1000)
// TRUE if Amount <= 1000
```

```java
AND(NOT(ISBLANK(Code__c)), NOT(ISNUMBER(Code__c)))
// TRUE if Code__c filled but not numeric
```

---

### 3.10 OR(logical1, logical2, ...)

**Definition**
Returns TRUE if any argument is TRUE; FALSE only if all are FALSE.

**Examples**

```java
OR(TRUE, FALSE)
// TRUE
```

```java
OR(ISBLANK(Email), ISBLANK(Phone))
// TRUE if either is blank
```

```java
OR(
  ISPICKVAL(StageName, "Prospecting"),
  ISPICKVAL(StageName, "Qualification")
)
```

---

### 3.11 PRIORVALUE(field)

**Definition**
Returns the previous value of a field before the current change.

**Key Points**

- Works in validation rules, workflow, Process Builder, and flows.
- On insert, PRIORVALUE equals the initial value.

**Examples**

```java
PRIORVALUE(Status__c)
// Previous status
```

```java
AND(
  ISPICKVAL(Status__c, "Closed"),
  PRIORVALUE(Status__c) <> "Closed"
)
// TRUE when closing for the first time
```

```java
Amount > PRIORVALUE(Amount)
// TRUE if Amount increased
```

---

### 3.12 ISCHANGED(field)

**Definition**
Returns TRUE if the field value changed in the current transaction.

**Key Points**

- Works in validation rules, workflow, Process Builder, and flows.
- Not usable in formula fields.

**Examples**

```java
ISCHANGED(Status__c)
```

```java
AND(ISCHANGED(Amount), Amount > PRIORVALUE(Amount))
// TRUE when Amount increased
```

---

### 3.13 REGEX(text, pattern)

**Definition**
Returns TRUE if text matches the regex pattern; otherwise FALSE.

**Examples**

```java
REGEX(Phone, "[0-9]{10}")
// TRUE if Phone has exactly 10 digits
```

```java
REGEX(Email,
"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
```

**Tips**

- Use for strict input validation (phone, postal code, IDs, etc.).

---

### 3.14 PREDICT(predictionField, modelName)

**Definition**
Returns a prediction from an Einstein Prediction Builder model.

**Examples**

```java
PREDICT(Churn_Score__c, "ChurnModel")
```

```java
IF(PREDICT(Score__c, "LeadScore") > 0.8, "High", "Low")
```

**Limitations**

- Requires Einstein Predictions to be configured.

---

## 4. Text and String Functions

---

### 4.1 BLANKVALUE(fieldValue, substitute_expression)

(Already covered under Logical; commonly used for text as well.)

---

### 4.2 BR()

**Definition**
Inserts a line break in text formulas (buttons, email templates, text fields).

**Example**

```java
"Line 1" & BR() & "Line 2"
```

---

### 4.3 CASESAFEID(id)

**Definition**
Converts a 15-character case-sensitive ID to an 18-character case-insensitive ID.

**Examples**

```java
CASESAFEID(Id)
// Returns 18-character ID
```

```java
CASESAFEID("001xx000003DHur")
// Returns 18-char version if valid
```

---

### 4.4 BEGINS(text, compare_text)

**Definition**
Returns TRUE if text starts with compare_text.

**Examples**

```java
BEGINS(ProductType__c, "ICU")
// TRUE if ProductType__c starts with "ICU"
```

```java
BEGINS(Name, "Test")
// TRUE if Name begins with "Test"
```

---

### 4.5 CONTAINS(text, compare_text)

**Definition**
Returns TRUE if compare_text appears anywhere in text.

**Examples**

```java
CONTAINS("Salesforce Admin", "Admin")
// TRUE
```

```java
CONTAINS("Hello", "hello")
// FALSE (case sensitive)
```

---

### 4.6 FIND(search_text, text [, start_num])

**Definition**
Returns the position (1-based) of search_text within text.

**Examples**

```java
FIND("A", "SALESFORCE")
// Output: 2
```

```java
FIND("force", "salesforce")
// Output: 6
```

---

### 4.7 HTMLENCODE(text)

**Definition**
Encodes special characters into HTML-safe entities.

**Examples**

```java
HTMLENCODE("<b>Hello</b>")
// "&lt;b&gt;Hello&lt;/b&gt;"
```

```java
HTMLENCODE("Tom & Jerry")
// "Tom &amp; Jerry"
```

---

### 4.8 HYPERLINK(url, friendly_name [, target])

**Definition**
Creates a clickable hyperlink.

**Examples**

```java
HYPERLINK("/" & Id, Name)
// Link to the record
```

```java
HYPERLINK("https://google.com", "Google", "_blank")
// Opens in new tab
```

---

### 4.9 INCLUDES(multiselect_picklist, text)

**Definition**
Returns TRUE if the multi-select picklist includes the given value.

**Examples**

```java
INCLUDES(Products__c, "Laptop")
```

```java
INCLUDES(Hobbies__c, "Reading")
```

---

### 4.10 ISPICKVAL(picklist, text)

**Definition**
Returns TRUE if picklist equals given text.

**Examples**

```java
ISPICKVAL(Status__c, "Open")
```

```java
ISPICKVAL(StageName, "Closed Won")
```

---

### 4.11 LEFT(text, number)

**Definition**
Returns leftmost number characters of text.

**Examples**

```java
LEFT("Salesforce", 5)
// "Sales"
```

```java
LEFT("Hello", 1)
// "H"
```

---

### 4.12 LEN(text)

**Definition**
Returns the number of characters in text.

**Examples**

```java
LEN("Salesforce")
// 10
```

```java
LEN("")
// 0
```

---

### 4.13 LPAD(text, padded_length, pad_string)

**Definition**
Pads text on the left with pad_string until padded_length is reached.

**Examples**

```java
LPAD("25", 5, "0")
// "00025"
```

```java
LPAD("A", 3, "*")
// "**A"
```

---

### 4.14 RPAD(text, padded_length, pad_string)

**Definition**
Pads text on the right.

**Examples**

```java
RPAD("25", 5, "0")
// "25000"
```

```java
RPAD("AB", 5, "-")
// "AB---"
```

---

### 4.15 RIGHT(text, number)

**Definition**
Returns rightmost number characters of text.

**Examples**

```java
RIGHT("Salesforce", 4)
// "orce"
```

```java
RIGHT("12345", 2)
// "45"
```

---

### 4.16 TEXT(expression)

**Definition**
Converts a value (number, date, picklist, etc.) to text.

**Examples**

```java
TEXT(StageName)
```

```java
TEXT(123)
// "123"
```

```java
TEXT(TODAY())
// date as string
```

---

### 4.17 SUBSTITUTE(text, old_text, new_text)

**Definition**
Replaces all occurrences of old_text with new_text.

**Examples**

```java
SUBSTITUTE("a-b-c", "-", "")
// "abc"
```

```java
SUBSTITUTE("2025/12/10", "/", "-")
// "2025-12-10"
```

---

### 4.18 TRIM(text)

**Definition**
Removes leading and trailing spaces.

**Examples**

```java
TRIM("  Hello  ")
// "Hello"
```

```java
TRIM(" Salesforce ")
// "Salesforce"
```

---

### 4.19 UPPER(text)

**Definition**
Converts text to uppercase.

**Examples**

```java
UPPER("salesforce")
// "SALESFORCE"
```

```java
UPPER("Hello World")
// "HELLO WORLD"
```

---

### 4.20 LOWER(text)

**Definition**
Converts text to lowercase.

**Examples**

```java
LOWER("SALESFORCE")
// "salesforce"
```

```java
LOWER("Hello World")
// "hello world"
```

---

### 4.21 VALUE(text)

**Definition**
Converts a numeric text string into a Number.

**Examples**

```java
VALUE("123")
// 123
```

```java
VALUE("12.5")
// 12.5
```

```java
VALUE(LEFT("1000A", 4))
// 1000
```

---

## 5. Math, Numeric, and Geolocation Functions

---

### 5.1 CEILING(number)

**Definition**
Returns the smallest integer greater than or equal to number (rounds up).

**Examples**

```java
CEILING(2.1)
// 3
```

```java
CEILING(-2.3)
// -2
```

---

### 5.2 FLOOR(number)

**Definition**
Returns the largest integer less than or equal to number (rounds down).

**Examples**

```java
FLOOR(4.9)
// 4
```

```java
FLOOR(-2.3)
// -3
```

---

### 5.3 ROUND(number, num_digits)

**Definition**
Rounds number to num_digits decimal places.

**Examples**

```java
ROUND(3.14159, 2)
// 3.14
```

```java
ROUND(1234.56, -2)
// 1200
```

---

### 5.4 EXP(number)

**Definition**
Returns e raised to power number.

**Examples**

```java
EXP(1)
// Approx 2.718281828
```

```java
EXP(0)
// 1
```

---

### 5.5 DISTANCE(geoLocation1, geoLocation2, unit)

**Definition**
Returns the distance between two geolocation values, in miles or kilometers.

**Examples**

```java
DISTANCE(
  GEOLOCATION(37.7749, -122.4194),
  GEOLOCATION(34.0522, -118.2437),
  "mi"
)
```

```java
DISTANCE(Location__c, GEOLOCATION(40.7128, -74.0060), "km")
```

---

### 5.6 GEOLOCATION(latitude, longitude)

**Definition**
Creates a geolocation value.

**Examples**

```java
GEOLOCATION(37.7749, -122.4194)
```

```java
GEOLOCATION(19.0760, 72.8777)
```

---

### 5.7 PICKLISTCOUNT(multiselect_picklist_field)

**Definition**
Returns the number of selected values in a multi-select picklist.

**Examples**

```java
PICKLISTCOUNT(Products__c)
// "TV; Laptop; Mobile" -> 3
```

```java
PICKLISTCOUNT(Hobbies__c)
// Blank -> 0
```

---

### 5.8 CURRENCYRATE(currencyIsoCode)

**Definition**
Returns the conversion rate between the specified currency and the corporate currency.

**Examples**

```java
CURRENCYRATE("USD")
```

```java
Amount__c * CURRENCYRATE("EUR")
```

---

## 6. Reporting and Analytics Functions

---

### 6.1 PARENTGROUPVAL(summary_field, group_level)

**Definition**
Returns a summary value from a parent group in a report.

**Examples**

```java
PARENTGROUPVAL(SUM(Amount), GRAND_SUMMARY)
```

```java
PARENTGROUPVAL(SUM(Amount), REGION)
```

---

### 6.2 PREVGROUPVAL(summary_field, group_level [, increment])

**Definition**
Returns a summary value from a previous group in a report.

**Examples**

```java
PREVGROUPVAL(SUM(Amount), REGION)
// Previous region’s total
```

```java
PREVGROUPVAL(SUM(Revenue__c), MONTH, 1)
// Previous month’s revenue
```

---

## 7. Advanced Platform Functions

---

### 7.1 GETSESSIONID()

**Definition**
Returns the current user’s session ID as text.

**Examples**

```java
GETSESSIONID()
```

**Notes**

- Mainly for legacy Visualforce or URL button integrations.

---

### 7.2 GETRECORDIDS()

**Definition**
Returns the IDs of selected records in a Lightning list view or console.

**Examples**

```java
GETRECORDIDS()
```

```java
"Selected: " & GETRECORDIDS()
```

---

### 7.3 INCLUDE(article_reference)

**Definition**
Used in Salesforce Knowledge to include the content of one article inside another.

**Examples**

```java
INCLUDE("Troubleshooting_Steps")
```

---
