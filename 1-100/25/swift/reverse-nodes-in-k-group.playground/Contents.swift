import Foundation

// 25. Reverse Nodes in k-Group
// https://leetcode.com/problems/reverse-nodes-in-k-group/

class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let node = ListNode(0)
        node.next = head
        
        var prev = node
        
        while prev.next != nil {
            var tail: ListNode? = prev
            for _ in 1...k { tail = tail?.next }
            guard var node = tail else { break }
            
            let next = node.next
            var last = next
            var curr = prev.next
            
            while curr !== next {
                let cnext = curr!.next
                curr!.next = last
                last = curr
                curr = cnext
            }
            if let pnext = prev.next { node = pnext }
            prev.next = last
            prev = node
        }
        return node.next
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.020 (0.022) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.reverseKGroup(ListNode([1,2,3,4,5]), 2)
        XCTAssertEqual(value?.val, ListNode([2,1,4,3,5])?.val)
    }
    
    func test1() {
        let value = solution.reverseKGroup(ListNode([1,2,3,4,5]), 3)
        XCTAssertEqual(value?.val, ListNode([3,2,1,4,5])?.val)
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
        var prev: ListNode = self
        for i in 1..<array.count {
            let new = ListNode(array[i])
            prev.next = new
            prev = new
        }
    }
}
