import Foundation

// https://leetcode.com/problems/valid-anagram/

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let sChars = Dictionary(s.map {($0, 1)}, uniquingKeysWith: +)
        let tChars = Dictionary(t.map {($0, 1)}, uniquingKeysWith: +)
        return sChars == tChars
    }
}
