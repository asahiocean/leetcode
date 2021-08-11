## [181. Employees Earning More Than Their Managers](https://leetcode.com/problems/employees-earning-more-than-their-managers/)

<div class="content__u3I1 question-content__JfgR"><div class="sql-schema-wrapper__3VBi"><a class="sql-schema-link__3cEg">SQL Schema<svg viewBox="0 0 24 24" width="1em" height="1em" class="icon__1Md2"><path fill-rule="evenodd" d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"></path></svg></a></div><div><p>The <code>Employee</code> table holds all employees including their managers. Every employee has an Id, and there is also a column for the manager Id.</p>

<pre>+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
</pre>

<p>Given the <code>Employee</code> table, write a SQL query that finds out employees who earn more than their managers. For the above table, Joe is the only employee who earns more than his manager.</p>

<pre>+----------+
| Employee |
+----------+
| Joe      |
+----------+
</pre>
</div></div>