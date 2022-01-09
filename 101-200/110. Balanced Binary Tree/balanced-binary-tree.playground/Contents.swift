import Foundation

// 110. Balanced Binary Tree
// https://leetcode.com/problems/balanced-binary-tree/

class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let node = root else { return true }
        if !isBalanced(node.left) || !isBalanced(node.right) { return false }
        func valid(_ root: TreeNode?) -> Int {
            guard let root = root else { return -1 }
            return 1 + max(valid(root.left), valid(root.right))
        }
        let l = valid(node.left), r  = valid(node.right)
        return (abs(l - r) <= 1)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.052 (0.054) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isBalanced(TreeNode([3,9,20,nil,nil,15,7]))
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.isBalanced(TreeNode([1,2,2,3,3,nil,nil,4,4]))
        XCTAssertEqual(value, false)
    }
    
    func test2() {
        let value = solution.isBalanced(TreeNode([]))
        XCTAssertEqual(value, true)
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
                node.left = .init(val)
                queue.append(node.left!)
            }
            if !values.isEmpty, let val = values.removeFirst() {
                node.right = .init(val)
                queue.append(node.right!)
            }
        }
    }
}
