import Foundation

// 114. Flatten Binary Tree to Linked List
// https://leetcode.com/problems/flatten-binary-tree-to-linked-list/

class Solution {
    func flatten(_ root: TreeNode?) {
        var node = root
        while let curr = node {
            if let next = curr.left {
                
                var prev = next
                
                while let right = prev.right {
                    prev = right
                }
                
                prev.right = curr.right
                curr.left = nil
                curr.right = next
            }
            node = curr.right
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.043 (0.045) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let tree = TreeNode([1,2,5,3,4,nil,6])
        let expected = TreeNode([1,nil,2,nil,3,nil,4,nil,5,nil,6])
        
        solution.flatten(tree)
        
        XCTAssertNotNil(tree?.val)
        XCTAssertNotNil(expected?.val)
        
        XCTAssertEqual(tree!.val, expected!.val)
    }
    
    func test1() {
        let tree = TreeNode([0])
        let expected = TreeNode([0])
        
        solution.flatten(tree)
        
        XCTAssertNotNil(tree?.val)
        XCTAssertNotNil(expected?.val)
        
        XCTAssertEqual(tree!.val, expected!.val)
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
