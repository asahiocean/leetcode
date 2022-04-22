import Foundation

// 706. Design HashMap
// https://leetcode.com/problems/design-hashmap/

class MyHashMap {
    
    private var hashMap: [Int:Int]!

    init() {
        self.hashMap = [Int:Int]()
    }

    func put(_ k: Int, _ v: Int) {
        hashMap[k] = v
    }

    func get(_ k: Int) -> Int {
        return hashMap[k] ?? -1
    }

    func remove(_ k: Int) {
        hashMap[k] = nil
    }
}
