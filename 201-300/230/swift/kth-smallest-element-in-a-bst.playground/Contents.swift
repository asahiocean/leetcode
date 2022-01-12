import Foundation

// 230. Kth Smallest Element in a BST
// https://leetcode.com/problems/kth-smallest-element-in-a-bst/

class Solution {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        
        var stack: [TreeNode] = [], currNode = root, valK = k
        
        while !stack.isEmpty || currNode != nil {
            if let node = currNode {
                stack.append(node)
                currNode = node.left
            } else {
                let last = stack.removeLast()
                valK -= 1
                if valK == 0 { return last.val }
                currNode = last.right
            }
        }
        return -1
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
