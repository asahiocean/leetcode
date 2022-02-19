<h1>
25. Reverse Nodes in k-Group
<img src="https://tinyurl.com/3wnfw9kh" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let node = ListNode(0)
        node.next = head
        
        var prev = node
        
        while prev.next != nil {
            var tail: ListNode? = prev
            for _ in 1...k { tail = tail?.next }
            guard var node = tail else { break }
            
            let next = node.next
            var last = next
            var curr = prev.next
            
            while curr !== next {
                let cnext = curr!.next
                curr!.next = last
                last = curr
                curr = cnext
            }
            if let pnext = prev.next { node = pnext }
            prev.next = last
            prev = node
        }
        return node.next
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/a7c3fc143a6c4252eaee997ac244ee21">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/reverse-nodes-in-k-group/discuss/1656819/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

<p>
Given the <code>head</code> of a linked list, reverse the nodes of the list <code>k</code> at a time, and return <em>the modified list</em>.

<code>k</code> is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of <code>k</code> then left-out nodes, in the end, should remain as it is.

You may not alter the values in the list&#39;s nodes, only nodes themselves may be changed.
</p>

<h4>Example 1</h4>

<p>
<img src="https://assets.leetcode.com/uploads/2020/10/03/reverse_ex1.jpg">
</p>

<pre>
<b>Input:</b> head = [1,2,3,4,5], k = 2
<b>Output:</b> [2,1,4,3,5]
</pre>

<h4>Example 2</h4>

<p>
<img src="https://assets.leetcode.com/uploads/2020/10/03/reverse_ex2.jpg">
</p>

<pre>
<b>Input:</b> head = [1,2,3,4,5], k = 3
<b>Output:</b> [3,2,1,4,5]
</pre>

<h4>Constraints</h4>

<ul>
<li>The number of nodes in the list is <code>n</code>.</li>
<li><code>1 <= k <= n <= 5000</code></li>
<li><code>0 <= Node.val <= 1000</code></li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/reverse-nodes-in-k-group/