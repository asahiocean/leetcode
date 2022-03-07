import Foundation

// 232. Implement Queue using Stacks
// https://leetcode.com/problems/implement-queue-using-stacks/

class MyQueue {
    
    private var queue: [Int]
    
    init() {
        self.queue = []
    }
    
    func push(_ x: Int) {
        queue.append(x)
    }
    
    func pop() -> Int {
        return queue.removeFirst()
    }
    
    func peek() -> Int {
        return queue.first ?? 0
    }
    
    func empty() -> Bool {
        return queue.isEmpty
    }
}

extension MyQueue {
    func get() -> [Int] {
        return self.queue
    }
}

// MARK: - Test cases -

// Result: Executed 1 test, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let myQueue = MyQueue()
    
    private var queue: [Int] = []
    
    func test0() {
        myQueue.push(1)
        assert(myQueue.get() == [1])     // queue is: [1]
        myQueue.push(2)
        assert(myQueue.get() == [1, 2])  // queue is: [1, 2] (leftmost is front of the queue)
        assert(myQueue.peek() == 1)      // return 1
        assert(myQueue.pop() == 1)       // return 1, queue is [2]
        assert(myQueue.empty() == false) // return false
        XCTAssert(myQueue.get() != [nil,nil,nil,1,1])
    }
}

Tests.defaultTestSuite.run()
