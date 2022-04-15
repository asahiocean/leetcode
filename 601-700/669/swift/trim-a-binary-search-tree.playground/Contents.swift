import Foundation

// 669. Trim a Binary Search Tree
// https://leetcode.com/problems/trim-a-binary-search-tree/

class Solution {
    func trimBST(_ root: TreeNode?, _ l: Int, _ h: Int) -> TreeNode? {
        guard let root = root else { return nil }
        let val = root.val
        if val < l {
            return trimBST(root.right,l,h)
        } else if val > h {
            return trimBST(root.left,l,h)
        } else {
            root.left = trimBST(root.left,l,h)
            root.right = trimBST(root.right,l,h)
            return root
        }
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
