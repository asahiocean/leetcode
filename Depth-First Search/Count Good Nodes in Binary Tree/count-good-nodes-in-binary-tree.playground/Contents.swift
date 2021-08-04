import Foundation

// https://leetcode.com/problems/count-good-nodes-in-binary-tree/
// Discuss: https://vk.cc/c3EibC

class Solution {
    private func dfs(_ root: TreeNode?, max num: Int) -> Int {
        guard let root = root else { return 0 }
        
        var count = 0
        root.val >= num ? count += 1 : nil
        
        let m = max(num, root.val)
        count += dfs(root.left, max: m)
        count += dfs(root.right, max: m)
        
        return count
    }
    
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return dfs(root, max: root.val)
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

// Executed 3 tests, with 0 failures (0 unexpected) in 0.082 (0.083) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let tree = TreeNode([3,1,4,3,nil,1,5])
        XCTAssert(s.goodNodes(tree) == 4)
    }
    func test1() {
        let tree = TreeNode([3,3,nil,4,2])
        XCTAssert(s.goodNodes(tree) == 3)
    }
    func test2() {
        let tree = TreeNode([1])
        XCTAssert(s.goodNodes(tree) == 1)
    }
}

Tests.defaultTestSuite.run()
