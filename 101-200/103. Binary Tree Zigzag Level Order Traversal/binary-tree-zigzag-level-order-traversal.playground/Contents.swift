import Foundation

// 103. Binary Tree Zigzag Level Order Traversal
// https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var values: [[Int]] = []
        dfs(root, 0, &values)
        return values
    }
    
    private func dfs(_ node: TreeNode?, _ lev: Int, _ arrs: inout [[Int]]) {
        guard let node = node else { return }
        if arrs.count <= lev { arrs.append([]) }
        
        if lev % 2 == 0 {
            arrs[lev].append(node.val)
        } else {
            arrs[lev].insert(node.val, at: 0)
        }
        
        dfs(node.left, lev + 1, &arrs)
        dfs(node.right, lev + 1, &arrs)
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
