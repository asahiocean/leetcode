import Foundation

// 814. Binary Tree Pruning
// https://leetcode.com/problems/binary-tree-pruning/

class Solution {
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        if isNull(root.val, root.left, root.right) { return nil }
        
        let left = pruneTree(root.left), right = pruneTree(root.right)
        
        if isNull(root.val, left, right) { return nil }
        
        (root.left,root.right) = (left,right)
        
        return root
    }
    private func isNull(_ val: Int, _ l: TreeNode?, _ r: TreeNode?) -> Bool {
        return val == 0 && l == nil && r == nil
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.020 (0.022) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// Only the red nodes satisfy the property "every subtree not containing a 1".
    /// The diagram on the right represents the answer.
    func test0() {
        let value = solution.pruneTree(TreeNode([1,nil,0,0,1]))
        XCTAssertEqual(value, TreeNode([1,nil,0,nil,1]))
    }
    
    func test1() {
        let value = solution.pruneTree(TreeNode([1,0,1,0,0,0,1]))
        XCTAssertEqual(value, TreeNode([1,nil,1,nil,1]))
    }
    
    func test2() {
        let value = solution.pruneTree(TreeNode([1,1,0,1,1,0,1,0]))
        XCTAssertEqual(value, TreeNode([1,1,0,1,1,nil,1]))
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

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right && lhs.val == rhs.val
    }
}
