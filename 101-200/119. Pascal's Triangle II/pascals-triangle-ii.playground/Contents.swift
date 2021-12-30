import Foundation

// 119. Pascal's Triangle II
// https://leetcode.com/problems/pascals-triangle-ii/

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        let index = rowIndex + 1
        guard index > 2 else { return [Int](repeating: 1, count: index) }
        var lastRow = [Int](repeating: 1, count: 2)
        for i in 3...index {
            var row = [Int](repeating: 1, count: i)
            for n in 1...i/2 {
                row[n] = lastRow[n-1] + lastRow[n]
                row[i - n - 1] = row[n]
            }
            lastRow = row
        }
        return lastRow
    }
}
