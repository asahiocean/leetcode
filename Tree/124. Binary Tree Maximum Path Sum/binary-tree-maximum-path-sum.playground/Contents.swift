import Foundation

// 124. Binary Tree Maximum Path Sum
// https://leetcode.com/problems/binary-tree-maximum-path-sum/

class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min
        dfs(root, &maxSum)
        return maxSum
    }
    private func dfs(_ root: TreeNode?, _ maxSum: inout Int) -> Int {
        guard let root = root else { return 0 }
        let left = max(dfs(root.left, &maxSum), 0)
        let right = max(dfs(root.right, &maxSum), 0)
        maxSum = max(maxSum, (root.val + left + right))
        return root.val + max(left, right)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.067 (0.069) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.maxPathSum(TreeNode([1,2,3]))
        XCTAssertEqual(value, 6)
    }
    func test1() {
        let value = solution.maxPathSum(TreeNode([-10,9,20,nil,nil,15,7]))
        XCTAssertEqual(value, 42)
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
    
    // Additional initializer
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
