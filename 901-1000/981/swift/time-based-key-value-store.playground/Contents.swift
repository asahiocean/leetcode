import Foundation

// 981. Time Based Key-Value Store
// https://leetcode.com/problems/time-based-key-value-store/

class TimeMap {

    private typealias SI = (String,Int)
    private var dict: [String:[SI]]
    
    init() {
        self.dict = .init()
    }
    
    func set(_ k: String, _ v: String, _ t: Int) {
        dict[k, default: []].append((v,t))
    }
    
    func get(_ k: String, _ t: Int) -> String {
        guard let val = dict[k] else { return "" }
        let idx = bfs(val, t)
        return idx != -1 ? val[idx].0 : ""
    }
    
    private func bfs(_ n: [SI], _ t: Int) -> Int {
        var lhs = 0, rhs = n.count - 1
        while lhs <= rhs {
            let mid = lhs + (rhs - lhs) / 2, val = n[mid].1
            guard val != t else { return mid }
            val > t ? (rhs = mid - 1) : (lhs = mid + 1)
        }
        return lhs - 1
    }
}
