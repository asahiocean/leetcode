import Foundation

// 589. N-ary Tree Preorder Traversal
// https://leetcode.com/problems/n-ary-tree-preorder-traversal/

class Solution {
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        return [root.val] + root.children.flatMap({ preorder($0) })
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
