import Foundation

// 106. Construct Binary Tree from Inorder and Postorder Traversal
// https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/

class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        let lenIO = inorder.count, lenPO = postorder.count
        guard !inorder.isEmpty, !postorder.isEmpty else { return nil }
        
        let root = TreeNode(postorder[lenPO - 1])
        
        if lenIO == 1 && lenPO == 1 { return root }
        
        if let idx = inorder.firstIndex(of: postorder[lenPO - 1]) {
            let ioLeft = Array(inorder[0..<idx])
            let ioRight = Array(inorder[idx+1..<lenIO])
            
            let poLeft = Array(postorder[0..<ioLeft.count])
            let poRight = Array(postorder[ioLeft.count..<ioLeft.count + ioRight.count])
            
            root.left = buildTree(ioLeft, poLeft)
            root.right = buildTree(ioRight, poRight)
        }
        return root
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.022 (0.024) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.buildTree([9,3,15,20,7], [9,15,7,20,3])
        let expected = TreeNode([3,9,20,nil,nil,15,7])
        
        XCTAssertNotNil(value?.val)
        XCTAssertNotNil(expected?.val)
        
        XCTAssertEqual(value!.val, expected!.val)
    }
    
    func test1() {
        let value = solution.buildTree([-1], [-1])
        let expected = TreeNode([-1])
        
        XCTAssertNotNil(value?.val)
        XCTAssertNotNil(expected?.val)
        
        XCTAssertEqual(value!.val, expected!.val)
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
