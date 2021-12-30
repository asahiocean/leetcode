import Foundation

// 557. Reverse Words in a String III
// https://leetcode.com/problems/reverse-words-in-a-string-iii/

class Solution {
    func reverseWords(_ s: String) -> String {
        return s.components(separatedBy: .whitespaces).map { .init($0.reversed())}.joined(separator: " ")
    }
}
