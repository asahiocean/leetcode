import Foundation

// 82. Remove Duplicates from Sorted List II
// https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }
        
        let startNode = ListNode(0)
        startNode.next = head
        var node = startNode
        
        while let nodeNext = node.next, nodeNext.next != nil {
            if nodeNext.val == nodeNext.next?.val {
                while nodeNext.val == node.next?.val {
                    node.next = node.next!.next
                }
            } else {
                node = nodeNext
            }
        }
        return startNode.next
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.019 (0.021) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.deleteDuplicates(ListNode([1,2,3,3,4,4,5]))
        XCTAssertEqual(value?.val, ListNode([1,2,5])?.val)
    }
    
    func test1() {
        let value = solution.deleteDuplicates(ListNode([1,1,1,2,3]))
        XCTAssertEqual(value?.val, ListNode([2,3])?.val)
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
    
    init?(_ values: [Int]) {
        guard let firstVal = values.first else { return nil }
        self.val = firstVal
        var current = self
        while let next = current.next {
            current = next
        }
        for n in values.dropFirst() {
            let newNode = ListNode(n)
            current.next = newNode
            current = newNode
        }
    }
}
