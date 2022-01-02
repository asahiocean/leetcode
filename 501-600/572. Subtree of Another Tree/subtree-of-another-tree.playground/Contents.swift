import Foundation

// 572. Subtree of Another Tree
// https://leetcode.com/problems/subtree-of-another-tree/

class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root = root, let sub = subRoot else { return root == nil && subRoot == nil }
        return isEqual(root, sub) || isSubtree(root.left, sub) || isSubtree(root.right, sub)
    }
    private func isEqual(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
        guard let treeL = l, let treeR = r else { return l == nil && r == nil }
        return treeL.val == treeR.val && isEqual(treeL.left, treeR.left) && isEqual(treeL.right, treeR.right)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.034 (0.036) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isSubtree(TreeNode([3,4,5,1,2]), TreeNode([4,1,2]))
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.isSubtree(TreeNode([3,4,5,1,2,nil,nil,nil,nil,0]), TreeNode([4,1,2]))
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
