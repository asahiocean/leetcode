import Foundation

// 22. Generate Parentheses
// https://leetcode.com/problems/generate-parentheses/

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else { return [""] }
        var map = [Int:[String]]()
        if let parentheses = map[n] { return parentheses }
        var result = [String]()
        for i in 0..<n {
            for l in generateParenthesis(i) {
                for r in generateParenthesis(n - 1 - i) {
                    result.append("(" + l + ")" + r)
                }
            }
        }
        map[n] = result
        return result
    }
}
