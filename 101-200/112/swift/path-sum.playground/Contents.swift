import Foundation

// 112. Path Sum
// https://leetcode.com/problems/path-sum/

class Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        if targetSum == root.val && root.left == nil && root.right == nil { return true }
        let diff = targetSum - root.val
        return hasPathSum(root.left, diff) || hasPathSum(root.right, diff)
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
