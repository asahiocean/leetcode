import Foundation

// 21. Merge Two Sorted Lists
// https://leetcode.com/problems/merge-two-sorted-lists/

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil { return l1 == nil ? l2 : l1 }
        if l1!.val < l2!.val {
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

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.mergeTwoLists(ListNode([1,2,4]), ListNode([1,3,4]))
        XCTAssertEqual(value?.val, ListNode([1,1,2,3,4,4])?.val)
    }
    
    func test1() {
        let value = solution.mergeTwoLists(ListNode([]), ListNode([]))
        XCTAssertEqual(value?.val, ListNode([])?.val)
    }
    
    func test2() {
        let value = solution.mergeTwoLists(ListNode([]), ListNode([0]))
        XCTAssertEqual(value?.val, ListNode([0])?.val)
    }
}

Tests.defaultTestSuite.run()

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
