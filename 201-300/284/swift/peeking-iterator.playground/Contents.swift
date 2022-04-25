import Foundation

// 284. Peeking Iterator
// https://leetcode.com/problems/peeking-iterator/

// Swift IndexingIterator refernence:
// https://developer.apple.com/documentation/swift/indexingiterator

class PeekingIterator {
    typealias II = IndexingIterator
    private var iterator: II<[Int]>
    private var value: Int?
    
    init(_ iterator: II<[Int]>) {
        self.iterator = iterator
        value = self.iterator.next()
    }
    
    func next() -> Int {
        guard let val = value else { return 0 }
        self.value = iterator.next()
        return val
    }
    
    func peek() -> Int {
        guard let val = value else { return 0 }
        return val
    }
    
    func hasNext() -> Bool {
        return value != nil
    }
}
