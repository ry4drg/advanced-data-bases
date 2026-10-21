### Table Access and Relational Joins

In a relational database, data is intentionally distributed across multiple tables to prevent redundancy (normalization). Because of this, it is rarely possible to answer a complex business question by accessing a single table in isolation.

**The Problem:**
If a query asks to "Compute the table of all teacher names and the courses they taught," the required data is split:
*   The `teacher` table contains the `name`.
*   The `teaches` table contains the `course_id`.

If you query the `teacher` table alone, you have no course data. If you query the `teaches` table alone, you have no names. The data must be accessed simultaneously.

**The Solution:**
SQL resolves this by using **Joins**. A join allows a single query to access multiple tables at the same time and stitch them together using a common column (a foreign key). 

While older SQL syntax uses a comma-separated list in the `FROM` clause (e.g., `FROM table1, table2`) and places the join conditions in the `WHERE` clause, modern best practice utilizes the explicit `JOIN ... ON` syntax. This explicit syntax tells the database exactly how to link the tables before filtering, which is both more readable and significantly more efficient for the database engine to process.
