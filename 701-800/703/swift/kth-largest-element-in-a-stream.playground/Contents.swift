import Foundation

// 703. Kth Largest Element in a Stream
// https://leetcode.com/problems/kth-largest-element-in-a-stream/

class KthLargest {
    
    private let kth: Int
    private var nums: [Int]
    
    init(_ k: Int, _ nums: [Int]) {
        self.kth = k
        self.nums = nums.sorted(by: <)
    }
    
    func add(_ val: Int) -> Int {
        var len = 0, more = false
        while len < nums.count {
            if nums[len] >= val {
                more = true
                nums.insert(val, at: len)
                break
            }
            len += 1
        }
        if !more { nums.append(val) }
        let idx = nums.count - kth
        return idx >= 0 && idx < nums.count ? nums[idx] : -1
    }
}
