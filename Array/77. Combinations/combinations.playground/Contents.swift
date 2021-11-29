import Foundation

// 77. Combinations
// https://leetcode.com/problems/combinations/

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard k <= n else { return [] }
        guard k != 1 else { return (1...n).map{[$0]} }
        guard k != n else { return [[Int](1...n)] }
        var ans = [[Int]]()
        func backtracking(_ currentArr: inout [Int], _ visited: inout Set<Int>,  _  last: Int) {
            guard currentArr.count != k else {
                ans.append(currentArr)
                return
            }
            for num in max(1, last)...n {
                if !visited.contains(num) {
                    currentArr.append(num)
                    visited.insert(num)
                    backtracking(&currentArr, &visited,num)
                    currentArr.removeLast()
                    visited.remove(num)
                }
            }
        }
        var current: [Int] = [], visited: Set<Int> = []
        backtracking(&current, &visited,0)
        return ans
    }
}
