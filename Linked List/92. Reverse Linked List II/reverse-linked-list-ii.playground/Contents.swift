import Foundation

// 92. Reverse Linked List II
// https://leetcode.com/problems/reverse-linked-list-ii/

class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if head == nil || left >= right { return head }
        
        let node = ListNode(0)
        node.next = head
        
        var n: ListNode?
        (0..<left).forEach { _ in
            n = n == nil ? node : n?.next
        }
        
        let nn = n?.next
        var count = right - left
        while count > 0 {
            let temp = nn?.next
            nn?.next = temp?.next
            temp?.next = n?.next
            n?.next = temp
            count -= 1
        }
        return node.next
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.148 (0.150) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.reverseBetween(.init([1,2,3,4,5]),2,4)
        XCTAssertEqual(res, .init([1,4,3,2,5]))
    }
    func test1() {
        let res = s.reverseBetween(.init([5]),1,1)
        XCTAssertEqual(res, .init([5]))
    }
}

Tests.defaultTestSuite.run()

public class ListNode: Equatable {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    init?(_ values: [Int]) {
        guard let first = values.first else { return nil }
        self.val = first
        self.append(contentsOf: values.dropFirst())
    }
    private func append<S: Sequence>(contentsOf values: S) where S.Iterator.Element == Int {
        var curr = self
        while let next = curr.next { curr = next }
        values.forEach {
            let new = ListNode($0)
            curr.next = new
            curr = new
        }
    }
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        var newLhs: ListNode? = lhs, newRhs: ListNode? = rhs
        while let l = newLhs, let r = newRhs, l.val == r.val {
            newLhs = l.next; newRhs = r.next
        }
        return newLhs == nil && newRhs == nil
    }
}
