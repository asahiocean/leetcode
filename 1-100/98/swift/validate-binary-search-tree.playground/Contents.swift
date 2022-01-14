import Foundation

// 98. Validate Binary Search Tree
// https://leetcode.com/problems/validate-binary-search-tree/

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(root)
    }
    private func helper(_ node: TreeNode?, _ min: Int? = nil, _ max: Int? = nil) -> Bool {
        guard let node = node else { return true }
        if let min = min, node.val <= min { return false }
        if let max = max, node.val >= max { return false }
        return helper(node.left, min, node.val) && helper(node.right, node.val, max)
    }
}

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
}
