import Foundation

// 911. Online Election
// https://leetcode.com/problems/online-election/

class TopVotedCandidate {
    
    private typealias Result  = (time: Int, result: [Int:Int], win: Int)
    private var results: [Result] = []
    
    init(_ persons: [Int], _ times: [Int]) {
        for i in 0..<persons.count {
            if var rlast = results.last {
                rlast.time  = times[i]
                let res = rlast.result[persons[i]]
                rlast.result.updateValue(res != nil ? (res! + 1) : 1, forKey: persons[i])
                if rlast.result[persons[i], default: 0] >= rlast.result[rlast.win, default: 0] {
                    rlast.win = persons[i]
                    results.append(rlast)
                } else {
                    results.append(rlast)
                }
            } else {
                results.append((times[i], [persons[i]:1], persons[i]))
            }
        }
    }
    func q(_ t: Int) -> Int {
        var lhs = 0, rhs = results.count
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) >> 1
            if results[mid].time > t { rhs = mid } else { lhs = mid + 1 }
        }
        return results[lhs - 1].win
    }
}
