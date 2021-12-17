import Foundation

// 19. Remove Nth Node From End of List
// https://leetcode.com/problems/remove-nth-node-from-end-of-list/

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let node = ListNode(0)
        node.next = head
        
        var prev: ListNode? = node
        var post: ListNode? = node
        
        for _ in 0..<n {
            guard let next = post?.next else { continue }
            post = next
        }
        
        while post!.next != nil {
            prev = prev!.next
            post = post!.next
        }
        prev!.next = prev!.next!.next
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
