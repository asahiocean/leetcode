import Foundation

// 77. Combinations
// https://leetcode.com/problems/combinations/

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard k <= n else { return [] }
        guard k != 1 else { return (1...n).map{[$0]} }
        guard k != n else { return [[Int](1...n)] }
        
        var current: [Int] = []
        var visited: Set<Int> = []
        var result = [[Int]]()
        
        func backtracking(_ result: inout [[Int]], _ current: inout [Int], _ visited: inout Set<Int>,  _  last: Int) {
            guard current.count != k else {
                result.append(current)
                return
            }
            for num in max(1, last)...n where !visited.contains(num) {
                current.append(num)
                visited.insert(num)
                backtracking(&result, &current, &visited,num)
                current.removeLast()
                visited.remove(num)
            }
        }
        
        backtracking(&result, &current, &visited,0)
        return result
    }
}
