import Foundation

// 1108. Defanging an IP Address
// https://leetcode.com/problems/defanging-an-ip-address/

class Solution {
    func defangIPaddr(_ address: String) -> String {
        return address.components(separatedBy: ".").joined(separator: "[.]")
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func testExample1() {
        let value = solution.defangIPaddr("1.1.1.1")
        XCTAssertEqual(value, "1[.]1[.]1[.]1")
    }
    
    func testExample2() {
        let value = solution.defangIPaddr("255.100.50.0")
        XCTAssertEqual(value, "255[.]100[.]50[.]0")
    }
}

Tests.defaultTestSuite.run()
