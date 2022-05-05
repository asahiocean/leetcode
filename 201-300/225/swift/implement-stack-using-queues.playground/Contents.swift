import Foundation

// 225. Implement Stack using Queues
// https://leetcode.com/problems/implement-stack-using-queues/

class MyStack {
    
    private var pushStack: [Int]
    private var popStack: [Int]
    
    init() {
        self.pushStack = [Int]()
        self.popStack = [Int]()
    }
    
    func push(_ x: Int) {
        pushStack.append(x)
    }
    
    func pop() -> Int {
        while pushStack.count > 1 {
            popStack.append(pushStack.removeFirst())
        }
        let targ = pushStack.removeFirst()
        pushStack = popStack
        popStack.removeAll()
        return targ
    }
    
    func top() -> Int {
        while pushStack.count > 1 {
            popStack.append(pushStack.removeFirst())
        }
        let targ = pushStack[0]
        pushStack.insert(contentsOf: popStack, at: 0)
        popStack.removeAll()
        return targ
    }
    
    func empty() -> Bool {
        return pushStack.isEmpty
    }
}
