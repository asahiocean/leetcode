import Foundation

// 118. Pascal's Triangle
// https://leetcode.com/problems/pascals-triangle/

class Solution {
    func generate(_ nr: Int) -> [[Int]] {
        guard (1...30) ~= nr else { return [] }
        var res = [[Int]]()
        for i in 1...nr {
            var row = [Int](repeating: 1, count: i)
            if i <= 2 {
                res.append(row)
            } else if let last = res.last {
                for k in 1...(i / 2) {
                    row[k] = last[k-1] + last[k]
                    row[i - k - 1] = row[k]
                }
                res.append(row)
            }
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.generate(5)
        XCTAssertEqual(value, [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]])
    }
    
    func test1() {
        let value = solution.generate(1)
        XCTAssertEqual(value, [[1]])
    }
}

Tests.defaultTestSuite.run()
