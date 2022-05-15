import Foundation

// 1302. Deepest Leaves Sum
// https://leetcode.com/problems/deepest-leaves-sum/

class Solution {
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var val = -1, queue = [root]
        while !queue.isEmpty {
            val = 0
            var lvl = [TreeNode]()
            for n in queue {
                if let lhs = n.left { lvl.append(lhs) }
                if let rhs = n.right { lvl.append(rhs) }
                val += n.val
            }
            queue = lvl
        }
        return val
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
