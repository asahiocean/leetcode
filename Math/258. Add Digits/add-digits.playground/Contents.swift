import Foundation

// 258. Add Digits
// https://leetcode.com/problems/add-digits/

class Solution {
    func addDigits(_ num: Int) -> Int {
        return num < 10 ? num : (num % 9 == 0 ? 9 : num % 9)
    }
}
