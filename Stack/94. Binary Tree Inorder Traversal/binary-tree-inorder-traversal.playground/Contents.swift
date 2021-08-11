import Foundation

// Runtime: 0 ms
// Memory Usage: 13.9 MB

// https://leetcode.com/problems/binary-tree-inorder-traversal/
// Discuss: https://vk.cc/c3Ol0B

class Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int](), array = [TreeNode](), head = root
        while head != nil || !(array.isEmpty) {
            switch head {
            case .some(let node):
                array.append(node)
                head = node.left
            default:
                let prev = array.removeLast()
                result.append(prev.val)
                head = prev.right
            }
        }
        return result
    }
}

// MARK: - Test Cases -

import XCTest

// Executed 5 tests, with 0 failures (0 unexpected) in 0.046 (0.048) seconds

class Tests: XCTestCase {
    let s = Solution()
    func test0() {
        let res = s.inorderTraversal(.init([1,nil,2,3]))
        XCTAssertEqual(res, [1,3,2])
    }
    func test1() {
        let res = s.inorderTraversal(.init([]))
        XCTAssertEqual(res, [])
    }
    func test2() {
        let res = s.inorderTraversal(.init([1]))
        XCTAssertEqual(res, [1])
    }
    func test3() {
        let res = s.inorderTraversal(.init([1,2]))
        XCTAssertEqual(res, [2,1])
    }
    func test4() {
        let res = s.inorderTraversal(.init([1,nil,2]))
        XCTAssertEqual(res, [1,2])
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
