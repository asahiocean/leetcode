import Foundation

// 206. Reverse Linked List
// https://leetcode.com/problems/reverse-linked-list/

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let node = head else { return nil }
        if node.next == nil { return node }
        let newHead = reverseList(node.next)
        let nextNode = node.next
        nextNode?.next = node
        node.next = nil
        return newHead
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
