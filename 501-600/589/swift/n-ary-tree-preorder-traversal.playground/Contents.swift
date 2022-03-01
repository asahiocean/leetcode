import Foundation

// 589. N-ary Tree Preorder Traversal
// https://leetcode.com/problems/n-ary-tree-preorder-traversal/

class Solution {
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var result = [root.val]
        root.children.forEach {
            result += preorder($0)
        }
        return result
    }
}

// MARK: - Node -

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
