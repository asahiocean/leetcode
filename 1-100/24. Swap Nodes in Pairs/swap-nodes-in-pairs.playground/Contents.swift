import Foundation

// 24. Swap Nodes in Pairs
// https://leetcode.com/problems/swap-nodes-in-pairs/

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        var head = head, node = head, pre: ListNode?
        
        while node != nil && node!.next != nil {
            let cur = node!.next!, tmp = cur.next
            
            pre == nil ? (head = cur) : (pre!.next = cur)
            
            cur.next = node
            node!.next = tmp
            
            pre = node
            node = tmp
        }
        return head
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
