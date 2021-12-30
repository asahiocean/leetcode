import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil { return nil }
        var a = headA, b = headB
        while a !== b {
            a = a != nil ? a?.next : headB
            b = b != nil ? b?.next : headA
        }
        return a
    }
}

#warning("TODO: Tests")
