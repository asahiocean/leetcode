import Foundation

// 117. Populating Next Right Pointers in Each Node II
// https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var queue = [root], prev: Node?, len = queue.count
        
        while !queue.isEmpty {
            len -= 1
            let node = queue.removeFirst()
            node.next = prev
            prev = node
            if let rhs = node.right { queue.append(rhs) }
            if let lhs = node.left { queue.append(lhs) }
            if len == 0 { len = queue.count; prev = nil }
        }
        return root
    }
}

// MARK: - Node -

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}
