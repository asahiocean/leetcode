import Foundation

// 46. Permutations
// https://leetcode.com/problems/permutations/

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]](repeating: [], count: 1)
        for n in nums {
            var array = [[Int]]()
            for var k in result {
                for i in 0..<k.count {
                    var val = k
                    val.insert(n, at: i)
                    array.append(val)
                }
                k.append(n)
                array.append(k)
            }
            result = array
        }
        return result
    }
}
