import Foundation

// 1209. Remove All Adjacent Duplicates in String II
// https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii/

class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        guard k != 1 else { return k <= s.count ? s : "" }
        var res = "", stack = [(n: Int, ch: Character)]()
        for ch in s {
            if let last = stack.last, last.ch == ch {
                let next = last.n + 1
                if next == k {
                    stack.removeLast()
                } else {
                    stack[stack.count - 1].n = next
                }
                continue
            }
            stack.append((1,ch))
        }
        for e in stack {
            res += e.n == 1 ? "\(e.ch)" : String(Array(repeating: e.ch, count: e.n))
        }
        return res
    }
}
