import Foundation

// 622. Design Circular Queue
// https://leetcode.com/problems/design-circular-queue/

class MyCircularQueue {
    
    private var queue: [Int]
    private let size: Int
    
    init(_ k: Int) {
        size = k
        queue = []
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard !isFull() else { return false }
        queue.append(value)
        return true
    }
    
    func deQueue() -> Bool {
        guard !isEmpty() else { return false }
        queue.removeFirst()
        return true
    }
    
    func Front() -> Int {
        return queue.first ?? -1
    }
    
    func Rear() -> Int {
        return queue.last ?? -1
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
    
    func isFull() -> Bool {
        return queue.count == size
    }
}
