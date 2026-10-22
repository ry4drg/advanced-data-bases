### Concept: Manual Ranking in SQL (Self-Joins)

Before the introduction of modern window functions (like `RANK()` or `DENSE_RANK()`), calculating the rank of a row within a group required a specific algorithmic approach using a **self-join**. 

The core logic is simple: **To find a row's rank, count how many rows perform strictly better than it, and add 1.**

However, the exact way you write the comparison operator dictates how ties are handled. There are two primary ranking methods.

#### Method 1: Standard Competition Ranking ("Share the last position")
In standard ranking (often used in sports), if multiple rows tie, they occupy all the subsequent rank positions, and the next row skips ahead. 

**The Rule:** Ties share the *last* position of their tied group. 
**The Formula:** To achieve this in SQL, you count how many people have a salary **greater than or equal to** (`>=`) the current person, and you must exclude the person from counting themselves (`A.id <> B.id`).

**Example Data:**
1. Alice: $100,000
2. Bob: $90,000
3. Charlie: $90,000
4. David: $80,000

**How the database calculates this for Bob:**
*   The database looks at Bob.
*   It scans the table for anyone with a salary `>=` Bob's salary, ignoring Bob himself.
*   It finds Alice ($100k) and Charlie ($90k). That is **2** people.
*   It adds 1. Bob's rank is **3**.

**How the database calculates this for David:**
*   It scans for salaries `>=` $80k (ignoring David).
*   It finds Alice, Bob, and Charlie. That is **3** people.
*   It adds 1. David's rank is **4**.

*Resulting Ranks:* 1, 3, 3, 4. Notice that rank 2 is skipped, and Bob and Charlie share the last tied position (3).

#### Method 2: Dense Ranking
In dense ranking, ties do not leave gaps in the numbering sequence. If two people tie for 2nd place, the next person is 3rd.

**The Rule:** Ties share the *first* position of their group.
**The Formula:** To achieve this, you count how many people have a salary **strictly greater than** (`>`) the current person. 

**How the database calculates this for Bob:**
*   It scans for salaries `>` $90k.
*   It only finds Alice. That is **1** person.
*   It adds 1. Bob's rank is **2**.

**How the database calculates this for David:**
*   It scans for salaries `>` $80k.
*   It finds Alice, Bob, and Charlie. That is **3** people.
*   It adds 1. David's rank is **4**.

*Resulting Ranks:* 1, 2, 2, 3. The rankings are dense with no skipped numbers.

#### The Slide's Notation
The text on the slide, *"for the usual rank use B.salary > A.salary and add 1"*, is technically describing **Dense Ranking**. 

However, because the first line explicitly states *"ties share the last position"*, the slide contains a slight contradiction. If you strictly want ties to share the last position (Method 1), you must use `>=` in your condition (and ensure you do not count the row itself). If you use `>` as the slide suggests, ties will share the *first* position (Method 2).
