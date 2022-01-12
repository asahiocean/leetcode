import Foundation

// 116. Populating Next Right Pointers in Each Node
// https://leetcode.com/problems/populating-next-right-pointers-in-each-node/

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var queue: [Node] = [root]
        while queue.count > 0 {
            for i in 0..<queue.count - 1 { queue[i].next = queue[i+1] }
            queue = queue.flatMap({[$0.left,$0.right].compactMap({$0})})
        }
        return root
    }
}

// MARK: - Test cases -

// Result: Executed 1 test, with 0 failures (0 unexpected) in 0.045 (0.047) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Given the above perfect binary tree (Figure A), your function should populate
    // each next pointer to point to its next right node, just like in Figure B.
    // The serialized output is in level order as connected by the next pointers,
    // with '#' signifying the end of each level.
    func test0() {
        let value = solution.connect(Node(arrayLiteral: 1,2,3,4,5,6,7))
        XCTAssertEqual(value, Node(arrayLiteral: 1,2,3,4,5,6,7))
    }
}

Tests.defaultTestSuite.run()

// MARK: - Node -

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
    
    public required convenience init(arrayLiteral: Int?...) {
        guard let firstVal = arrayLiteral.first else { fatalError("Cannot be used on empty arrays since they should represent nil") }
        guard let rootNodeVal = firstVal else { fatalError("Root node's value cannot be nil") }
        self.init(rootNodeVal)
        
        var queue: [Node] = [self]
        var toAdd = Array(arrayLiteral.dropFirst())
        
        while !queue.isEmpty, !toAdd.isEmpty {
            let node = queue.removeFirst()
            
            if let leftVal = toAdd.removeFirst() {
                node.left = Node(leftVal)
                queue.append(node.left!)
            }
            
            guard !toAdd.isEmpty else { return }
            
            if let rightVal = toAdd.removeFirst() {
                node.right = Node(rightVal)
                queue.append(node.right!)
            }
        }
    }
}

extension Node: Equatable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return isTree(lhs, rhs)
    }
    private static func isTree(_ p: Node?, _ q: Node?) -> Bool {
        guard p == nil && q == nil else {
            return p?.val == q?.val ? isTree(p?.left, q?.left) && isTree(p?.right, q?.right) : false
        }
        return true
    }
}
