import Foundation

// 142. Linked List Cycle II
// https://leetcode.com/problems/linked-list-cycle-ii/

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        var slow: ListNode? = head
        var fast: ListNode? = head
        
        while fast != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast { break }
        }
        
        slow = head
        
        while slow !== fast {
            slow = slow?.next
            fast = fast?.next
        }
        return fast == nil || fast?.next == nil ? nil : slow
    }
}

// MARK: - ListNode -

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
