import Foundation

// 1026. Maximum Difference Between Node and Ancestor
// https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/

class Solution {
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return dfs(root, root.val, root.val)
    }
    
    private func dfs(_ root: TreeNode?, _ valMax: Int, _ valMin: Int) -> Int {
        guard let root = root else { return valMax - valMin }
        
        let value = (min: min(valMin, root.val),
                     max: max(valMax, root.val))
        
        let result = (left: dfs(root.left, value.max, value.min),
                      right: dfs(root.right, value.max, value.min))
        
        return max(result.left, result.right)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.034 (0.036) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// We have various ancestor-node differences, some of which are given below :
    /// |8 - 3| = 5
    /// |3 - 7| = 4
    /// |8 - 1| = 7
    /// |10 - 13| = 3
    /// Among all possible differences, the maximum value of 7 is obtained by |8 - 1| = 7.
    func test0() {
        let value = solution.maxAncestorDiff(TreeNode([8,3,10,1,6,nil,14,nil,nil,4,7,13]))
        XCTAssertEqual(value, 7)
    }
    
    func test1() {
        let value = solution.maxAncestorDiff(TreeNode([1,nil,2,nil,0,3]))
        XCTAssertEqual(value, 3)
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

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right && lhs.val == rhs.val
    }
}
