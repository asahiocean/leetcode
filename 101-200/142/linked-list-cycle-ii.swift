import Foundation

// 142. Linked List Cycle II
// https://leetcode.com/problems/linked-list-cycle-ii/

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var lhs = head, rhs = head
        while rhs != nil, let next = rhs?.next {
            lhs = lhs?.next
            rhs = next.next
            if lhs === rhs { break }
        }
        lhs = head
        while lhs !== rhs {
            lhs = lhs?.next
            rhs = rhs?.next
        }
        return rhs == nil || rhs?.next == nil ? nil : lhs
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
