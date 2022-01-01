import Foundation

// 24. Swap Nodes in Pairs
// https://leetcode.com/problems/swap-nodes-in-pairs/

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        
        var head = head, node = head, pre: ListNode?
        
        while node != nil && node!.next != nil {
            let cur = node!.next!, tmp = cur.next
            
            pre == nil ? (head = cur) : (pre!.next = cur)
            
            cur.next = node
            node!.next = tmp
            
            pre = node
            node = tmp
        }
        return head
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.swapPairs(ListNode([1,2,3,4]))
        XCTAssertEqual(value, ListNode([2,1,4,3]))
    }
    
    func test1() {
        let value = solution.swapPairs(ListNode([]))
        XCTAssertEqual(value, ListNode([]))
    }
    
    func test2() {
        let value = solution.swapPairs(ListNode([1]))
        XCTAssertEqual(value, ListNode([1]))
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

// Extension for ListNode

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}
