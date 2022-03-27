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

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.033 (0.035) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 342 + 465 = 807
    func test0() {
        let node = solution.addTwoNumbers(ListNode([2,4,3]), ListNode([5,6,4]))
        let expected = ListNode([7,0,8])
        XCTAssertEqual(node?.val, expected?.val)
    }
    
    func test1() {
        let node = solution.addTwoNumbers(ListNode([0]), ListNode([0]))
        let expected = ListNode([0])
        XCTAssertEqual(node?.val, expected?.val)
    }
    
    func test2() {
        let node = solution.addTwoNumbers(ListNode([9,9,9,9,9,9,9]), ListNode([9,9,9,9]))
        let expected = ListNode([8,9,9,9,0,0,0,1])
        XCTAssertEqual(node?.val, expected?.val)
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
        var prev = self
        for i in 1..<array.count {
            let new = ListNode(array[i])
            prev.next = new
            prev = new
        }
    }
}
