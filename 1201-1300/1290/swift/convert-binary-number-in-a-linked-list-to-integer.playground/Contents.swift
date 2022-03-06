import Foundation

// 1290. Convert Binary Number in a Linked List to Integer
// https://leetcode.com/problems/convert-binary-number-in-a-linked-list-to-integer/

class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        var node = head, val = 0
        while node != nil {
            val = val << 1
            val += node!.val
            node = node?.next
        }
        return val
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
