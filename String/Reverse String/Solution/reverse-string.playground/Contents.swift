import Foundation

// 344. Reverse String
// https://leetcode.com/problems/reverse-string

class Solution {
    func reverseString(_ s: inout [Character]) {
        s = s.reversed()
    }
}

func tests() {
    
    let solution = Solution()
    
    var hello: [Character] = ["h","e","l","l","o"]
    solution.reverseString(&hello)
    assert(hello == ["o","l","l","e","h"])
    
    var hannah: [Character] = ["H","a","n","n","a","h"]
    solution.reverseString(&hannah)
    assert(hannah == ["h","a","n","n","a","H"])
}

tests()
