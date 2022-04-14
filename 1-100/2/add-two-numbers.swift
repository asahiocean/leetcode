import Foundation

// 2. Add Two Numbers
// https://leetcode.com/problems/add-two-numbers/

class Solution {
    private var dig = 0
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil && dig == 0 { return nil }
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + dig
        dig = sum / 10
        return .init(sum % 10, addTwoNumbers(l1?.next, l2?.next))
    }
}

// Playground and test cases: https://leetcode.com/playground/9oaHp7yF
