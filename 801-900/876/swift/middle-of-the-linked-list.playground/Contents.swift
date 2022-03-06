import Foundation

// 876. Middle of the Linked List
// https://leetcode.com/problems/middle-of-the-linked-list/

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var middle = head, last = head
        while last != nil && last?.next != nil {
            last = last?.next?.next
            middle = middle?.next
        }
        return middle
    }
}

// MARK: - ListNode -

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
