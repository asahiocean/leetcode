import Foundation

// 450. Delete Node in a BST
// https://leetcode.com/problems/delete-node-in-a-bst/

class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        
        guard let root = root else { return nil }
        
        switch (root.val, root.left, root.right) {
        case let (val,left,right) where val == key:
            if left != nil, let min = minNode(right) {
                root.val = min.val
                root.right = deleteNode(right, min.val)
            } else {
                return right != nil ? right : left
            }
        case let (val,left,_) where val > key:
            root.left = deleteNode(left, key)
        case let (val,_,right) where val < key:
            root.right = deleteNode(right, key)
        default: fatalError()
        }
        return root
    }
    private func minNode(_ node: TreeNode?) -> TreeNode? {
        var node = node
        while node?.left != nil {
            node = node?.left
        }
        return node
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
