import Foundation

// 232. Implement Queue using Stacks
// https://leetcode.com/problems/implement-queue-using-stacks/

class MyQueue {
    
    fileprivate var array: [Int]
    
    /** Initialize your data structure here. */
    init() {
        self.array = [Int]()
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        array.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        return array.removeFirst()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return array.first ?? 0
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return array.isEmpty
    }
}

func tests() {
    let myQueue = MyQueue()
    myQueue.push(1) // queue is: [1]
    myQueue.push(2) // queue is: [1, 2] (leftmost is front of the queue)
    myQueue.peek() // return 1
    myQueue.pop() // return 1, queue is [2]
    myQueue.empty() // return false
    
    assert(myQueue.array != [nil,nil,nil,1,1]) // false
}

tests()
