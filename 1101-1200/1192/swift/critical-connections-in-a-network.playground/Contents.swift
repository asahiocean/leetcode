import Foundation

// 1192. Critical Connections in a Network
// https://leetcode.com/problems/critical-connections-in-a-network/

class Solution {
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        var graph = [[Int]](repeating: [], count: n)
        for c in connections {
            graph[c[0]].append(c[1])
            graph[c[1]].append(c[0])
        }
        var res = [[Int]](),
            idx = 0,
            low = [Int](repeating: -1, count: n),
            dfn = low,
            vis = [Bool](repeating: false, count: n)
        
        func dfs(_ at: Int, _ p: Int) {
            idx += 1
            low[at] = idx
            dfn[at] = idx
            vis[at] = true
            for to in graph[at] where to != p {
                if vis[to] {
                    low[at] = min(low[at], dfn[to])
                } else {
                    dfs(to, at)
                    low[at] = min(low[at], low[to])
                    if dfn[at] < low[to] { res.append([at,to]) }
                }
            }
        }
        dfs(0, -1)
        return res
    }
}
