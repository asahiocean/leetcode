import Foundation

// 113. Path Sum II
// https://leetcode.com/problems/path-sum-ii/

class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        return findPath(root, targetSum, [Int](), [[Int]]())
    }
    
    private func findPath(_ root: TreeNode?, _ sum: Int, _ path: [Int], _ paths: [[Int]]) -> [[Int]] {
        guard let root = root else { return paths }
        var cpath = path
        cpath.append(root.val)
        if root.left == nil && root.right == nil && root.val == sum {
            var cPaths = paths
            cPaths.append(cpath)
            return cPaths
        }
        let val = sum - root.val
        return findPath(root.left, val, cpath, paths) + findPath(root.right, val, cpath, paths)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.067 (0.069) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.pathSum(TreeNode([5,4,8,11,nil,13,4,7,2,nil,nil,5,1]), 22)
        XCTAssertEqual(value, [[5,4,11,2],[5,8,4,5]])
    }
    
    func test1() {
        let value = solution.pathSum(TreeNode([1,2,3]), 5)
        XCTAssertEqual(value, [])
    }
    
    func test2() {
        let value = solution.pathSum(TreeNode([1,2]), 0)
        XCTAssertEqual(value, [])
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
    // Making an additional initializer from an array of integers
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
