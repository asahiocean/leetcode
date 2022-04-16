import Foundation

// 538. Convert BST to Greater Tree
// https://leetcode.com/problems/convert-bst-to-greater-tree/

class Solution {
    private var val = 0
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        convertBST(root.right)
        val += root.val
        root.val = val
        convertBST(root.left)
        return root
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
