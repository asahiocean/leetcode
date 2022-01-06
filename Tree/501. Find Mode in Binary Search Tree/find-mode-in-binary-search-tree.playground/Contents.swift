import Foundation

// 501. Find Mode in Binary Search Tree
// https://leetcode.com/problems/find-mode-in-binary-search-tree/

class Solution {
    func findMode(_ root: TreeNode?) -> [Int] {
        var values = [Int:Int]()
        updateNode(root, values: &values)
        let max = values.values.max()
        let modes = values.filter { $0.value == max }.map { $0.key }
        return modes
    }
    
    func updateNode(_ node: TreeNode?, values: inout [Int:Int]) {
        guard let node = node else { return }
        values[node.val] = (values[node.val] ?? 0) + 1
        updateNode(node.left, values: &values)
        updateNode(node.right, values: &values)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.067 (0.068) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test1() {
        let value = solution.findMode(TreeNode([1,nil,2,2]))
        XCTAssertEqual(value, [2])
    }
    
    func test2() {
        let value = solution.findMode(TreeNode([0]))
        XCTAssertEqual(value, [0])
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
