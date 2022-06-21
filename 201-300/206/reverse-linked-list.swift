import Foundation

// 206. Reverse Linked List
// https://leetcode.com/problems/reverse-linked-list/

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let root = head, var rhs = root.next else { return head }
        let node = reverseList(rhs)
        rhs.next = root
        root.next = nil
        return node
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