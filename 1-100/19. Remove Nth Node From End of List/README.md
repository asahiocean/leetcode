<h1>
19. Remove Nth Node From End of List
<img src="https://tinyurl.com/2hja3bhz" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let node = ListNode(0)
        node.next = head
        
        var prev: ListNode? = node
        var post: ListNode? = node
        
        for _ in 0..<n {
            guard let next = post?.next else { continue }
            post = next
        }
        
        while let postNext = post?.next, let prevNext = prev?.next {
            prev = prevNext
            post = postNext
        }
        
        prev!.next = prev!.next!.next
        
        return node.next
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/1c34f7dd1cc2de8afe7f47ee1fea394b">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/remove-nth-node-from-end-of-list/discuss/1644146/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given the `head` of a linked list, remove the `n<sup>th</sup>` node from the end of the list and return its head.

#### Example 1

<p>
<img src="https://assets.leetcode.com/uploads/2020/10/03/remove_ex1.jpg" height="180">
</p>

<pre>
<b>Input:</b> head = [1,2,3,4,5], n = 2
<b>Output:</b> [1,2,3,5]
</pre>

#### Example 2

<pre>
<b>Input:</b> head = [1], n = 1
<b>Output:</b> []
</pre>

#### Example 3

<pre>
<b>Input:</b> head = [1,2], n = 1
<b>Output:</b> [1]
</pre>

#### Constraints

* The number of nodes in the list is `sz`.
* `1 <= sz <= 30`
* `0 <= Node.val <= 100`
* `1 <= n <= sz`

---

**Source:** https://leetcode.com/problems/remove-nth-node-from-end-of-list/
