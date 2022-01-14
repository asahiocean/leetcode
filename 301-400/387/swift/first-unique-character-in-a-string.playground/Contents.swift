import Foundation

// 387. First Unique Character in a String
// https://leetcode.com/problems/first-unique-character-in-a-string/

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        
        var arr = Array(repeating: 0, count: 26)
        let scalarA = UnicodeScalar("a").value
        
        for ch in s.unicodeScalars {
            arr[Int(ch.value - scalarA)] += 1
        }
        
        var count = 0
        
        for ch in s.unicodeScalars {
            if arr[Int(ch.value - scalarA)] == 1 { return count }
            count += 1
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.025 (0.027) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.firstUniqChar("leetcode")
        XCTAssertEqual(value, 0)
    }
    
    func test1() {
        let value = solution.firstUniqChar("loveleetcode")
        XCTAssertEqual(value, 2)
    }
    
    func test2() {
        let value = solution.firstUniqChar("aabb")
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()
