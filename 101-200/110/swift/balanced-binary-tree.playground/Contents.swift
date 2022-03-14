import Foundation

// 110. Balanced Binary Tree
// https://leetcode.com/problems/balanced-binary-tree/

class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        if !isBalanced(root.left) || !isBalanced(root.right) { return false }
        return abs(val(root.left) - val(root.right)) <= 1
    }
    private func val(_ tn: TreeNode?) -> Int {
        guard let node = tn else { return -1 }
        return 1 + max(val(node.left), val(node.right))
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.032 (0.034) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isBalanced(TreeNode([3,9,20,nil,nil,15,7]))
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.isBalanced(TreeNode([1,2,2,3,3,nil,nil,4,4]))
        XCTAssertEqual(value, false)
    }
    
    func test2() {
        let value = solution.isBalanced(TreeNode([]))
        XCTAssertEqual(value, true)
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
        var arr = array
        guard !arr.isEmpty, let head = arr.removeFirst() else { return nil }
        self.val = head
        var queue = [self]
        while !arr.isEmpty {
            let new = queue.removeFirst()
            if let val = arr.removeFirst() {
                new.left = .init(val)
                queue.append(new.left!)
            }
            if let val = arr.removeFirst() {
                new.right = .init(val)
                queue.append(new.right!)
            }
        }
    }
}
