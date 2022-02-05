<h1>
23. Merge k Sorted Lists
<img src="https://tinyurl.com/2ehcruny" align="right" alt="views badge">
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
        
        var arr: [Int] = []
        
        for list in lists.compactMap ({ $0 }) {
            var head: ListNode? = list
            while head != nil {
                arr.append(head!.val)
                head = head?.next
            }
        }
        arr.sort()
        if arr.isEmpty { return nil }
        
        let node = ListNode(0)
        var curr = ListNode(arr[0])
        node.next = curr
        
        for n in arr.dropFirst() {
            let tmp = ListNode(n)
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

<h2>Description</h2>

<p>
You are given an array of `k` linked-lists `lists`, each linked-list is sorted in ascending order.

_Merge all the linked-lists into one sorted linked-list and return it._
</p>

<h4>Example 1</h4>

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

<h4>Example 2</h4>

<pre>
<b>Input:</b> lists = []
<b>Output:</b> []
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> lists = [[]]
<b>Output:</b> []
</pre>

<h4>Constraints</h4>

<ul>
<li><code>k == lists.length</code></li>
<li><code>0 <= k <= 10^4</code></li>
<li><code>0 <= lists[i].length <= 500</code></li>
<li><code>-10^4 <= lists[i][j] <= 10^4</code></li>
<li><code>lists[i]</code> is sorted in <strong>ascending order</strong>.</li>
<li>The sum of <code>lists[i].length</code> won't exceed <code>10^4</code>.</li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/merge-k-sorted-lists/