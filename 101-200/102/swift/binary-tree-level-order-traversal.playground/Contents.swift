import Foundation

// 102. Binary Tree Level Order Traversal
// https://leetcode.com/problems/binary-tree-level-order-traversal/

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        guard let root = root else { return [] }
        
        var nodes: [[Int]] = []
        var level = [root]
        
        while !level.isEmpty {
            nodes.append(level.map({$0.val}))
            level = level.flatMap({[$0.left, $0.right]}).compactMap({$0})
        }
        return nodes
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
