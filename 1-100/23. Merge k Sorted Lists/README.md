<h1>
23. Merge k Sorted Lists
<img src="https://tinyurl.com/2pjx52rs" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var sorted = [Int]()
        for list in lists.compactMap ({ $0 }) {
            var head: ListNode? = list
            while head != nil {
                sorted.append(head!.val)
                head = head?.next
            }
        }
        sorted.sort()
        if sorted.isEmpty { return nil }
        
        let node = ListNode(0)
        var curr = ListNode(sorted[0])
        node.next = curr
        
        for n in sorted.dropFirst() {
            let tmp: ListNode? = ListNode(n)
            curr.next = tmp
            if let next = curr.next { curr = next }
        }
        return node.next
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/5f4e413b42574002dc59ec44cc643404">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/merge-k-sorted-lists/discuss/1656809/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

You are given an array of `k` linked-lists `lists`, each linked-list is sorted in ascending order.

_Merge all the linked-lists into one sorted linked-list and return it._

#### Example 1

<pre>
<b>Input:</b> lists = [[1,4,5],[1,3,4],[2,6]]
<b>Output:</b> [1,1,2,3,4,4,5,6]
<b>Explanation:</b> The linked-lists are:
[
  1->4->5,
  1->3->4,
  2->6
]
merging them into one sorted list:
1->1->2->3->4->4->5->6
</pre>

#### Example 2

<pre>
<b>Input:</b> lists = []
<b>Output:</b> []
</pre>

#### Example 3

<pre>
<b>Input:</b> lists = [[]]
<b>Output:</b> []
</pre>

#### Constraints

* `k == lists.length`
* `0 <= k <= 10^4`
* `0 <= lists[i].length <= 500`
* `-10^4 <= lists[i][j] <= 10^4`
* `lists[i]` is sorted in **ascending order**.
* The sum of `lists[i].length` won't exceed `10^4`.

---

**Source:** https://leetcode.com/problems/merge-k-sorted-lists/
