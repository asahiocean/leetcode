<h1>
21. Merge Two Sorted Lists
<img src="https://tinyurl.com/yc2aw6rp" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        guard l1.val < l2.val else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
        l1.next = mergeTwoLists(l1.next, l2)
        return l1
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/918c730cfecff65c65c92174d2b14008">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/merge-two-sorted-lists/discuss/1132854/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

Merge two sorted linked lists and return it as a **sorted** list. The list should be made by splicing together the nodes of the first two lists.
 
<h4>Example 1</h4>

<pre>
<b>Input:</b> l1 = [1,2,4], l2 = [1,3,4]
<b>Output:</b> [1,1,2,3,4,4]
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> l1 = [], l2 = []
<b>Output:</b> []
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> l1 = [], l2 = [0]
<b>Output:</b> [0]
</pre>

<h4>Constraints</h4>

<ul>
<li>The number of nodes in both lists is in the range <code>[0, 50]</code>.</li>
<li><code>-100 &lt;= Node.val &lt;= 100</code></li>
<li>Both <code>list1</code> and <code>list2</code> are sorted in <strong>non-decreasing</strong> order.</li>
</ul>

---

**Source:** https://leetcode.com/problems/merge-two-sorted-lists/