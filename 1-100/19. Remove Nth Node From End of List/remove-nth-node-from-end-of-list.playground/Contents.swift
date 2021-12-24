import Foundation

// 19. Remove Nth Node From End of List
// https://leetcode.com/problems/remove-nth-node-from-end-of-list/

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let node = ListNode(0)
        node.next = head
        
        var prev: ListNode? = node
        var post: ListNode? = node
        
        for _ in 0..<n {
            guard let next = post?.next else { continue }
            post = next
        }
        
        while let postNext = post?.next, let prevNext = prev?.next {
            prev = prevNext
            post = postNext
        }
        
        prev!.next = prev!.next!.next
        
        return node.next
    }
}

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

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.034 (0.036) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.removeNthFromEnd(ListNode([1,2,3,4,5]), 2)
        XCTAssertEqual(value, ListNode([1,2,3,5]))
    }
    func test1() {
        let value = solution.removeNthFromEnd(ListNode([1]), 1)
        XCTAssertEqual(value, ListNode([]))
    }
    func test2() {
        let value = solution.removeNthFromEnd(ListNode([1,2]), 1)
        XCTAssertEqual(value, ListNode([1]))
    }
}

Tests.defaultTestSuite.run()
