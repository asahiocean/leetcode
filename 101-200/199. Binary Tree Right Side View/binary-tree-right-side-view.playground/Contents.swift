import Foundation

// 199. Binary Tree Right Side View
// https://leetcode.com/problems/binary-tree-right-side-view/

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        var values: [Int] = []
        guard let root = root else { return values }
        
        var nodes: [TreeNode] = []
        
        func add(_ node: TreeNode?) {
            if let node = node { nodes.append(node) }
        }
        
        add(root)
        
        while nodes.count > 0 {
            let size = nodes.count
            for i in 0..<size {
                let node = nodes.removeFirst()
                if size == i + 1 {
                    values.append(node.val)
                }
                add(node.left)
                add(node.right)
            }
        }
        return values
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
