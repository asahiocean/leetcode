import Foundation

// 109. Convert Sorted List to Binary Search Tree
// https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/

class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        
        var vals: [Int?] = []
        var node = head
        
        while node != nil {
            vals.append(node?.val)
            node = node?.next
        }
        return createBST(vals)
    }
    
    private func createBST(_ vals: [Int?]) -> TreeNode? {
        guard !vals.isEmpty else { return nil }
        
        let mid = vals.count / 2
        guard let val = vals[mid] else { return nil }
        
        let root = TreeNode(val)
        root.left = createBST(Array(vals[0..<mid]))
        root.right = createBST(Array(vals[(mid + 1)...]))
        
        return root
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
