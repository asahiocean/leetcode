<h1>
25. Reverse Nodes in k-Group
<img src="https://tinyurl.com/24ywtff7" align="right" alt="views badge">
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
            if tail == nil { break }
            
            let nextHead = tail!.next
            var last = nextHead
            var curr = prev.next
            while curr != nil && curr !== nextHead {
                let next = curr!.next
                curr!.next = last
                last = curr
                curr = next
            }
            tail = prev.next
            prev.next = last
            prev = tail!
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

## Description

Given the `head` of a linked list, reverse the nodes of the list `k` at a time, and return _the modified list_.

`k` is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of `k` then left-out nodes, in the end, should remain as it is.

You may not alter the values in the list's nodes, only nodes themselves may be changed.

#### Example 1

![](https://assets.leetcode.com/uploads/2020/10/03/reverse_ex1.jpg)

<pre>
<b>Input:</b> head = [1,2,3,4,5], k = 2
<b>Output:</b> [2,1,4,3,5]
</pre>

#### Example 2

![](https://assets.leetcode.com/uploads/2020/10/03/reverse_ex2.jpg)

<pre>
<b>Input:</b> head = [1,2,3,4,5], k = 3
<b>Output:</b> [3,2,1,4,5]
</pre>

#### Constraints

* The number of nodes in the list is `n`.
* `1 <= k <= n <= 5000`
* `0 <= Node.val <= 1000`

---

**Source:** https://leetcode.com/problems/reverse-nodes-in-k-group/
