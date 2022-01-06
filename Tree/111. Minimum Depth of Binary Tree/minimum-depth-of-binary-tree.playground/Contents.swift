import Foundation

// 111. Minimum Depth of Binary Tree
// https://leetcode.com/problems/minimum-depth-of-binary-tree/

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var value = Int.max
        helper(root, 1, &value)
        return value
    }
    private func helper(_ node: TreeNode, _ level: Int, _ next: inout Int) {
        if node.left == nil, node.right == nil { next = min(level, next); return }
        if let left = node.left, level < next { helper(left, level + 1, &next) }
        if let right = node.right, level < next { helper(right, level + 1, &next) }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.038 (0.040) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.minDepth(TreeNode([3,9,20,nil,nil,15,7]))
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.minDepth(TreeNode([2,nil,3,nil,4,nil,5,nil,6]))
        XCTAssertEqual(value, 5)
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
                node.left = .init(val)
                queue.append(node.left!)
            }
            if !values.isEmpty, let val = values.removeFirst() {
                node.right = .init(val)
                queue.append(node.right!)
            }
        }
    }
}
