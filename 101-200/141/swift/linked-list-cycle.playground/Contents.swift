import Foundation

// 141. Linked List Cycle
// https://leetcode.com/problems/linked-list-cycle/

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }
        
        var node = head, next = node?.next
        
        while node !== next {
            if node == nil || next == nil { return false }
            node = node?.next
            next = next?.next?.next
        }
        return true
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
