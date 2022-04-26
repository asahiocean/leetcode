import Foundation

// 1584. Min Cost to Connect All Points
// https://leetcode.com/problems/min-cost-to-connect-all-points/

class Solution {
    private struct Point {
        let x: Int, y: Int
        /// Manhattan distance calculator
        func dist(to p: Point) -> Int { abs(x - p.x) + abs(p.y - y) }
    }
        
    func minCostConnectPoints(_ p: [[Int]]) -> Int {
        let len = p.count, pmap = p.map({ Point(x: $0[0], y: $0[1] )})
        guard len > 2 else { return len > 1 ? pmap[0].dist(to: pmap[1]) : 0 }
    
        typealias Edge = (a: Int, b: Int, d: Int)
        var res = 0, connected = 0, paths = [Int](0..<len), edges = [Edge]()
        
        paths.forEach { p in
            var dot = p + 1
            while dot < len {
                edges.append((p, dot, pmap[p].dist(to: pmap[dot])))
                dot += 1
            }
        }
        edges.sort { $0.d < $1.d }
        
        func find(_ n: Int) -> Int { paths[n] != n ? find(paths[n]) : n }
        
        for e in edges where connected < (len - 1) {
            let dot = (a: find(e.a), b: find(e.b))
            if dot.a != dot.b {
                paths[dot.a] = paths[dot.b]
                connected += 1
                res += e.d
            }
        }
        return res
    }
}
