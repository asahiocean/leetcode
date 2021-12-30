import Foundation

// 1306. Jump Game III
// https://leetcode.com/problems/jump-game-iii/

class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var visited = [Bool](repeating: false, count: arr.count)
        visited[start] = true
        return dfs(arr, start, &visited)
    }
    
    private func dfs(_ arr: [Int], _ pos: Int, _ visited: inout [Bool]) -> Bool {
        guard arr[pos] != 0 else { return true }
        for p in [pos + arr[pos], pos - arr[pos]] where p >= 0 && p < arr.count && !visited[p] {
            visited[p] = true
            if dfs(arr, p, &visited) { return true }
            visited[p] = false
        }
        return false
    }
}
