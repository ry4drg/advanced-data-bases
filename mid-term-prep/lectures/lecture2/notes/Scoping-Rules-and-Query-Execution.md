### Scoping Rules and Query Execution

**Scoping** refers to which tables and columns a query can "see" at any given time. When working with subqueries, the database follows a specific hierarchy :

1.  **Inner Scope:** The subquery can access any tables defined within its own `SELECT` statement.
2.  **Outer Scope:** The subquery can also access tables defined in the outer query that contains it.
3.  **The Golden Rule:** The **outer query cannot see tables defined inside the subquery** unless the subquery's result is explicitly aliased and treated as a table in the outer `FROM` clause.

Let's look at the examples to see this in action.

#### Example A: The Successful Query
```sql
SELECT mytable.dept_name, mytable.avg_salary
FROM (
    SELECT dept_name, avg(salary) as avg_salary
    FROM teacher
    GROUP BY dept_name
) as mytable
WHERE mytable.avg_salary >= 42000;
```
*   **How it works:** The inner query (in the `FROM` clause) calculates the average salary per department and creates a temporary table. The keyword `as mytable` gives this temporary table a name. 
*   **The Scope:** The outer query's `WHERE` clause only knows about `mytable`, so it can easily filter `mytable.avg_salary`. This is perfectly valid.

#### Example B: The Failing Query (and the Scoping Error)
```sql
SELECT mytable.dept_name, mytable.avg_salary
FROM (
    SELECT dept_name, avg(salary) as avg_salary
    FROM teacher
    GROUP BY dept_name
) as mytable
WHERE mytable.avg_salary >= 
      (SELECT max(B.avg_salary) 
       FROM mytable as B); -- ERROR HERE
```
*   **Why it fails:** Look at the innermost subquery: `(SELECT max(B.avg_salary) FROM mytable as B)`. It is trying to query `mytable`. However, **`mytable` only exists in the outer query**. When the database tries to run the inner subquery first, it looks for a table called `mytable` in the global database schema, cannot find it, and throws the error: `relation "mytable" does not exist`.
*   **The Fix:** If you want to filter the outer query based on a calculation from the temporary table, you cannot reference `mytable` inside another subquery in the `WHERE` clause. You would need to restructure the query (e.g., using a `WITH` clause or a `JOIN`).

#### The Precedence Rule
The bottom of the slide states: *"if same table name globally and locally: local name takes precedence."*
This is a standard programming concept known as **variable shadowing**. If you have a real, permanent table in your database named `teacher`, but you also alias a subquery inside your query as `teacher`, the SQL engine will assume you are referring to the inner, local subquery alias, not the global table.
