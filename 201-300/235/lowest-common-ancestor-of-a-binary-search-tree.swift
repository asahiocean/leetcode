import Foundation

// 235. Lowest Common Ancestor of a Binary Search Tree
// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        let lca = lowestCommonAncestor
        guard let val = root?.val, let valp = p?.val, let valq = q?.val else { return nil }
        return valp < val && valq < val ? lca(root?.left, p, q) : valp > val && valq > val ? lca(root?.right, p, q) : root
    }
}

// MARK: - Test cases -

class Tests {
    
    private typealias TN = TreeNode
    private typealias sol = Solution
    
    static func testExample1() {
        let node = sol().lowestCommonAncestor(TN([6,2,8,0,4,7,9,nil,nil,3,5]), TN(2), TN(8))
        guard let val = node?.val else { fatalError() }
        print(val == 6)
    }
    
    static func testExample2() {
        let node = sol().lowestCommonAncestor(TN([6,2,8,0,4,7,9,nil,nil,3,5]), TN(2), TN(4))
        guard let val = node?.val else { fatalError() }
        print(val == 2)
    }
    
    static func testExample3() {
        let node = sol().lowestCommonAncestor(TN([2,1]), TN(2), TN(1))
        guard let val = node?.val else { fatalError() }
        print(val == 2)
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
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init?(_ a: [Int?]) {
        guard !a.isEmpty else { return nil }
        var arr = a
        val = arr.removeFirst()!
        var queue = [self]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if !arr.isEmpty, let val = arr.removeFirst() {
                node.left = TreeNode(val)
                queue.append(node.left!)
            }
            if !arr.isEmpty, let val = arr.removeFirst() {
                node.right = TreeNode(val)
                queue.append(node.right!)
            }
        }
    }
}
