import Foundation

// 1461. Check If a String Contains All Binary Codes of Size K
// https://leetcode.com/problems/check-if-a-string-contains-all-binary-codes-of-size-k/

class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        guard s.count > k else { return false }
        var lhs = 0, set = Set<String>()
        let arr = Array(s)
        for i in 0...s.count - k {
            set.insert(String(arr[i..<i+k]))
            lhs += 1
        }
        return set.count == Int(pow(2,Double(k)))
    }
}
