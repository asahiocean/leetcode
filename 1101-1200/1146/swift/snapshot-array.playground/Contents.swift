import Foundation

// 1146. Snapshot Array
// https://leetcode.com/problems/snapshot-array/

class SnapshotArray {
    private var data: [Int], snaps = [Int:[Int:Int]]()
    private var idx = -1, len = 0
    init(_ length: Int) {
        self.data = [Int](repeating: 0, count: length)
        self.len = length
    }
    
    func set(_ i: Int, _ val: Int) {
        snaps[idx, default: [:]].updateValue(val, forKey: i)
    }
    
    func snap() -> Int {
        idx += 1
        snaps[idx] = [:]
        return idx
    }
    
    func get(_ i: Int, _ snap_id: Int) -> Int {
        var idx = snap_id - 1
        while idx >= -1 {
            if let val = snaps[idx]?[i] { return val }
            idx -= 1
        }
        return data[i]
    }
}
