import Foundation

// 814. Binary Tree Pruning
// https://leetcode.com/problems/binary-tree-pruning/

class Solution {
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        if root.val == 0, root.left == nil, root.right == nil { return nil }
        
        let left = pruneTree(root.left), right = pruneTree(root.right)
        
        if root.val == 0, left == nil, right == nil { return nil }
        (root.left,root.right) = (left,right)
        
        return root
    }
}

// MARK: - Test Cases -

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.157 (0.159) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.pruneTree(TreeNode([1,nil,0,0,1]))
        XCTAssertEqual(res?.val,TreeNode([1,nil,0,nil,1])?.val)
    }
    func test1() {
        let res = s.pruneTree(TreeNode([1,0,1,0,0,0,1]))
        XCTAssertEqual(res?.val, TreeNode([1,nil,1,nil,1])?.val)
    }
    func test2() {
        let res = s.pruneTree(TreeNode([1,1,0,1,1,0,1,0]))
        XCTAssertEqual(res?.val, TreeNode([1,1,0,1,1,nil,1])?.val)
    }
}

Tests.defaultTestSuite.run()

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
    public init?(_ array: [Int?]) {
        var values = array
        guard !values.isEmpty, let head = values.removeFirst() else { return nil }
        
        val = head; left = nil; right = nil
        
        var queue = [self]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if !values.isEmpty, let val = values.removeFirst() {
                node.left = TreeNode(val)
                queue.append(node.left!)
            }
            if !values.isEmpty, let val = values.removeFirst() {
                node.right = TreeNode(val)
                queue.append(node.right!)
            }
        }
    }
}
