import Foundation

// 706. Design HashMap
// https://leetcode.com/problems/design-hashmap/

class MyHashMap {
    
    private(set) var hashMap: [Int:Int]!

    init() {
        self.hashMap = [:]
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

class Tests {
    
    static func test() {
        let hmap = MyHashMap()
        hmap.put(1, 1) // The map is now [[1,1]]
        hmap.put(2, 2) // The map is now [[1,1], [2,2]]
        hmap.get(1)    // return 1, The map is now [[1,1], [2,2]]
        hmap.get(3)    // return -1 (i.e., not found), The map is now [[1,1], [2,2]]
        hmap.put(2, 1) // The map is now [[1,1], [2,1]] (i.e., update the existing value)
        hmap.get(2)    // return 1, The map is now [[1,1], [2,1]]
        hmap.remove(2) // remove the mapping for 2, The map is now [[1,1]]
        hmap.get(2)    // return -1 (i.e., not found), The map is now [[1,1]]
        print([[1,1]] == hmap.hashMap.map({ Array(arrayLiteral: $0,$1)} ))
    }
}

Tests.test()
