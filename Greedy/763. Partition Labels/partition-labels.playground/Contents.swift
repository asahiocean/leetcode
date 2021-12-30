import Foundation

// https://leetcode.com/problems/partition-labels/

/*
    A string S of lowercase English letters is given.
    We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.
*/

class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        guard !S.isEmpty else { return [] }

        var map = [Character:Int]()

        // making a map on the similarity of the hashtable by which we will search
        for (i,c) in S.enumerated() {
            map[c, default: 0] = i
        }
        
        var num = 0, end = 0 // indices
        var result = [Int]()
        
        for (i,c) in S.enumerated() {
            end = max(end, map[c, default: 0])

            guard i == end else { continue }
            result.append(i - num + 1)
            num = i + 1
        }
        return result
    }
}

func tests() {
    let s = Solution()
    assert(s.partitionLabels("ababcbacadefegdehijhklij") == [9,7,8]) // good
}

tests()
