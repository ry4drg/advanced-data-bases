### The Standard Rule: HAVING requires GROUP BY
In the logical processing order of a query, `HAVING` is specifically designed to filter the **mini-tables (groups)** created by the `GROUP BY` clause. 

*   `WHERE` filters individual rows.
*   `GROUP BY` creates the groups.
*   `HAVING` filters those groups.

If you try to use `HAVING` to filter individual rows without grouping them first, you are using the wrong tool. (For example, you cannot write `HAVING salary > 50000` if you haven't grouped the data, because `salary` represents individual rows, not a group summary).

### The Exception: Using HAVING without GROUP BY
There is one scenario where SQL allows you to write `HAVING` without explicitly writing `GROUP BY`: **When your query treats the entire table as one single group.**

If you use an aggregate function (like `AVG()`, `MAX()`, `SUM()`) in your `SELECT` or `HAVING` clause without a `GROUP BY`, the database automatically assumes you want to group the *entire table* into one giant bucket.

**Example:**
```sql
SELECT AVG(salary)
FROM teacher
HAVING AVG(salary) > 50000;
```
*   **How the database processes this:** 
    1. It grabs the whole `teacher` table.
    2. It calculates the average salary of the entire table (e.g., $60,000).
    3. It checks the `HAVING` clause: Is $60,000 > $50,000? Yes.
    4. It outputs the single row result: `$60,000`. 

If the average had been $40,000, the `HAVING` condition would fail, and the query would return **zero rows**.

### Why use HAVING here instead of WHERE?
You might wonder, *"Why not just use `WHERE AVG(salary) > 50000`?"* 

As we discussed in a previous lesson, you **cannot** use aggregate functions in a `WHERE` clause because `WHERE` runs before the aggregates are calculated. So, if you need to filter based on a calculation of the *entire table*, you are forced to use `HAVING`.

### Summary
*   **99% of the time:** If you write `HAVING`, you must have a `GROUP BY` clause because you are filtering specific groups (e.g., "Show me departments where the average salary > 50k").
*   **The Exception:** You can use `HAVING` without `GROUP BY` only if you are applying an aggregate function to the entire table and treating the whole table as one single group. 

*(Note: While the exception is legal SQL, it is often considered bad practice or confusing code. It is usually cleaner to use a subquery or simply filter the results in your application code if you are treating the whole table as one group).*
