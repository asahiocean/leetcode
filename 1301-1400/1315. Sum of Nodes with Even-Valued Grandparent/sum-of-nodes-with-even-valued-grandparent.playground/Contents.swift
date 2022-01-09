import Foundation

// 1315. Sum of Nodes with Even-Valued Grandparent
// https://leetcode.com/problems/sum-of-nodes-with-even-valued-grandparent/

class Solution {
    private var value = 0
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        helper(root, nil, nil)
        return value
    }
    private func helper(_ cur: TreeNode?, _ p: TreeNode?, _ g: TreeNode?) {
        guard let node = cur else { return }
        if let grand = g, grand.val % 2 == 0 { value += node.val }
        helper(node.left, node, p)
        helper(node.right, node, p)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.034 (0.036) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.sumEvenGrandparent(TreeNode([6,7,8,2,7,1,3,9,nil,1,4,nil,nil,nil,5]))
        XCTAssertEqual(value, 18)
    }
    
    func test1() {
        let value = solution.sumEvenGrandparent(TreeNode([1]))
        XCTAssertEqual(value, 0)
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
