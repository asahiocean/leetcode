import Foundation

// 1392. Longest Happy Prefix
// https://leetcode.com/problems/longest-happy-prefix/

class Solution {
    func longestPrefix(_ s: String) -> String {
        let len = s.count
        guard len > 1 else { return "" }
        
        let chars = [Character](s)
        var next = [Int](repeating: -1, count: len)
        
        var num = -1
        
        for i in 1..<len {
            let val = chars[i]
            
            while num != -1 && chars[num + 1] != val {
                num = next[num]
            }
            if chars[num + 1] == val { num += 1 }
            next[i] = num
        }
        return next[len-1] == -1 ? "" : String(chars[0...next[len-1]])
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
