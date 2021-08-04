import Foundation

// 814. Binary Tree Pruning
// https://leetcode.com/problems/binary-tree-pruning/

class Solution {
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        if root.val == 0, root.left == nil, root.right == nil { return nil }
        
        let left = pruneTree(root.left), right = pruneTree(root.right)
        
        if root.val == 0, left == nil, right == nil { return nil }
        (root.left,root.right) = (left,right)
        
        return root
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
