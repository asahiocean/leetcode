import Foundation

// 155. Min Stack
// https://leetcode.com/problems/min-stack/

class MinStack {
    
    private var stack: [Int]
    private var value: Int
    
    init() {
        stack = []
        value = .max
    }
    
    func push(_ val: Int) {
        stack.insert(val, at: 0)
        if val < value { value = val }
    }
    
    func pop() {
        if value == stack.removeFirst() {
            value = stack.isEmpty ? .max : stack.min()!
        }
    }
    
    func top() -> Int {
        return stack[0]
    }
    
    func getMin() -> Int {
        return value
    }
}
