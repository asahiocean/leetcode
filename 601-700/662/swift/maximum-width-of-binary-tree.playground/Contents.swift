import Foundation

// 662. Maximum Width of Binary Tree
// https://leetcode.com/problems/maximum-width-of-binary-tree/

class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        typealias Node = (tree: TreeNode, val: Int)
        var queue: [Node] = [(root, 0)]
        var result = 0
        
        while !queue.isEmpty {
            let lnq = queue.count
            let lhs = queue[0].val
            let rhs = queue[lnq-1].val
            result = max(result, rhs - lhs + 1)
            var start = 0
            for i in 0..<lnq {
                let first = queue.removeFirst()
                if i == 0 { start = first.val }
                let node = first.tree
                let idx = first.val - start
                if let left = node.left {
                    queue.append((left, idx * 2 + 1))
                }
                if let right = node.right {
                    queue.append((right, idx * 2 + 2))
                }
            }
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
