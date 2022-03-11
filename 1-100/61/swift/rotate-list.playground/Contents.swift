import Foundation

// 61. Rotate List
// https://leetcode.com/problems/rotate-list/

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil { return nil }
        
        var prev = head, post = head
        
        let len = lnCalc(head)
        var places = (k % len)
        
        while places > 0 {
            post = post?.next
            places -= 1
        }
        
        while let postnext = post?.next {
            post = postnext
            prev = prev?.next
        }
        post?.next = head
        post = prev?.next
        prev?.next = nil
        return post
    }
    private func lnCalc(_ head: ListNode?) -> Int {
        var val = 0
        var dummy = head
        while let node = dummy {
            dummy = node.next
            val += 1
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
