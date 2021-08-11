import Foundation

// https://leetcode.com/problems/symmetric-tree
// Discuss: https://vk.cc/c3IFkY

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return check(root, root)
    }
    private final func check(_ l: TreeNode?, _ r: TreeNode?) -> Bool {
        if [l,r].allSatisfy({$0 == nil}) { return true }
        if l == nil || r == nil { return false }
        let n = (l?.left, r?.right)
        return l?.val == r?.val && check(n.0,n.1) && check(n.1,n.0)
    }
}

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

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.065 (0.067) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let res = s.isSymmetric(.init([1,2,2,3,4,4,3]))
        XCTAssertEqual(res, true)
    }
    func test2() {
        let res = s.isSymmetric(.init([1,2,2,nil,3,nil,3]))
        XCTAssertEqual(res, false)
    }
}

Tests.defaultTestSuite.run()
