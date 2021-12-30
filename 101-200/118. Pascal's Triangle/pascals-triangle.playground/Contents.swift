import Foundation

// 118. Pascal's Triangle
// https://leetcode.com/problems/pascals-triangle/

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        for i in 1...numRows where numRows > 0 {
            var row = [Int](repeating: 1, count: i)
            if i <= 2 {
                result.append([Int](repeating: 1, count: i))
            } else if let lastRow = result.last {
                for k in 1...i/2 {
                    row[k] = lastRow[k-1] + lastRow[k]
                    row[i - k - 1] = row[k]
                }
                result.append(row)
            }
        }
        return result
    }
}