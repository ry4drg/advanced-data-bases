### Comparing `<` and `<>` in Self-Joins

When finding pairs of entities that share a common attribute (e.g., students who took the same course), a self-join is used. The choice of comparison operator in the `WHERE` clause—specifically `<` versus `<>`—drastically changes the output.

**Using the `<` Operator:**
*   **Syntax:** `WHERE s1.id < s2.id`
*   **Behavior:** This operator enforces a strict mathematical ordering. It ensures that the first student's ID must be smaller than the second's.
*   **Result:** It prevents duplicate, mirrored pairs and prevents pairing a row with itself. If Student A and Student B share a class, the query will output `(A, B)` but will suppress `(B, A)` because B's ID is not less than A's.

**Using the `<>` (Not Equal) Operator:**
*   **Syntax:** `WHERE s1.id <> s2.id`
*   **Behavior:** This operator only enforces that the two entities are not the exact same row. It allows either ID to be greater than or less than the other.
*   **Result:** It generates a "mirrored" output. If Student A and Student B share a class, the query will output both `(A, B)` and `(B, A)`. Furthermore, the `DISTINCT` keyword will not remove these duplicates, because `(A, B)` and `(B, A)` are considered distinct rows in a result set (the columns are ordered differently).

**Summary Rule:** When generating unordered pairs of items using a self-join, always use the `<` or `>` operator rather than `<>` to avoid duplicate mirrored pairs.
