import Foundation

// 138. Copy List with Random Pointer
// https://leetcode.com/problems/copy-list-with-random-pointer/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else { return nil }
        
        var curr: Node? = head
        var id = 0
        
        while let node = curr {
            node.val = (node.val + 10000) | (id << 32)
            curr = curr?.next
            id += 1
        }
        
        var nodes: [Node?] = []
        curr = head
        
        while let node = curr {
            let copy = Node((node.val & Int(UInt32.max)) - 10000)
            if !nodes.isEmpty {
                nodes[nodes.count - 1]?.next = copy
            }
            nodes.append(copy)
            curr = curr?.next
        }
        
        curr = head
        id = 0
        
        while let node = curr {
            if let next = node.random {
                nodes[id]?.random = nodes[next.val >> 32]
            }
            curr = curr?.next
            id += 1
        }
        return nodes[0]
    }
}

// MARK: - Node -

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
