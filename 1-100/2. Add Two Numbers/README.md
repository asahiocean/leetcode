## 2. Add Two Numbers <img src="https://tinyurl.com/3kwwk6sc" alt="views" align="right">

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left">
    <strong>Solution</strong>
</summary>
	
<br/>
	
```swift
class Solution {
    fileprivate var anchor = 0
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil && anchor == 0 { return nil }
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + anchor
        anchor = sum / 10
        return .some(ListNode(sum % 10, addTwoNumbers(l1?.next, l2?.next)))
    }
}	
```
	
**More: [GitHub Gist][gist] • [Pastebin][pb] • [ControlC][cc] • [TextBin][tb]**

**Discuss on [LeetCode][discuss]**

</details>

<p align="center">• • •</p>

## Description:

You are given two **non-empty** linked lists representing two non-negative integers. The digits are stored in **reverse order**, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

#### Example 1:

<p>
<img src="https://assets.leetcode.com/uploads/2020/10/02/addtwonumber1.jpg" width="300" />
</p>

<pre>
<strong>Input:</strong> l1 = [2,4,3], l2 = [5,6,4]
<strong>Output:</strong> [7,0,8]
<strong>Explanation:</strong> 342 + 465 = 807.
</pre>

#### Example 2:

<pre>
<strong>Input:</strong> l1 = [0], l2 = [0]
<strong>Output:</strong> [0]
</pre>

#### Example 3:

<pre>
<strong>Input:</strong> l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
<strong>Output:</strong> [8,9,9,9,0,0,0,1]
</pre>

#### Constraints:

* The number of nodes in each linked list is in the range `[1, 100]`.
* `0 <= Node.val <= 9`
* It is guaranteed that the list represents a number that does not have leading zeros.
	
#
**Source:** https://leetcode.com/problems/add-two-numbers/

<!-- URL -->
[gist]: https://git.io/JEYi7
[pb]: https://pastebin.com/dNbqaHGk
[cc]: https://controlc.com/d430a48b
[tb]: https://textbin.net/lsxgmlfi4r
[discuss]: https://leetcode.com/problems/add-two-numbers/discuss/1128713
