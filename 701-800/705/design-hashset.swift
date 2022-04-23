// 705. Design HashSet
// https://leetcode.com/problems/design-hashset/

class MyHashSet {
    
    private var set: Set<Int>!
    
    init() {
    	self.set = Set<Int>()    
    }
    
    func add(_ key: Int) {
        set.insert(key)
    }
    
    func remove(_ key: Int) {
        if set.contains(key){
            set.remove(key)
        }
    }
    
    func contains(_ key: Int) -> Bool {
        return set.contains(key)
    }
}
