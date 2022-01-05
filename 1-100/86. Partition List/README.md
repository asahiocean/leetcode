### [86. Partition List](https://leetcode.com/problems/partition-list/)

Given the  ```head``` of a linked list and a value ```x```, partition it such that all nodes **less than** ```x``` come before **nodes greater than or equal** to ```x```.

You should **preserve** the original relative order of the nodes in each of the two partitions.

#### Example 1:

![](https://assets.leetcode.com/uploads/2021/01/04/partition.jpg)

```swift
Input: head = [1,4,3,2,5,2], x = 3
Output: [1,2,2,4,3,5]
```

#### Example 2:
```swift
Input: head = [2,1], x = 2
Output: [1,2]
```

#### Constraints:
```swift
The number of nodes in the list is in the range [0, 200].
-100 <= Node.val <= 100
-200 <= x <= 200
```

### Solution
```swift
import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let prevgag = ListNode(0), postgag = ListNode(0)
        var prev = prevgag, post = postgag
        
        var node: ListNode? = head
        
        while node != nil {
            let next = node!.next
            node!.next = nil
            
            if node!.val < x {
                prev.next = node
                prev = prev.next!
            } else {
                post.next = node
                post = post.next!
            }
            node = next
        }
        prev.next = postgag.next
        return prevgag.next
    }
}

func tests() {
    let s = Solution()
    for item in [1,4,3,2,5,2] {
        assert((s.partition(.init(item), 3) != nil))
    }
    
}
tests()
```
