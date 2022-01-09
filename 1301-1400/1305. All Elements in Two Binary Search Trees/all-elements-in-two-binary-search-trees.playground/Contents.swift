import Foundation

// 1305. All Elements in Two Binary Search Trees
// https://leetcode.com/problems/all-elements-in-two-binary-search-trees/

class Solution {
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var tree: [Int] = []
        inorder(root1, &tree)
        inorder(root2, &tree)
        return tree.sorted()
    }
    private func inorder(_ root: TreeNode?, _ out: inout [Int]) {
        guard let root = root else { return }
        inorder(root.left, &out)
        out.append(root.val)
        inorder(root.right, &out)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.029 (0.031) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.getAllElements(TreeNode([2,1,4]), TreeNode([1,0,3]))
        XCTAssertEqual(value, [0,1,1,2,3,4])
    }
    
    func test1() {
        let value = solution.getAllElements(TreeNode([1,nil,8]), TreeNode([8,1]))
        XCTAssertEqual(value, [1,1,8,8])
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
