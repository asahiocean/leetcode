import Foundation

// 21. Merge Two Sorted Lists
// https://leetcode.com/problems/merge-two-sorted-lists/

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        guard l1.val < l2.val else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
        l1.next = mergeTwoLists(l1.next, l2)
        return l1
    }
}

// MARK: - ListNode -

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    // An additional initializer that can be used to implement nodes from an array
    public init?(_ array: [Int]) {
        guard !array.isEmpty else { return nil }
        self.val = array[0]
        var prev: ListNode = self
        for i in 1..<array.count {
            let new = ListNode(array[i])
            prev.next = new
            prev = new
        }
    }
}

// Extension for ListNode

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}

// MARK: - Tests cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.021 (0.023) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let listNode1 = ListNode([1,2,4])
        let listNode2 = ListNode([1,3,4])
        let expected = ListNode([1,1,2,3,4,4])
        XCTAssertEqual(solution.mergeTwoLists(listNode1, listNode2), expected)
    }
    
    func test1() {
        let listNode1 = ListNode([])
        let listNode2 = ListNode([])
        let expected = ListNode([])
        XCTAssertEqual(solution.mergeTwoLists(listNode1, listNode2), expected)
    }
    
    func test2() {
        let listNode1 = ListNode([])
        let listNode2 = ListNode([0])
        let expected = ListNode([0])
        XCTAssertEqual(solution.mergeTwoLists(listNode1, listNode2), expected)
    }
}

Tests.defaultTestSuite.run()
