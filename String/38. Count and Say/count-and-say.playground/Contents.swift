import Foundation

// 38. Count and Say
// https://leetcode.com/problems/count-and-say/

class Solution {
    func countAndSay(_ n: Int) -> String {
        guard n > 1 && n <= 30 else { return "1" }
        
        let prev = countAndSay(n - 1)
        var curr = prev.first!, count = 0, result = ""
        
        prev.forEach {
            if $0 != curr {
                result += "\(count)\(curr)"
                count = 1
                curr = $0
            } else {
                count += 1
            }
        }
        result += "\(count)\(curr)"
        return result
        
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        XCTAssertEqual(s.countAndSay(1), "1")
    }
    func test1() {
        XCTAssertEqual(s.countAndSay(4), "1211")
    }
}

Tests.defaultTestSuite.run()
