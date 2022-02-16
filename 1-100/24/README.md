<h1>
24. Swap Nodes in Pairs
<img src="https://tinyurl.com/3yx4r7ev" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var head = head, node = head, pre: ListNode?
        
        while node != nil, let next = node!.next {
            let cur = next, tmp = cur.next
            pre == nil ? (head = cur) : (pre!.next = cur)
            cur.next = node
            node!.next = tmp
            pre = node
            node = tmp
        }
        return head
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/0c269a6448246b7c312c1c2819fdc0c5">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/swap-nodes-in-pairs/discuss/1656816/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

<p>
Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)
</p>

<h4>Example 1</h4>

![](https://assets.leetcode.com/uploads/2020/10/03/swap_ex1.jpg)

<pre>
<b>Input:</b> head = [1,2,3,4]
<b>Output:</b> [2,1,4,3]
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> head = []
<b>Output:</b> []
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> head = [1]
<b>Output:</b> [1]
</pre>

<h4>Constraints</h4>

<ul>
<li>The number of nodes in the list is in the range <code>[0, 100]</code>.</li>
<li><code>0 <= Node.val <= 100</code></li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/swap-nodes-in-pairs/