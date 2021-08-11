import Foundation

// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree
// Discuss: https://vk.cc/c3HZ35

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if let val = root?.val, val > p!.val && val > q!.val {
            return lowestCommonAncestor(root?.left, p, q)
        } else if let val = root?.val, val < p!.val && val < q!.val {
            return lowestCommonAncestor(root?.right, p, q)
        } else {
            return root
        }
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
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

// Executed 3 tests, with 0 failures (0 unexpected) in 0.148 (0.149) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let res = s.lowestCommonAncestor(TreeNode([6,2,8,0,4,7,9,nil,nil,3,5]), TreeNode(2), TreeNode(8))
        XCTAssertEqual(res!.val, 6)
    }
    func test2() {
        let res = s.lowestCommonAncestor(TreeNode([6,2,8,0,4,7,9,nil,nil,3,5]), TreeNode(2), TreeNode(4))
        XCTAssertEqual(res!.val, 2)
    }
    func test3() {
        let res = s.lowestCommonAncestor(TreeNode([2,1]), TreeNode(2), TreeNode(1))
        XCTAssertEqual(res!.val, 2)
    }
}

Tests.defaultTestSuite.run()
