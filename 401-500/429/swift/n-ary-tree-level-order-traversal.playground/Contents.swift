import Foundation

// 429. N-ary Tree Level Order Traversal
// https://leetcode.com/problems/n-ary-tree-level-order-traversal/

class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let root = root else { return [] }
        var lvls: [[Int]] = []
        var queue = [root]
        while !queue.isEmpty {
            var lvl: [Int] = []
            var size = queue.count
            while size > 0 {
                let node = queue.removeFirst()
                lvl.append(node.val)
                size -= 1
                queue.append(contentsOf: node.children)
            }
            lvls.append(lvl)
        }
        return lvls
    }
}

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
