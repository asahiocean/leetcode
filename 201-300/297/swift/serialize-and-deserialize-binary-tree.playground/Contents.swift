import Foundation

// 297. Serialize and Deserialize Binary Tree
// https://leetcode.com/problems/serialize-and-deserialize-binary-tree/

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        
        var value = ""
        guard root != nil else { return value }
        
        var queue: [TreeNode?] = [root]
        
        while !queue.isEmpty {
            if let first = queue.removeFirst() {
                value += String(first.val) + ","
                queue.append(first.left)
                queue.append(first.right)
            } else {
                value += "#,"
            }
        }
        return value
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let arr = data.split(separator: ",")
        
        guard !arr.isEmpty, let val = Int(String(arr[0])) else { return nil }
        
        let root = TreeNode(val)
        
        var queue: [TreeNode] = []
        queue.append(root)
        
        var idx = 0, left = true
        
        for i in 1..<arr.count {
            if arr[i] != "#", let val = Int(String(arr[i])) {
                let node = TreeNode(val)
                if left {
                    queue[idx].left = node
                } else {
                    queue[idx].right = node
                }
                queue.append(node)
            }
            if !left { idx += 1 }
            left = !left
        }
        return root
    }
}

// MARK: - TreeNode -

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
