import Foundation

// 380. Insert Delete GetRandom O(1)
// https://leetcode.com/problems/insert-delete-getrandom-o1/

class RandomizedSet {

    private var elems: [Int]
    private var dict: [Int:Int] // value:index

    init() {
        self.elems = []
        self.dict = [:]
    }
    
    func insert(_ val: Int) -> Bool {
        guard dict[val] == nil else { return false }
        elems.append(val)
        dict[val] = elems.count - 1
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let idx = dict[val] else { return false }
        elems.remove(at: idx)
        dict.removeValue(forKey: val)
        for (v,i) in dict where i > idx {
            dict.updateValue(i - 1, forKey: v)
        }
        return true
    }
    
    func getRandom() -> Int {
        return elems[.random(in: 0..<elems.count)]
        
    }
}
