import Foundation

// 145. Binary Tree Postorder Traversal
// https://leetcode.com/problems/binary-tree-postorder-traversal/

class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var node = root, stack = [TreeNode](), result = [Int]()
        
        while !stack.isEmpty || node != nil {
            if node == nil {
                node = stack.removeLast().left
            } else {
                result.insert(node!.val, at: 0)
                stack.append(node!)
                node = node!.right
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
