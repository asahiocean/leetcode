import Foundation

// 968. Binary Tree Cameras
// https://leetcode.com/problems/binary-tree-cameras/

class Solution {
    func minCameraCover(_ root: TreeNode?) -> Int {
        func calc(_ node: TreeNode?) -> (Int, Int) {
            guard let node = node else { return (1, 0) }
            let lhs = calc(node.left), rhs = calc(node.right), pos = (lhs.0, rhs.0), len = lhs.1 + rhs.1
            return pos == (1,1) ? (3, len + 1) : pos == (3,3) ? (2, len - 1) : (max(lhs.0, rhs.0) - 1, len)
        }
        return calc(root).1
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
