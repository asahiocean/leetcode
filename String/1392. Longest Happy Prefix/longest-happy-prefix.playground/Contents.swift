import Foundation

// 1392. Longest Happy Prefix
// https://leetcode.com/problems/longest-happy-prefix/

class Solution {
    func longestPrefix(_ s: String) -> String {
        guard !s.isEmpty else { return "" }
        let arr = Array(s)
        var num = -1, next = [Int](repeating: -1, count: s.count)
        for i in 1..<s.count {
            let chr = arr[i]
            while num != -1 && arr[num + 1] != chr { num = next[num] }
            if arr[num + 1] == chr { num += 1 }
            next[i] = num
        }
        return next[s.count-1] == -1 ? "" : String(arr[0...next[s.count-1]])
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // s contains 4 prefix excluding itself ("l", "le", "lev", "leve"), and suffix ("l", "el", "vel", "evel").
    // The largest prefix which is also suffix is given by "l".
    func test0() {
        let value = solution.longestPrefix("level")
        XCTAssertEqual(value, "l")
    }
    
    // "abab" is the largest prefix which is also suffix. They can overlap in the original string.
    func test1() {
        let value = solution.longestPrefix("ababab")
        XCTAssertEqual(value, "abab")
    }
}

Tests.defaultTestSuite.run()
