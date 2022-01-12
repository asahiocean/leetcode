import Foundation

// 1079. Letter Tile Possibilities
// https://leetcode.com/problems/letter-tile-possibilities/

class Solution {
    func numTilePossibilities(_ tiles: String) -> Int {
        
        var result: Set<String> = []
        let chars: [Character] = [Character](tiles)
        let len = tiles.count
        
        func dfs(_ currStr: inout String, _ visited: inout [Bool]) {
            if !currStr.isEmpty {
                result.insert(currStr)
            }
            for i in 0..<len where !visited[i] {
                currStr.append(chars[i])
                visited[i] = true
                dfs(&currStr, &visited)
                currStr.removeLast()
                visited[i] = false
            }
        }
        
        var visited = [Bool](repeating: false, count: len)
        
        for i in 0..<len {
            var str = String(chars[i])
            
            if !result.contains(str) {
                visited[i] = true
                dfs(&str, &visited)
                visited[i] = false
            }
        }
        return result.count
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
