import Foundation

// 138. Copy List with Random Pointer
// https://leetcode.com/problems/copy-list-with-random-pointer/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        if head == nil { return nil }
        
        var node = head, idx = 0
        
        while let nod = node {
            nod.val = (nod.val + 10000) | (idx << 32)
            node = nod.next
            idx += 1
        }
        
        var nodes: [Node?] = []
        node = head
        
        while let nod = node {
            let new = Node((nod.val & Int(UInt32.max)) - 10000)
            if !nodes.isEmpty { nodes[nodes.count - 1]?.next = new }
            nodes.append(new)
            node = nod.next
        }
        
        node = head
        idx = 0
        
        while let nod = node {
            if let rand = nod.random {
                nodes[idx]?.random = nodes[rand.val >> 32]
            }
            node = node?.next
            idx += 1
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
