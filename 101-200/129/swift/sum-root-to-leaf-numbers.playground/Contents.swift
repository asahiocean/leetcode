import Foundation

// 129. Sum Root to Leaf Numbers
// https://leetcode.com/problems/sum-root-to-leaf-numbers/

class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var result = 0
        
        var queue: [(TreeNode, Int)] = []
        queue.append((root, 0))
        
        while !queue.isEmpty {
            let (node, val) = queue.removeFirst()
            let sum = ((10 * val) + node.val)
            
            let (left, right) = (node.left, node.right)
            if left == nil && right == nil { result += sum }
            
            if let left = left { queue.append((left, sum)) }
            if let right = right { queue.append((right, sum)) }
        }
        return result
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
