import Foundation

// 844. Backspace String Compare
// https://leetcode.com/problems/backspace-string-compare/

class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        return build(with: t) == build(with: s)
    }
    
    private func build(with source: String) -> [Character] {
        var stack = [Character]()
        for ele in source {
            if ele == Character("#")  {
                if !stack.isEmpty { stack.removeLast() }
            } else {
                stack.append(ele)
            }
        }
        return stack
    }
}
