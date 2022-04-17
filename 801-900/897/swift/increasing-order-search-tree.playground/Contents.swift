import Foundation

// 897. Increasing Order Search Tree
// https://leetcode.com/problems/increasing-order-search-tree/

class Solution {
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        let dummy: TreeNode? = TreeNode(0)
        var head = dummy
        func traverse(_ node: TreeNode?) {
            guard let node = node else { return }
            traverse(node.left)
            head?.right = TreeNode(node.val)
            head = head?.right
            traverse(node.right)
        }
        traverse(root)
        return dummy?.right
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
