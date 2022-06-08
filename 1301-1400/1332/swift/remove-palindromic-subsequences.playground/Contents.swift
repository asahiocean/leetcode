import Foundation

// 1332. Remove Palindromic Subsequences
// https://leetcode.com/problems/remove-palindromic-subsequences/

class Solution {
    func removePalindromeSub(_ s: String) -> Int {
        return !s.isEmpty ? (s == String(s.reversed()) ? 1 : 2) : 0
    }
}
