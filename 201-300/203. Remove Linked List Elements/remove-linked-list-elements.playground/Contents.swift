import Foundation

// 203. Remove Linked List Elements
// https://leetcode.com/problems/remove-linked-list-elements/

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let temp = ListNode(0)
        temp.next = head
        var node = temp
        while node.next != nil {
            node.next!.val == val ? (node.next = node.next!.next) : (node = node.next!)
        }
        return temp.next
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
