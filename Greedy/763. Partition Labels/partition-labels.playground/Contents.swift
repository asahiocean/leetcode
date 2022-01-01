import Foundation

// 763. Partition Labels
// https://leetcode.com/problems/partition-labels/

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
