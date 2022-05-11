import Foundation

// 1641. Count Sorted Vowel Strings
// https://leetcode.com/problems/count-sorted-vowel-strings/

class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        var arr = Array(repeating: [1,1,1,1,1,0], count: n + 1)
        for a in 1...n {
            for b in [4,3,2,1,0] {
                arr[a][b] = arr[a][b + 1] + arr[a - 1][b]
            }
        }
        return arr[n][0]
    }
}
