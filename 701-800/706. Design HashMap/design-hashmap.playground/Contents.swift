import Foundation

// 706. Design HashMap
// https://leetcode.com/problems/design-hashmap/

class MyHashMap {
    
    private var hashMap = Dictionary<Int,Int>()

    init() {
        
    }

    func put(_ key: Int, _ value: Int) {
        hashMap[key] = value
    }

    func get(_ key: Int) -> Int {
        return hashMap[key] ?? -1
    }

    func remove(_ key: Int) {
        hashMap.removeValue(forKey: key)
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
