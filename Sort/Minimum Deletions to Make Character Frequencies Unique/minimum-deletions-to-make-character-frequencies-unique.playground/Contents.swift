import Foundation

// https://leetcode.com/problems/minimum-deletions-to-make-character-frequencies-unique/

/*
A string s is called good if there are no two different characters in s that have the same frequency.

Given a string s, return the minimum number of characters you need to delete to make s good.

The frequency of a character in a string is the number of times it appears in the string. For example, in the string "aab", the frequency of 'a' is 2, while the frequency of 'b' is 1.
*/

class Solution {
    func minDeletions(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        
        var count: Int = 0
        
        var dict: [Character:Int] = [:]
        s.forEach({ dict[$0, default: 0] += 1 })
        
        var set: Set<Int> = []
        dict.forEach({
            guard var value = dict[$0.key] else { return }
            while set.contains(value) {
                value -= 1
                count += 1
            }
            if value > 0 { set.insert(value) }
        })
        return count
    }
}

func tests() {
    let s = Solution()
    assert(s.minDeletions("aab") == 0) // good
    assert(s.minDeletions("aaabbbcc") == 2) // good
    assert(s.minDeletions("ceabaacb") == 2) // good
}

tests()
