import Foundation

// 21. Merge Two Sorted Lists
// https://leetcode.com/problems/merge-two-sorted-lists/

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil { return l1 == nil ? l2 : l1 }
        if l1!.val <= l2!.val {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
}

// MARK: - Tests cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

class Tests {
    
    private typealias sol = Solution
    private typealias LN = ListNode
    
    static func testExample1() {
        let node = sol().mergeTwoLists(LN([1,2,4]), LN([1,3,4]))
        print(node?.val == LN([1,1,2,3,4,4])?.val)
    }
    
    static func testExample2() {
        let node = sol().mergeTwoLists(LN([]), LN([]))
        print(node?.val == LN([])?.val)
    }
    
    static func testExample3() {
        let node = sol().mergeTwoLists(LN([]), LN([0]))
        print(node?.val == LN([0])?.val)
    }
}

Tests.testExample1()
Tests.testExample2()
Tests.testExample3()

// MARK: - ListNode -

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public init?(_ array: [Int]) {
        guard !array.isEmpty else { return nil }
        self.val = array[0]
        var node = self
        for i in 1..<array.count {
            let next = ListNode(array[i])
            node.next = next
            node = next
        }
    }
}
