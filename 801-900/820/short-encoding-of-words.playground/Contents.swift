import Foundation

// 820. Short Encoding of Words
// https://leetcode.com/problems/short-encoding-of-words/

class Solution {
    func minimumLengthEncoding(_ w: [String]) -> Int {
        let srt = w.sorted { $0.count < $1.count }
        var arr = Array(repeating: true, count: w.count)
        for i in srt.indices {
            for j in (i + 1)..<w.count where srt[j].hasSuffix(srt[i]) {
                arr[i] = false
                break
            }
        }
        return w.indices.map({ arr[$0] ? srt[$0].count + 1 : 0 }).reduce(0, +)
    }
}
