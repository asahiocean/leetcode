import Foundation

// 230. Kth Smallest Element in a BST
// https://leetcode.com/problems/kth-smallest-element-in-a-bst/

class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack: [TreeNode] = [], curr = root, val = k
        
        while !stack.isEmpty || curr != nil {
            if curr != nil {
                stack.append(curr!)
                curr = curr!.left
            } else {
                let node = stack.removeLast()
                val -= 1
                if val == 0 { return node.val }
                curr = node.right
            }
        }
        return -1
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
