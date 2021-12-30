import Foundation

// 61. Rotate List
// https://leetcode.com/problems/rotate-list/

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else { return nil }
        
        var n = 0, node = head
        
        while node.next != nil {
            node = node.next!
            n += 1
        }
        n += 1
        
        node.next = head
        node = head
        
        var i = 0
        
        while (i < (n - k % n)-1) {
            i += 1
            node = node.next!
        }
        let newHead = node.next
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
