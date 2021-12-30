import Foundation

// 617. Merge Two Binary Trees
// https://leetcode.com/problems/merge-two-binary-trees/

class Solution {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else { return root2 }
        guard let root2 = root2 else { return root1 }
        
        let treeNode = TreeNode(root1.val + root2.val)
        treeNode.left = mergeTrees(root1.left, root2.left)
        treeNode.right = mergeTrees(root1.right, root2.right)
        return treeNode
    }
}

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
