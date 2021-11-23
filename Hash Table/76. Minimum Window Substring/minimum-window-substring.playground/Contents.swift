import Foundation

// 76. Minimum Window Substring
// https://leetcode.com/problems/minimum-window-substring/

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let sCh = Array(s), tCh = Array(t)
        var tFreq = Dictionary(tCh.map {($0,1)}, uniquingKeysWith: +)
        var left = 0, shortLen = Int.max, start = 0, matters = 0
        
        for (i,ch) in sCh.enumerated() {
            guard let sCharFreq = tFreq[ch] else { continue }
            tFreq[ch] = sCharFreq - 1
            if sCharFreq > 0 { matters += 1 }
            
            while matters == tCh.count {
                guard let leftFreq = tFreq[sCh[left]] else {
                    left += 1
                    continue
                }
                if leftFreq == 0 {
                    matters -= 1
                    if i - left + 1 < shortLen {
                        shortLen = i - left + 1
                        start = left
                    }
                }
                tFreq[sCh[left]] = leftFreq + 1
                left += 1
            }
        }
        return shortLen == Int.max ? "" : String(sCh[start..<start + shortLen])
    }
}
