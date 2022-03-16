import Foundation

// 1367. Linked List in Binary Tree
// https://leetcode.com/problems/linked-list-in-binary-tree/

class Solution {
    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let head = head else { return true }
        guard let root = root else { return false }
        return dfs(head, root) || isSubPath(head, root.left) || isSubPath(head, root.right)
    }
    
    private func dfs(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let head = head else { return true }
        guard let root = root else { return false }
        return (head.val == root.val) && (dfs(head.next, root.left) || (dfs(head.next, root.right)))
    }
}

// MARK: - ListNode -

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
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
