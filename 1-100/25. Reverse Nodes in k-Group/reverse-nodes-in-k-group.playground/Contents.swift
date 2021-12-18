import Foundation

// 25. Reverse Nodes in k-Group
// https://leetcode.com/problems/reverse-nodes-in-k-group/

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let node = ListNode(0)
        node.next = head
        
        var prev = node
        while prev.next != nil {
            var tail: ListNode? = prev
            for _ in 1...k { tail = tail?.next }
            if tail == nil { break }
            
            let nextHead = tail!.next
            var last = nextHead
            var curr = prev.next
            while curr != nil && curr !== nextHead {
                let next = curr!.next
                curr!.next = last
                last = curr
                curr = next
            }
            tail = prev.next
            prev.next = last
            prev = tail!
        }
        return node.next
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
