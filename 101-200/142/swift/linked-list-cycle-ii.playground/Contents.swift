import Foundation

// 142. Linked List Cycle II
// https://leetcode.com/problems/linked-list-cycle-ii/

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        
        var left = head, right = head
        
        while right != nil, let next = right?.next {
            left = left?.next
            right = next.next
            if left === right { break }
        }
        
        left = head
        
        while left !== right {
            left = left?.next
            right = right?.next
        }
        return right == nil || right?.next == nil ? nil : left
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
