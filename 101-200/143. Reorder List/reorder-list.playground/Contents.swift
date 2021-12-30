import Foundation

// 143. Reorder List
// https://leetcode.com/problems/reorder-list/

class Solution {
    func reorderList(_ head: ListNode?) {
        guard let head = head else { return }
        
        var prevNode: ListNode? = head
        var postNode: ListNode? = head
        
        split(&prevNode, &postNode)
        prevNode = head
        
        postNode = reverse(&postNode)
        merge(&prevNode, &postNode)
    }
    
    private func split(_ prev: inout ListNode?, _ post: inout ListNode?) {
        while post != nil && post!.next != nil {
            prev = prev!.next
            post = post!.next!.next
        }
        guard let next = prev!.next else { return }
        post = next
        prev!.next = nil
    }
    
    private func reverse(_ head: inout ListNode?) -> ListNode? {
        var prevNode = head
        var tempNode: ListNode?
        while prevNode != nil {
            let post = prevNode!.next
            prevNode!.next = tempNode
            tempNode = prevNode
            prevNode = post
        }
        return tempNode
    }
    
    private func merge(_ prev: inout ListNode?, _ post: inout ListNode?) {
        while prev != nil && post != nil {
            let prevNext = prev!.next
            let postNext = post!.next
            prev!.next = post
            post!.next = prevNext
            prev = prevNext
            post = postNext
        }
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
