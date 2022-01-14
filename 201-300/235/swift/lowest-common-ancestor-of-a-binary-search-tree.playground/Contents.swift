import Foundation

// 235. Lowest Common Ancestor of a Binary Search Tree
// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let rootVal = root?.val, let nodeP = p, let nodeQ = q else { return nil }
        switch (p: nodeP.val, q: nodeQ.val) {
        case let val where rootVal > val.p && rootVal > val.q:
            return lowestCommonAncestor(root?.left, nodeP, nodeQ)
        case let val where rootVal < val.p && rootVal < val.q:
            return lowestCommonAncestor(root?.right, nodeP, nodeQ)
        default:
            return root
        }
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.062 (0.064) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let tree = solution.lowestCommonAncestor(TreeNode([6,2,8,0,4,7,9,nil,nil,3,5]), TreeNode(2), TreeNode(8))
        XCTAssertEqual(tree!.val, 6)
    }
    
    func test1() {
        let tree = solution.lowestCommonAncestor(TreeNode([6,2,8,0,4,7,9,nil,nil,3,5]), TreeNode(2), TreeNode(4))
        XCTAssertEqual(tree!.val, 2)
    }
    
    func test2() {
        let tree = solution.lowestCommonAncestor(TreeNode([2,1]), TreeNode(2), TreeNode(1))
        XCTAssertEqual(tree!.val, 2)
    }
}

Tests.defaultTestSuite.run()

// MARK: - TreeNode -

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
