import Foundation

// 99. Recover Binary Search Tree
// https://leetcode.com/problems/recover-binary-search-tree/

class Solution {
    func recoverTree(_ root: TreeNode?) {
        var lhs: TreeNode?, rhs: TreeNode?, prev: TreeNode?
        func bfs(_ root: TreeNode?) {
            guard let node = root else { return }
            bfs(node.left)
            if lhs == nil, let prev = prev, prev.val > node.val { lhs = prev }
            if lhs != nil, rhs == nil || node.val < rhs!.val { rhs = node }
            prev = node
            bfs(node.right)
        }
        bfs(root)
        if let lhs = lhs, let rhs = rhs {
            let tmp = lhs.val
            lhs.val = rhs.val
            rhs.val = tmp
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.034 (0.036) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test1() {
        let tree = TreeNode([1,3,nil,nil,2])
        solution.recoverTree(tree)
        XCTAssertEqual(tree?.val, TreeNode([3,1,nil,nil,2])?.val)
    }
    
    func test2() {
        let tree = TreeNode([3,1,4,nil,nil,2])
        solution.recoverTree(tree)
        XCTAssertEqual(tree?.val, TreeNode([2,1,4,nil,nil,3])?.val)
    }
}

Tests.defaultTestSuite.run()

// MARK: - TreeNode

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
    public init?(_ nums: [Int?]) {
        var arr = nums
        guard !arr.isEmpty, let head = arr.removeFirst() else { return nil }
        val = head; left = nil; right = nil
        var queue = [self]
        while !queue.isEmpty {
            let root = queue.removeFirst()
            if !arr.isEmpty, let val = arr.removeFirst() {
                root.left = TreeNode(val)
                queue.append(root.left!)
            }
            if !arr.isEmpty, let val = arr.removeFirst() {
                root.right = TreeNode(val)
                queue.append(root.right!)
            }
        }
    }
}
