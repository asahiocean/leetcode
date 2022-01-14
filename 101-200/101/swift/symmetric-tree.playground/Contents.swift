import Foundation

// 101. Symmetric Tree
// https://leetcode.com/problems/symmetric-tree/

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return check(root, root)
    }
    private func check(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if [left,right].allSatisfy({$0 == nil}) { return true }
        if left == nil || right == nil { return false }
        let node = (left: left?.left, right: right?.right)
        return left?.val == right?.val && check(node.left, node.right) && check(node.right, node.left)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.035 (0.037) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test1() {
        let tree = TreeNode([1,2,2,3,4,4,3])
        let value = solution.isSymmetric(tree)
        XCTAssertEqual(value, true)
    }
    
    func test2() {
        let tree = TreeNode([1,2,2,nil,3,nil,3])
        let value = solution.isSymmetric(tree)
        XCTAssertEqual(value, false)
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
