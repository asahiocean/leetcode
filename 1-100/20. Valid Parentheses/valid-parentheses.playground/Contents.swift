import Foundation

// 20. Valid Parentheses
// https://leetcode.com/problems/valid-parentheses

class Solution {
    func isValid(_ s: String) -> Bool {
        
        if s.count % 2 != 0 { return false }
        var stack: [Character] = []
        
        for ch in s {
            switch ch {
            case "(": stack.append(")")
            case "[": stack.append("]")
            case "{": stack.append("}")
            default:
                if stack.isEmpty || stack.removeLast() != ch {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}
