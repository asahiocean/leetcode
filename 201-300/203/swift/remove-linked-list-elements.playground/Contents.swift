import Foundation

// 203. Remove Linked List Elements
// https://leetcode.com/problems/remove-linked-list-elements/

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        guard let head = head else { return nil }
        
        let dummy = ListNode(0)
        dummy.next = head
        
        var node = dummy
        
        while let next = node.next {
            next.val == val ? (node.next = next.next) : (node = next)
        }
        
        return dummy.next
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
