import Foundation

// 1079. Letter Tile Possibilities
// https://leetcode.com/problems/letter-tile-possibilities/

class Solution {
    func numTilePossibilities(_ t: String) -> Int {
        guard !t.isEmpty else { return 0 }
        var res = Set<String>(), vis = [Bool](repeating: false, count: t.count)
        let arr = Array(t)
        
        for i in 0..<t.count {
            var str = String(arr[i])
            if !res.contains(str) {
                vis[i] = true
                dfs(&str, &vis)
                vis[i] = false
            }
        }
        func dfs(_ cs: inout String, _ vis: inout [Bool]) {
            if !cs.isEmpty { res.insert(cs) }
            for i in 0..<t.count where !vis[i] {
                cs.append(arr[i])
                vis[i] = true
                dfs(&cs, &vis)
                cs.removeLast()
                vis[i] = false
            }
        }
        return res.count
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.046 (0.048) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The possible sequences are "A", "B", "AA", "AB", "BA", "AAB", "ABA", "BAA".
    func test0() {
        let value = solution.numTilePossibilities("AAB")
        XCTAssertEqual(value, 8)
    }
    
    func test1() {
        let value = solution.numTilePossibilities("AAABBC")
        XCTAssertEqual(value, 188)
    }
    
    func test2() {
        let value = solution.numTilePossibilities("V")
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
