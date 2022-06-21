import Foundation

// 814. Binary Tree Pruning
// https://leetcode.com/problems/binary-tree-pruning/

class Solution {
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        typealias TN = TreeNode
        func isNull(_ v: Int, _ l: TN?, _ r: TN?) -> Bool { return v == 0 && l == nil && r == nil }
        guard !isNull(root.val, root.left, root.right) else { return nil }
        let lhs = pruneTree(root.left), rhs = pruneTree(root.right)
        guard !isNull(root.val, lhs, rhs) else { return nil }
        (root.left,root.right) = (lhs,rhs)
        return root
    }
}

// MARK: - Test cases -

class Tests {
    
    private typealias sol = Solution
    private typealias TN = TreeNode
    
    // Only the red nodes satisfy the property "every subtree not containing a 1".
    // The diagram on the right represents the answer.
    static func testExample1() {
        let val = sol().pruneTree(TN([1,nil,0,0,1]))
        print(val?.val == TN([1,nil,0,nil,1])?.val)
    }
    
    static func testExample2() {
        let val = sol().pruneTree(TN([1,0,1,0,0,0,1]))
        print(val?.val == TN([1,nil,1,nil,1])?.val)
    }
    
    static func testExample3() {
        let val = sol().pruneTree(TN([1,1,0,1,1,0,1,0]))
        print(val?.val == TN([1,1,0,1,1,nil,1])?.val)
    }
}

Tests.testExample1()
Tests.testExample2()
Tests.testExample3()

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
    public init?(_ a: [Int?]) {
        guard !a.isEmpty else { return nil }
        var arr = a
        val = arr.removeFirst()!
        var queue = [self]
        while !queue.isEmpty {
            queue.removeFirst()
            if !arr.isEmpty, let val = arr.removeFirst() {
                queue.append(TreeNode(val))
            }
            if !arr.isEmpty, let val = arr.removeFirst() {
                queue.append(TreeNode(val))
            }
        }
    }
}