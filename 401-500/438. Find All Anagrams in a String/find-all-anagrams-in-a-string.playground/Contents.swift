import Foundation

// 438. Find All Anagrams in a String
// https://leetcode.com/problems/find-all-anagrams-in-a-string/

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        
        let arrS = Array(s), arrP = Array(p)
        
        guard arrS.count >= arrP.count else { return [] }
        
        var chars1 = [Int](repeating: 0, count: 26)
        var chars2 = chars1
        
        for c in arrP {
            chars2[aVal(c, "a")] += 1
        }
        
        var left = 0 , right = 0
        var result = [Int]()
        
        while right < arrS.count {
            chars1[aVal(arrS[right], "a")] += 1
            if right - left == arrP.count - 1 {
                if check(chars1, chars2) { result.append(left) }
                chars1[aVal(arrS[left], "a")] -= 1
                left += 1
            }
            right += 1
        }
        return result
    }
    
    private func aVal(_ first: Character, _ second: Character) -> Int {
        return Int(first.asciiValue! - second.asciiValue!)
    }
    
    private func check(_ left: [Int], _ right: [Int]) -> Bool {
        for i in left.indices where left[i] != right[i] { return false }
        return true
    }
}
