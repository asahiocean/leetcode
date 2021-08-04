import Foundation

// 46. Permutations
// https://leetcode.com/problems/permutations/

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]](repeating: [], count: 1)
        nums.forEach { n in
            var arr = [[Int]]()
            result.forEach {
                for i in 0..<$0.count {
                    var t = $0
                    t.insert(n, at: i)
                    arr.append(t)
                }
                var t = $0
                t.append(n)
                arr.append(t)
            }
            result = arr
        }
        return result
    }
}
