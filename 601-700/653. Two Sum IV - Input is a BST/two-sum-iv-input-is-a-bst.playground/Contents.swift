import Foundation

// 653. Two Sum IV - Input is a BST
// https://leetcode.com/problems/two-sum-iv-input-is-a-bst/

class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let root = root else { return false }
        
        var stack = [TreeNode]()
        var set = Set<Int>()
        var cur: TreeNode? = root
        
        while !stack.isEmpty || cur != nil {
            while cur != nil {
                stack.append(cur!)
                cur = cur?.left
            }
            cur = stack.removeLast()
            if set.contains(k - cur!.val) {
                return true
            }
            set.insert(cur!.val)
            cur = cur?.right
        }
        return false
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
