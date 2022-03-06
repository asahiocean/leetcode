import Foundation

// 404. Sum of Left Leaves
// https://leetcode.com/problems/sum-of-left-leaves/

class Solution {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        var val = 0
        func dfs(_ node: TreeNode?, _ isLeft: Bool) {
            guard let node = node else { return }
            let lhs = node.left, rhs = node.right
            if lhs == nil && rhs == nil && isLeft {
                val += node.val
            }
            dfs(lhs, true)
            dfs(rhs, false)
        }
        dfs(root, false)
        return val
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
