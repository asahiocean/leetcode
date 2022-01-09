import Foundation

// 155. Min Stack
// https://leetcode.com/problems/min-stack/

class MinStack {
    private var stack: [Int]
    private var min: Int
    
    init() {
        self.stack = []
        self.min = .max
    }
    
    func push(_ val: Int) {
        stack.insert(val, at: 0)
        if val < min { min = val }
    }
    
    func pop() {
        if !stack.isEmpty {
            let temp = stack.removeFirst()
            if temp == min {
                min = stack.isEmpty ? .max : stack.min()!
            }
        }
    }
    
    func top() -> Int {
        return stack[0]
    }
    
    func getMin() -> Int {
        return min
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
