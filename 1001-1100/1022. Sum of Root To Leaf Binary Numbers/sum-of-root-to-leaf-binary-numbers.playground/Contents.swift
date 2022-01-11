import Foundation

// 1022. Sum of Root To Leaf Binary Numbers
// https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/

class Solution {
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var sum = 0
        var path = 0
        
        func dfs(_ root: TreeNode?) {
            guard let root = root else { return }
            path = path << 1 + root.val
            
            if root.left == nil && root.right == nil {
                sum += path
            }
            
            dfs(root.left)
            dfs(root.right)
            path >>= 1
        }
        
        dfs(root)
        return sum
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
