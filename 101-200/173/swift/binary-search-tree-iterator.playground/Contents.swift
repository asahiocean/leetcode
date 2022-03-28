import Foundation

// 173. Binary Search Tree Iterator
// https://leetcode.com/problems/binary-search-tree-iterator/

class BSTIterator {
    
    private(set) var stack: [TreeNode]
    
    init(_ root: TreeNode?) {
        self.stack = []
        loadAllLefts(root)
    }
    
    func next() -> Int {
        let last = stack.removeLast()
        loadAllLefts(last.right)
        return last.val
    }
    
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
    
    private func loadAllLefts(_ root: TreeNode?) {
        var node = root
        while let cur = node {
            stack.append(cur)
            node = cur.left
        }
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

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
