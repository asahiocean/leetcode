import Foundation

// 1457. Pseudo-Palindromic Paths in a Binary Tree
// https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree/

class Solution {
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        return calc(root)
    }
    private func calc(_ node: TreeNode?, _ nums: Set<Int> = []) -> Int {
        guard let node = node else { return 0 }
        let val = node.val
        var set = nums
        if nums.contains(val) { set.remove(val) } else { set.insert(val) }
        switch (node.left, node.right) {
        case let (lhs?,rhs?): return calc(lhs,set) + calc(rhs,set)
        case let (lhs?,nil): return calc(lhs,set)
        case let (nil,rhs?): return calc(rhs,set)
        default: return set.count <= 1 ? 1 : 0
        }
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.052 (0.054) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test1() {
        let value = solution.pseudoPalindromicPaths(TreeNode([2,3,1,3,1,nil,1]))
        XCTAssertEqual(value, 2)
    }
    
    func test2() {
        let value = solution.pseudoPalindromicPaths(TreeNode([2,1,1,1,3,nil,nil,nil,nil,nil,1]))
        XCTAssertEqual(value, 1)
    }
    
    func test3() {
        let value = solution.pseudoPalindromicPaths(TreeNode([9]))
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
