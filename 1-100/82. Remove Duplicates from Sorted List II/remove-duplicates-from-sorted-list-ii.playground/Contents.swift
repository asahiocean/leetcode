import Foundation

// 82. Remove Duplicates from Sorted List II
// https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        if let headNode = head, headNode.next == nil { return headNode }
        
        let dummy = ListNode(0)
        dummy.next = head
        var node = dummy
        
        while let nn = node.next, nn.next != nil {
            if nn.val == nn.next?.val {
                while nn.val == node.next?.val {
                    node.next = node.next!.next
                }
            } else {
                node = nn
            }
        }
        return dummy.next
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.019 (0.021) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.deleteDuplicates(ListNode([1,2,3,3,4,4,5]))
        XCTAssertEqual(value, ListNode([1,2,5]))
    }
    
    func test1() {
        let value = solution.deleteDuplicates(ListNode([1,1,1,2,3]))
        XCTAssertEqual(value, ListNode([2,3]))
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
