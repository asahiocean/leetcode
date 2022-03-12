import Foundation

// 138. Copy List with Random Pointer
// https://leetcode.com/problems/copy-list-with-random-pointer/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        if head == nil { return nil }
        
        var temp = head, idx = 0
        
        while let tmp = temp {
            tmp.val = (tmp.val + 10000) | (idx << 32)
            temp = tmp.next
            idx += 1
        }
        
        var nodes: [Node?] = []
        temp = head
        
        while let tmp = temp {
            let node = Node((tmp.val & Int(UInt32.max)) - 10000)
            if !nodes.isEmpty { nodes[nodes.count - 1]?.next = node }
            nodes.append(node)
            temp = tmp.next
        }
        
        temp = head
        idx = 0
        
        while let tmp = temp {
            if let rand = tmp.random {
                nodes[idx]?.random = nodes[rand.val >> 32]
            }
            temp = temp?.next
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
