import Foundation

// 876. Middle of the Linked List
// https://leetcode.com/problems/middle-of-the-linked-list/

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        var mid = head, root = head
        while root != nil && root?.next != nil {
            root = root?.next?.next
            mid = mid?.next
        }
        return mid
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
