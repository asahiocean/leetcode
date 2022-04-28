import Foundation

// 1631. Path With Minimum Effort
// https://leetcode.com/problems/path-with-minimum-effort/

class Solution {
    func minimumEffortPath(_ h: [[Int]]) -> Int {
        guard !h.isEmpty else { return 0 }
        let row = h.count, col = h[0].count
        guard row * col > 1 else { return 0 }
        var maxd = 0, graph = [Int:[Int:Int]]() // [from: *, to: *]
        for r in 0..<row {
            for c in 0..<col {
                for (x,y) in [(0,1),(0,-1),(1,0),(-1,0)] {
                    let newX = r + x, newY = c + y
                    guard newX >= 0 && newX < row && newY >= 0 && newY < col else { continue }
                    let dis = abs(h[r][c] - h[newX][newY])
                    maxd = max(dis, maxd)
                    graph[r << 8 | c, default: [:]][newX << 8 | newY] = dis
                }
            }
        }
        func check(_ limit: Int) -> Bool {
            var vis = Set<Int>(), queue = [0]
            vis.insert(0)
            while !queue.isEmpty {
                var lvl = [Int]()
                for p in queue {
                    for (np,dt) in graph[p, default: [:]] where !vis.contains(np) && dt <= limit {
                        guard np != (row - 1) << 8 | (col - 1) else { return true }
                        vis.insert(np)
                        lvl.append(np)
                    }
                }
                queue = lvl
            }
            return false
        }
        var lhs = 0, rhs = maxd, chkd = Set<Int>(), res = Int.max
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) >> 1
            chkd.insert(mid)
            if check(mid) {
                res = min(res, mid)
                rhs = mid - 1
            } else {
                lhs = mid + 1
            }
        }
        return chkd.contains(lhs) ? res : (check(lhs) ? min(res, lhs) : res)
    }
}
