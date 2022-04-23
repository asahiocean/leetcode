import Foundation

// 77. Combinations
// https://leetcode.com/problems/combinations/

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        guard k <= n else { return [] }
        guard k != 1 else { return (1...n).map{[$0]} }
        guard k != n else { return [[Int](1...n)] }
        var res = [[Int]](), cur = [Int](), vis = Set<Int>()
        backtracking(&res, &cur, &vis, 0, n, k)
        return res
    }
    private func backtracking(_ r: inout [[Int]], _ c: inout [Int], _ v: inout Set<Int>,  _ l: Int, _ n: Int, _ k: Int) {
        guard c.count != k else {
            r.append(c)
            return
        }
        for i in max(1, l)...n where !v.contains(i) {
            c.append(i)
            v.insert(i)
            backtracking(&r, &c, &v, i, n, k)
            c.removeLast()
            v.remove(i)
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.025 (0.027) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.combine(4, 2)
        XCTAssertEqual(value, [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]])
    }
    
    func test1() {
        let value = solution.combine(1, 1)
        XCTAssertEqual(value, [[1]])
    }
}

Tests.defaultTestSuite.run()
