import Foundation

// 100. Same Tree
// https://leetcode.com/problems/same-tree/

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p, let q = q, p.val == q.val else { return q == nil && p == nil }
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.023 (0.025) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isSameTree(TreeNode([1,2,3]), TreeNode([1,2,3]))
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.isSameTree(TreeNode([1,2]), TreeNode([1,nil,2]))
        XCTAssertEqual(value, false)
    }
    
    func test2() {
        let value = solution.isSameTree(TreeNode([1,2,1]), TreeNode([1,1,2]))
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()

// MARK: - TreeNode -

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    public init?(_ array: [Int?]) {
        var values = array
        guard !values.isEmpty, let head = values.removeFirst() else { return nil }
        
        val = head; left = nil; right = nil
        
        var queue = [self]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if !values.isEmpty, let val = values.removeFirst() {
                node.left = TreeNode(val)
                queue.append(node.left!)
            }
            if !values.isEmpty, let val = values.removeFirst() {
                node.right = TreeNode(val)
                queue.append(node.right!)
            }
        }
    }
}

// To pass the tests

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right && lhs.val == rhs.val
    }
}
