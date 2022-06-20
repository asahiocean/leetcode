import Foundation

// 205. Isomorphic Strings
// https://leetcode.com/problems/isomorphic-strings/

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var sdc = [Character:String.Index](), tdc = sdc
        for i in s.indices {
            guard sdc[s[i]] == tdc[t[i]] else { return false }
            sdc[s[i]] = i
            tdc[t[i]] = i
        }
        return true
    }
}
