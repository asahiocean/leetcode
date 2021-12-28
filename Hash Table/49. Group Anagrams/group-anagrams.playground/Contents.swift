import Foundation

// 49. Group Anagrams
// https://leetcode.com/problems/group-anagrams/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var res = [[String]](), dict = [[Character]:[String]]()
        strs.forEach {
            let t = $0.sorted()
            dict[t] == nil ? (dict[t] = [$0]) : (dict[t]?.append($0))
        }
        dict.forEach{ res.append($1) }
        return res
    }
}
