import Foundation

// 341. Flatten Nested List Iterator
// https://leetcode.com/problems/flatten-nested-list-iterator/

class NestedIterator {
    
    private var list: [NestedInteger]
    
    init(_ nestedList: [NestedInteger]) {
        self.list = nestedList.reversed()
    }
    
    func next() -> Int {
        return list.removeLast().getInteger()
    }
    
    func hasNext() -> Bool {
        while !list.isEmpty {
            var last = list.removeLast()
            if last.isInteger() {
                list.append(last)
                return true
            } else {
                last.getList().reversed().forEach {
                    list.append($0)
                }
            }
        }
        return false
    }
}
