import Foundation

// 1305. All Elements in Two Binary Search Trees
// https://leetcode.com/problems/all-elements-in-two-binary-search-trees/

class Solution {
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        func inorder(_ root: TreeNode?, _ out: inout [Int]) {
            guard let root = root else { return }
            inorder(root.left, &out)
            out.append(root.val)
            inorder(root.right, &out)
        }
        var tree = [Int]()
        inorder(root1, &tree)
        inorder(root2, &tree)
        return tree.sorted()
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
