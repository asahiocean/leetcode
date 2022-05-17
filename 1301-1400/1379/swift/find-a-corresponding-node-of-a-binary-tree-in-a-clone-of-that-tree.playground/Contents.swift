import Foundation

// 1379. Find a Corresponding Node of a Binary Tree in a Clone of That Tree
// https://leetcode.com/problems/find-a-corresponding-node-of-a-binary-tree-in-a-clone-of-that-tree/

class Solution {
    public func getTargetCopy(with original: TreeNode?, cloned: TreeNode?, target: TreeNode) -> TreeNode? {
        guard original != nil else { return nil }
        guard original != target else { return cloned }
        let lhs = getTargetCopy(with: original?.left, cloned: cloned?.left, target: target)
        guard lhs == nil else { return lhs }
        let rhs = getTargetCopy(with: original?.right, cloned: cloned?.right, target: target)
        return rhs
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.028 (0.030) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // In all examples the original and cloned trees are shown.
    // The target node is a green node from the original tree.
    // The answer is the yellow node from the cloned tree.
    func test0() {
        let tree = TreeNode([7,4,3,nil,nil,6,19])
        let value = solution.getTargetCopy(with: tree, cloned: tree, target: TreeNode(3))
        XCTAssertEqual(value?.value, 3)
    }
    
    func test1() {
        let tree = TreeNode([7])
        let value = solution.getTargetCopy(with: tree, cloned: tree, target: TreeNode(7))
        XCTAssertEqual(value?.value, 7)
    }
    
    func test2() {
        let tree = TreeNode([8,nil,6,nil,5,nil,4,nil,3,nil,2,nil,1])
        let value = solution.getTargetCopy(with: tree, cloned: tree, target: TreeNode(4))
        XCTAssertEqual(value?.value, 4)
    }
}

Tests.defaultTestSuite.run()

// MARK: - TreeNode -

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var value: Int = 0
    public init(_ val: Int) { self.value = val; self.left = nil; self.right = nil; }
    public init?(_ array: [Int?]) {
        var arr = array
        guard !arr.isEmpty, let root = arr.removeFirst() else { return nil }
        value = root
        var queue = [self]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if !arr.isEmpty, let val = arr.removeFirst() {
                node.left = TreeNode(val)
                queue.append(node.left!)
            }
            if !arr.isEmpty, let val = arr.removeFirst() {
                node.right = TreeNode(val)
                queue.append(node.right!)
            }
        }
    }
}

extension TreeNode: Equatable {
    static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.value == rhs.value
    }
}
