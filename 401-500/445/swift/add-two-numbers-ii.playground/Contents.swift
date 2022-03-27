import Foundation

// 445. Add Two Numbers II
// https://leetcode.com/problems/add-two-numbers-ii/

class Solution {
    internal typealias LN = ListNode
    func addTwoNumbers(_ l1: LN?, _ l2: LN?) -> LN? {
        var cnt1 = 0, cnt2 = 0
        var lhs = l1, rhs = l2
        
        while lhs != nil {
            lhs = lhs?.next; cnt1 += 1
        }
        while rhs != nil {
            rhs = rhs?.next; cnt2 += 1
        }
        
        lhs = l1
        rhs = l2
        var head: LN?
        
        while cnt1 > 0, cnt2 > 0 {
            var val = 0
            if cnt1 >= cnt2 {
                val += lhs?.val ?? 0
                lhs = lhs?.next
                cnt1 -= 1
            }
            if cnt1 < cnt2 {
                val += rhs?.val ?? 0
                rhs = rhs?.next
                cnt2 -= 1
            }
            let new = LN(val)
            new.next = head
            head = new
        }
        
        lhs = head
        head = nil
        var dig = 0
        
        while let cur = lhs {
            let val = (cur.val + dig) % 10
            dig = (cur.val + dig) / 10
            
            let new = LN(val)
            new.next = head
            head = new
            
            lhs = cur.next
        }
        if dig != 0 {
            let new = LN(dig)
            new.next = head
            head = new
        }
        return head
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
