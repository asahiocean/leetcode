import Foundation

// https://leetcode.com/problems/excel-sheet-column-title/

// Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.

class Solution {
    func convertToTitle(_ columnNumber: Int) -> String {
        guard columnNumber > 0 else { return "" }
        var string = ""
        var num = columnNumber
        let a = Int("A".unicodeScalars.first!.value)
        while num > 0 {
            num -= 1
            let char = UnicodeScalar(a + num % 26)!
            string = String(char) + string
            num = num / 26
        }
        return string
    }
}

let solution = Solution()

func tests() {
    assert(solution.convertToTitle(1) == "A")
    assert(solution.convertToTitle(28) == "AB")
    assert(solution.convertToTitle(701) == "ZY")
    assert(solution.convertToTitle(2147483647) == "FXSHRXW")
    
}

tests()
