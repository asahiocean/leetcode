import Foundation

// 145. Binary Tree Postorder Traversal
// https://leetcode.com/problems/binary-tree-postorder-traversal/

class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        
        var dummy: TreeNode? = root
        var stack: [TreeNode] = [], result: [Int] = []
        
        while !stack.isEmpty || dummy != nil {
            if dummy == nil {
                dummy = stack.removeLast().left
            } else if let node = dummy {
                result.insert(node.val, at: 0)
                stack.append(node)
                dummy = node.right
            }
        }
        return result
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
