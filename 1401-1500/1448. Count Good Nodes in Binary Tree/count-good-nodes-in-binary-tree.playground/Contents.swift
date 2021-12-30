import Foundation

// 1448. Count Good Nodes in Binary Tree
// https://leetcode.com/problems/count-good-nodes-in-binary-tree/

class Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        func dfs(_ root: TreeNode?, max num: Int) -> Int {
            guard let root = root else { return 0 }
            var count = 0
            root.val >= num ? count += 1 : nil
            let m = max(num, root.val)
            count += dfs(root.left, max: m)
            count += dfs(root.right, max: m)
            return count
        }
        return dfs(root, max: root.val)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.082 (0.083) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.goodNodes(TreeNode([3,1,4,3,nil,1,5]))
        XCTAssertEqual(value, 4)
    }
    func test1() {
        let value = solution.goodNodes(TreeNode([3,3,nil,4,2]))
        XCTAssertEqual(value, 3)
    }
    func test2() {
        let value = solution.goodNodes(TreeNode([1]))
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
