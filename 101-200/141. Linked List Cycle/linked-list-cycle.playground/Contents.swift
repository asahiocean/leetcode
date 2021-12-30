import Foundation

// 141. Linked List Cycle
// https://leetcode.com/problems/linked-list-cycle/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }
        var curr = head, next = head?.next
        
        while curr !== next {
            if curr == nil || next == nil { return false }
            curr = curr?.next
            next = next?.next?.next
        }
        return true
    }
}
