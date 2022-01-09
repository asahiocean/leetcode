import Foundation

// 543. Diameter of Binary Tree
// https://leetcode.com/problems/diameter-of-binary-tree/

class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        @discardableResult
        func helper(_ node: TreeNode?, _ diameter: inout Int) -> Int {
            guard let root = node else { return 0 }
            var leftH = 0, rightH = 0
            if let left = root.left { leftH += 1 + helper(left, &diameter) }
            if let right = root.right { rightH += 1 + helper(right, &diameter) }
            diameter = max(diameter, (leftH + rightH))
            return max(leftH, rightH)
        }
        var diameter: Int = 0
        helper(root, &diameter)
        return diameter
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.063 (0.065) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.diameterOfBinaryTree(.init([1,2,3,4,5]))
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.diameterOfBinaryTree(.init([1,2]))
        XCTAssertEqual(value, 1)
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
    
    // Additional initializer
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
