import Foundation

// 94. Binary Tree Inorder Traversal
// https://leetcode.com/problems/binary-tree-inorder-traversal/

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var head = root, nodes: [TreeNode] = [], result: [Int] = []
        
        while head != nil || !nodes.isEmpty {
            if let node = head {
                nodes.append(node)
                head = node.left
            } else {
                let last = nodes.removeLast()
                result.append(last.val)
                head = last.right
            }
        }
        return result
    }
}

// MARK: - Test Cases -

// Result: Executed 5 tests, with 0 failures (0 unexpected) in 0.046 (0.048) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let tree = TreeNode([1,nil,2,3])
        let value = solution.inorderTraversal(tree)
        XCTAssertEqual(value, [1,3,2])
    }
    
    func test1() {
        let tree = TreeNode([])
        let value = solution.inorderTraversal(tree)
        XCTAssertEqual(value, [])
    }
    
    func test2() {
        let tree = TreeNode([1])
        let value = solution.inorderTraversal(tree)
        XCTAssertEqual(value, [1])
    }
    
    func test3() {
        let tree = TreeNode([1,2])
        let value = solution.inorderTraversal(tree)
        XCTAssertEqual(value, [2,1])
    }
    
    func test4() {
        let tree = TreeNode([1,nil,2])
        let value = solution.inorderTraversal(tree)
        XCTAssertEqual(value, [1,2])
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
