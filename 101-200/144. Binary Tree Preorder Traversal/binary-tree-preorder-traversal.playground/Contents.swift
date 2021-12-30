import Foundation

// 144. Binary Tree Preorder Traversal
// https://leetcode.com/problems/binary-tree-preorder-traversal/

class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var node = root, stack = [TreeNode](), result = [Int]()
        
        while !stack.isEmpty || node != nil {
            if node == nil {
                node = stack.removeLast().right
            } else {
                result.append(node!.val)
                stack.append(node!)
                node = node!.left
            }
        }
        return result
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
