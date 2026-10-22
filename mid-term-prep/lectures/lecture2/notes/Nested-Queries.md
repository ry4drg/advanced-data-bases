### Nested Queries (Subqueries)

A **nested query** (or subquery) is a complete SQL `SELECT` statement embedded inside another SQL statement. Subqueries are used to break down complex problems into smaller, manageable steps.

**Where can subqueries be used?**
Subqueries must always be enclosed in parentheses `()` and can appear in several key clauses:

*   **`FROM` clause:** Used to create a temporary table (often called a derived table) that the outer query can select from.
*   **`WHERE` clause:** Used to provide a list of values or a specific condition for filtering rows. A common example is using the `IN` operator (e.g., `WHERE id IN (SELECT id FROM...)`).
*   **`SELECT` clause:** Used to calculate a single value that is added as a new column in the final output.
*   **`HAVING` clause:** Used to filter groups (mini-tables) based on an aggregated condition calculated in the subquery.

**Important Caveat:** While powerful, subqueries can often be inefficient because the database might have to execute the inner query repeatedly for every row processed by the outer query. In modern SQL, it is generally preferred to use `JOIN` operations or Common Table Expressions (CTEs) for better performance.
