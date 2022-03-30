import Foundation

// 341. Flatten Nested List Iterator
// https://leetcode.com/problems/flatten-nested-list-iterator/

class NestedIterator {
    
    private var stack: [NestedInteger]
    
    init(_ nestedList: [NestedInteger]) {
        self.stack = nestedList.reversed()
    }
    
    func next() -> Int {
        return stack.removeLast().getInteger()
    }
    
    func hasNext() -> Bool {
        while !stack.isEmpty {
            var last = stack.removeLast()
            if last.isInteger() {
                stack.append(last)
                return true
            } else {
                last.getList().reversed().forEach {
                    stack.append($0)
                }
            }
        }
        return false
    }
}
