import Foundation

// 108. Convert Sorted Array to Binary Search Tree
// https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return helper(0, nums.count - 1, nums)
    }
    private func helper(_ l: Int, _ r: Int, _ input: [Int]) -> TreeNode? {
        guard l <= r else { return nil }
        let mid = (l + r)/2
        let root = TreeNode(input[mid])
        root.left = helper(l,mid - 1, input)
        root.right = helper(mid + 1, r, input)
        return root
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
