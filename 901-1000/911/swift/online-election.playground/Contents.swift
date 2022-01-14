import Foundation

// 911. Online Election
// https://leetcode.com/problems/online-election/

class TopVotedCandidate {
    
    typealias Result  = (time: Int, result: [Int:Int], win: Int)
    var results: [Result] = []
    
    init(_ persons: [Int], _ times: [Int]) {
        for i in 0..<persons.count {
            if var resultLast = results.last {
                resultLast.time  = times[i]
                
                let res = resultLast.result[persons[i]]
                resultLast.result.updateValue(res != nil ? (res! + 1) : 1, forKey: persons[i])
                
                if let lastWinCount = resultLast.result[resultLast.win], let new = resultLast.result[persons[i]], new >= lastWinCount {
                    resultLast.win = persons[i]
                    results.append(resultLast)
                } else {
                    results.append(resultLast)
                }
            } else {
                results.append((times[i], [persons[i]:1], persons[i]))
            }
        }
    }
    
    func q(_ t: Int) -> Int {
        var left = 0, right = results.count
        while left < right {
            let mid = left + (right - left) >> 1
            if results[mid].time > t {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return results[left - 1].win
    }
}

/**
 * Your TopVotedCandidate object will be instantiated and called as such:
 * let obj = TopVotedCandidate(persons, times)
 * let ret_1: Int = obj.q(t)
 */
