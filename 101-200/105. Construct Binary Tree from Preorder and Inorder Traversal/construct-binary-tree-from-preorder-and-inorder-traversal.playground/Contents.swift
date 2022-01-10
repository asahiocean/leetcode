import Foundation

// 105. Construct Binary Tree from Preorder and Inorder Traversal
// https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/

class Solution {
    private typealias Values = (order: Array<Int>, s: Int, e: Int)
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        let lenPO = preorder.count, lenIO = inorder.count
        guard lenPO == lenIO else { return nil }
        return helper(PRE: (preorder, 0, lenPO - 1), IN: (inorder, 0, lenIO - 1))
    }
    
    private func helper(PRE: Values, IN: Values) -> TreeNode? {
        guard PRE.s <= PRE.e && IN.s <= IN.e else { return nil }
        
        guard let rootIdx = IN.order.firstIndex(of: PRE.order[PRE.s]) else { return nil }
        
        let root = TreeNode(PRE.order[PRE.s])
        
        root.left = helper(PRE: (PRE.order, PRE.s + 1, PRE.s + rootIdx - IN.s),
                           IN: (IN.order, IN.s, rootIdx - 1))
        
        root.right = helper(PRE: (PRE.order, PRE.s + rootIdx - IN.s + 1, PRE.e),
                            IN: (IN.order, rootIdx + 1, IN.e))
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
