import Foundation

// 13. Roman to Integer
// https://leetcode.com/problems/roman-to-integer/

class Solution {
    let dict: [Character:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
    func romanToInt(_ s: String) -> Int {
        var out = 0, prev = 0
        s.forEach({
            let val = dict[$0] ?? 0
            if val <= prev { out += prev } else { out -= prev }
            prev = val
        })
        out += prev
        return out
    }
}
