import Foundation

// 160. Intersection of Two Linked Lists
// https://leetcode.com/problems/intersection-of-two-linked-lists/

class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil { return nil }
        var nodeA = headA, nodeB = headB
        while nodeA !== nodeB {
            nodeA = nodeA != nil ? nodeA?.next : headB
            nodeB = nodeB != nil ? nodeB?.next : headA
        }
        return nodeA
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.027 (0.029) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// The intersected node's value is 8 (note that this must not be 0 if the two lists intersect).
    /// From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,6,1,8,4,5].
    /// There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.
    func test0() {
        let common: ListNode = [8, 4, 5]
        let listA = ListNode(4, ListNode(1, common))
        let listB = ListNode(5, ListNode(6, ListNode(1, common)))
        XCTAssertEqual(solution.getIntersectionNode(listA, listB), common)
    }
    
    /// The intersected node's value is 2 (note that this must not be 0 if the two lists intersect).
    /// From the head of A, it reads as [1,9,1,2,4]. From the head of B, it reads as [3,2,4].
    /// There are 3 nodes before the intersected node in A; There are 1 node before the intersected node in B.
    func test1() {
        let common: ListNode = [2, 4]
        let listA = ListNode(1, ListNode(9, ListNode(1, common)))
        let listB = ListNode(3, common)
        XCTAssertEqual(solution.getIntersectionNode(listA, listB), common)
    }
    
    /// From the head of A, it reads as [2,6,4]. From the head of B, it reads as [1,5].
    /// Since the two lists do not intersect, intersectVal must be 0, while skipA and skipB can be arbitrary values.
    /// Explanation: The two lists do not intersect, so return null.
    func test2() {
        XCTAssertNil(solution.getIntersectionNode([2, 6, 4], [1, 5]))
    }
}

Tests.defaultTestSuite.run()

// MARK: - ListNode -

public class ListNode: ExpressibleByArrayLiteral, ExpressibleByStringLiteral {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    private convenience init() { self.init(0) }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }
    
    init?(_ values: [Int]) {
        guard let firstVal = values.first else { return nil }
        self.val = firstVal
        self.append(contentsOf: values.dropFirst())
    }
    
    // Allow initialization as: let listNode: ListNode = "1->2->3"
    public required convenience init(stringLiteral: String) {
        let values = stringLiteral.replacingOccurrences(of: " ", with: "").components(separatedBy: "->").map { Int($0)! }
        guard let firstVal = values.first else {
            fatalError("Invalid Input String. Expecting Format: 1->2->3")
        }
        self.init(firstVal)
        self.append(contentsOf: values.dropFirst())
    }
    
    // Allow initialization as: let listNode: ListNode = [1, 2, 3]
    public required convenience init(arrayLiteral: Int...) {
        guard let firstVal = arrayLiteral.first else {
            fatalError("Cannot be used on empty arrays since they should represent nil")
        }
        self.init(firstVal)
        self.append(contentsOf: arrayLiteral.dropFirst())
    }
    
    private func append<S: Sequence>(contentsOf values: S) where S.Iterator.Element == Int {
        var current = self
        while let next = current.next {
            current = next
        }
        for n in values {
            let newNode = ListNode(n)
            current.next = newNode
            current = newNode
        }
    }
}

// Extension for ListNode

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
}
