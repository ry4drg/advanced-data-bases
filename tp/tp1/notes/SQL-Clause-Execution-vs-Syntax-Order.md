### SQL Clause Execution vs. Syntax Order

In SQL, there is a fundamental distinction between the order in which you **write** a query (Syntax Order) and the order in which the database engine **evaluates** it (Logical Processing Order). 

**The Syntax Order** is the strict grammatical structure you must use when typing a query. If you write the clauses out of order, the database will return a syntax error.
> `SELECT` → `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `ORDER BY`

**The Logical Processing Order** is the sequence in which the database engine actually executes the query behind the scenes. Understanding this order is critical for writing correct SQL.
1.  **`FROM`**: The engine identifies and gathers the source tables.
2.  **`WHERE`**: The engine filters individual rows based on specific conditions.
3.  **`GROUP BY`**: Remaining rows are grouped together based on common values.
4.  **`HAVING`**: The engine filters the grouped data.
5.  **`SELECT`**: The engine calculates the final columns, aliases, and aggregate functions to output.
6.  **`ORDER BY`**: The final results are sorted.

**Practical Implication:**
Because `WHERE` (Step 2) is evaluated *before* `SELECT` (Step 5) and *before* aggregation (Step 3), you cannot use aggregate functions (like `AVG()`, `SUM()`) or column aliases inside a `WHERE` clause. At the moment the `WHERE` clause is evaluated, the aggregates have not yet been calculated, and the aliases do not yet exist. To filter by an aggregate, you must use the `HAVING` clause.
