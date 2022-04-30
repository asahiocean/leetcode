import Foundation

// 399. Evaluate Division
// https://leetcode.com/problems/evaluate-division/

class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var res = [Double]()
        typealias SSD = [String:[(String,Double)]]
        let dict: SSD = {
            var dct = SSD()
            for (i,e) in equations.enumerated() {
                guard let dvd = e.first, let dvs = e.last else { continue }
                dct[dvd] = dct[dvd, default: []] + [(dvs, values[i])]
                dct[dvs] = dct[dvs, default: []] + [(dvd, 1.0 / values[i])]
            }
            return dct
        }()
        for q in queries {
            guard let fst = q.first, let lst = q.last else {
                res.append(-1.0)
                continue
            }
            guard dict[fst] != nil, dict[lst] != nil else {
                res.append(-1.0)
                continue
            }
            bfs(q, dict, &res)
        }
        func bfs(_ query: [String], _ dict: SSD, _ rest: inout [Double]) {
            guard let fst = query.first, let lst = query.last else { rest.append(-1.0); return }
            var visit = Set([fst]), queue = (str: [fst], val: [1.0])
            
            while !queue.str.isEmpty {
                let cur = (str: queue.str.removeFirst(), val: queue.val.removeFirst())
                guard cur.0 != lst else { rest.append(cur.1); return }
                guard let cands = dict[cur.0] else { continue }
                for (s,v) in cands where !visit.contains(s) {
                    visit.insert(s)
                    queue.str.append(s)
                    queue.val.append(cur.1 * v)
                }
            }
            rest.append(-1.0)
        }
        return res
    }
}
