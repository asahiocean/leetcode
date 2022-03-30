import Foundation

// 38. Count and Say
// https://leetcode.com/problems/count-and-say/

class Solution {
    func countAndSay(_ n: Int) -> String {
        guard n > 1 && n <= 30 else { return "1" }
        
        let prev = countAndSay(n - 1)
        var curr = prev.first!, count = 0, result = ""
        func say() { result += "\(count)\(curr)" }
        
        prev.forEach {
            if $0 != curr {
                say()
                count = 1
                curr = $0
            } else {
                count += 1
            }
        }
        say()
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // This is the base case.
    func test0() {
        let value = solution.countAndSay(1)
        XCTAssertEqual(value, "1")
    }
    
    /*
    countAndSay(1) = "1"
    countAndSay(2) = say "1" = one 1 = "11"
    countAndSay(3) = say "11" = two 1's = "21"
    countAndSay(4) = say "21" = one 2 + one 1 = "12" + "11" = "1211"
    */
    func test1() {
        let value = solution.countAndSay(4)
        XCTAssertEqual(value, "1211")
    }
}

Tests.defaultTestSuite.run()
