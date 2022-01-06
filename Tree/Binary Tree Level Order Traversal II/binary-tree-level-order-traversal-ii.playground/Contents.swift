import Foundation

// 107. Binary Tree Level Order Traversal II
// https://leetcode.com/problems/binary-tree-level-order-traversal-ii/

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else { return [] }
        var tree = [node], result: [[Int]] = []
        while !tree.isEmpty {
            result.insert(tree.map { $0.val }, at: 0)
            tree = tree.flatMap { [$0.left, $0.right] }.compactMap{ $0 }
        }
        return result
    }
}

// MARK: - Test cases -

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.levelOrderBottom(TreeNode([3,9,20,nil,nil,15,7]))
        XCTAssertEqual(value, [[15,7],[9,20],[3]])
    }
    
    func test1() {
        let value = solution.levelOrderBottom(TreeNode([1]))
        XCTAssertEqual(value, [[1]])
    }
    
    func test2() {
        let value = solution.levelOrderBottom(TreeNode([]))
        XCTAssertEqual(value, [])
    }
}

Tests.defaultTestSuite.run()

// MARK: - TreeNode Class

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
    
    // Making an additional initializer from an array of integers
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
