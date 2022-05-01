import Foundation

// 844. Backspace String Compare
// https://leetcode.com/problems/backspace-string-compare/

class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        return rmSharp(s) == rmSharp(t)
    }
    private func rmSharp(_ str: String) -> [Character] {
        var arr = [Character]()
        str.forEach { if $0 == "#" { arr.popLast() } else { arr.append($0) } }
        return arr
    }
}
