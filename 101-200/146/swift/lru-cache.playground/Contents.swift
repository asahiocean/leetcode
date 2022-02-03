import Foundation

// 146. LRU Cache
// https://leetcode.com/problems/lru-cache/

class LRUCache {
    private typealias Node = (key: Int, val: Int)
    private var array: [Node]
    private let capacity: Int
    
    private var map: [Int:Int] = [:]
    
    init(_ capacity: Int) {
        self.array = [Node]()
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let val = map[key] else { return -1 }
        let idx = array.firstIndex {$0.key == key}!
        let node = array[idx]
        array.remove(at: idx)
        array.insert(node, at: 0)
        return val
    }
    
    func put(_ key: Int, _ value: Int) {
        let exist = map[key] != nil
        map.updateValue(value, forKey: key)
        if exist {
            get(key)
            array[0].val = value
        } else {
            if array.count == capacity {
                map.removeValue(forKey: array.last!.key)
                array.removeLast()
            }
            array.insert((key,value), at: 0)
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
