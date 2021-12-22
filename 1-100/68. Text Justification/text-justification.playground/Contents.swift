import Foundation

// 68. Text Justification
// https://leetcode.com/problems/text-justification/

class Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var res = [String](), last = 0, lineLength = 0
        
        for (i, word) in words.enumerated() {
            if lineLength + word.count + (i - last) > maxWidth {
                res.append(buildLine(words, last, i - 1, maxWidth, lineLength))
                last = i
                lineLength = 0
            }
            lineLength += word.count
        }
        res.append(buildLast(words, last, words.count - 1, maxWidth))
        return res
    }
    
    private func buildLine(_ words: [String], _ s: Int, _ e: Int, _ max: Int, _ length: Int) -> String {
        var line = "", esn = 0, v1 = max - length, v2 = e - s, sn = v1
        if e > s { esn = v1 % v2; sn = v1 / v2 }
        
        for i in s...e {
            line += words[i]
            if s != e && i == e { break }
            for _ in 0..<sn { line += " " }
            if esn > 0 {
                line.append(" ")
                esn -= 1
            }
        }
        return line
    }
    
    private func buildLast(_ words: [String], _ s: Int, _ e: Int, _ max: Int) -> String {
        var line = ""
        (s...e).forEach {
            line += words[$0]
            if $0 < e { line.append(" ") }
        }
        while line.count < max { line.append(" ") }
        return line
    }
}
