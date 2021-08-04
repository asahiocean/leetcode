import Foundation

// 1315. Sum of Nodes with Even-Valued Grandparent
// https://leetcode.com/problems/sum-of-nodes-with-even-valued-grandparent/

class Solution {
    private var value = 0
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        func helper(_ cur: TreeNode?, _ p: TreeNode?, _ grand: TreeNode?) {
            guard let node = cur else { return }
            if let g = grand, g.val % 2 == 0 { value += node.val }
            helper(node.left, node, p)
            helper(node.right, node, p)
        }
        helper(root, nil, nil)
        return value
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
