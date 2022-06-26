import Foundation

// 98. Validate Binary Search Tree
// https://leetcode.com/problems/validate-binary-search-tree/

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        func chk(_ n: TreeNode?, _ l: Int?, _ r: Int?) -> Bool {
            guard let val = n?.val else { return true }
            return val <= l ?? .min || val >= r ?? .max ? false : chk(n!.left, l, val) && chk(n!.right, val, r)
        }
        return chk(root, nil, nil)
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
