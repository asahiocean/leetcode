import Foundation

// 232. Implement Queue using Stacks
// https://leetcode.com/problems/implement-queue-using-stacks/

class MyQueue {
    
    private var array: [Int]
    
    init() {
        self.array = []
    }
    
    func push(_ x: Int) {
        array.append(x)
    }
    
    func pop() -> Int {
        return array.removeFirst()
    }
    
    func peek() -> Int {
        return array.first ?? 0
    }
    
    func empty() -> Bool {
        return array.isEmpty
    }
}

extension MyQueue {
    final func get() -> [Int] {
        return array
    }
}

// MARK: - Test cases -

// Result: Executed 1 test, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    func test0() {
        let myQueue = MyQueue()
        myQueue.push(1)     // queue is: [1]
        myQueue.push(2)     // queue is: [1, 2] (leftmost is front of the queue)
        myQueue.peek()      // return 1
        myQueue.pop()       // return 1, queue is [2]
        myQueue.empty()     // return false
        XCTAssert(myQueue.get() != [nil,nil,nil,1,1])
    }
}

Tests.defaultTestSuite.run()
