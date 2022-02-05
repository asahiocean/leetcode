import Foundation

// 23. Merge k Sorted Lists
// https://leetcode.com/problems/merge-k-sorted-lists/

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        var arr: [Int] = []
        
        for list in lists.compactMap ({ $0 }) {
            var head: ListNode? = list
            while head != nil {
                arr.append(head!.val)
                head = head?.next
            }
        }
        arr.sort()
        if arr.isEmpty { return nil }
        
        let node = ListNode(0)
        var curr = ListNode(arr[0])
        node.next = curr
        
        for n in arr.dropFirst() {
            let tmp = ListNode(n)
            curr.next = tmp
            if let next = curr.next { curr = next }
        }
        return node.next
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.021 (0.023) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// The linked-lists are:
    /// [
    ///   1->4->5,
    ///   1->3->4,
    ///   2->6
    /// ]
    /// merging them into one sorted list:
    /// 1->1->2->3->4->4->5->6
    func test0() {
        let lists = [ListNode([1, 4, 5]), ListNode([1, 3, 4]), ListNode([2, 6])]
        let value = solution.mergeKLists(lists)
        XCTAssertEqual(value?.val, ListNode([1,1,2,3,4,4,5,6])?.val)
    }
    
    func test1() {
        let value = solution.mergeKLists([ListNode([])])
        XCTAssertEqual(value?.val, ListNode([])?.val)
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
