import Foundation

// 143. Reorder List
// https://leetcode.com/problems/reorder-list/

class Solution {
    internal typealias LN = ListNode
    func reorderList(_ head: LN?) {
        guard let head = head else { return }
        var lhs: LN? = head, rhs: LN? = head
        
        split(&lhs, &rhs)
        lhs = head
        
        rhs = reverse(&rhs)
        merge(&lhs, &rhs)
    }
    
    private func split(_ lhs: inout LN?, _ rhs: inout LN?) {
        while rhs != nil && rhs!.next != nil {
            lhs = lhs!.next
            rhs = rhs!.next!.next
        }
        guard let next = lhs!.next else { return }
        rhs = next
        lhs!.next = nil
    }
    
    private func reverse(_ head: inout LN?) -> LN? {
        var lhs = head
        var node: LN?
        while lhs != nil {
            let post = lhs!.next
            lhs!.next = node
            node = lhs
            lhs = post
        }
        return node
    }
    
    private func merge(_ lhs: inout LN?, _ rhs: inout LN?) {
        while lhs != nil && rhs != nil {
            let prev = lhs!.next
            let post = rhs!.next
            lhs!.next = rhs
            rhs!.next = prev
            lhs = prev
            rhs = post
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
