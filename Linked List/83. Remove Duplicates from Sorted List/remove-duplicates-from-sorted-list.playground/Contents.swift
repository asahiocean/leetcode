import Foundation

// 83. Remove Duplicates from Sorted List
// https://leetcode.com/problems/remove-duplicates-from-sorted-list/

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard var node = head else { return nil }
        while let next = node.next {
            node.val == next.val ? (node.next = next.next) : (node = next)
        }
        return head
    }
}

// MARK: - Test Cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.deleteDuplicates(ListNode([1,1,2]))
        let expected = ListNode([1,2])
        XCTAssertEqual(value?.val, expected?.val)
    }
    
    func test1() {
        let value = solution.deleteDuplicates(ListNode([1,1,2,3,3]))
        let expected = ListNode([1,2,3])
        XCTAssertEqual(value?.val, expected?.val)
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
