<h1>
2. Add Two Numbers
<img src="https://tinyurl.com/2p95z8fm" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    private var anchor = 0
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil && anchor == 0 { return nil }
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + anchor
        anchor = sum / 10
        let node: ListNode? = ListNode(sum % 10, addTwoNumbers(l1?.next, l2?.next))
        return node
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/523e9887f86452c7eeed8e0f039850fd">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/add-two-numbers/discuss/1128713">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

<p>
You are given two <b>non-empty</b> linked lists representing two non-negative integers. The digits are stored in <b>reverse order</b>, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.
</p>

<h4>Example 1</h4>

<p>
<img src="https://assets.leetcode.com/uploads/2020/10/02/addtwonumber1.jpg" width="300" />
</p>

<pre>
<b>Input:</b> l1 = [2,4,3], l2 = [5,6,4]
<b>Output:</b> [7,0,8]
<b>Explanation:</b> 342 + 465 = 807.
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> l1 = [0], l2 = [0]
<b>Output:</b> [0]
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
<b>Output:</b> [8,9,9,9,0,0,0,1]
</pre>

<h4>Constraints</h4>

<ul>
<li>The number of nodes in each linked list is in the range <code>[1, 100]</code>.</li>
<li><code>0 <= Node.val <= 9</code></li>
<li>It is guaranteed that the list represents a number that does not have leading zeros.</li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/add-two-numbers/