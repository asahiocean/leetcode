import Foundation

// 165. Compare Version Numbers
// https://leetcode.com/problems/compare-version-numbers/

class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let arrV1 = arrVer(version1), arrV2 = arrVer(version2)
        let lnV1 = arrV1.count, lnV2 = arrV2.count
        var rvs = 0 // revisions
        while rvs < lnV1 || rvs < lnV2 {
            let comp1 = (rvs < lnV1) ? arrV1[rvs] : 0
            let comp2 = (rvs < lnV2) ? arrV2[rvs] : 0
            if comp1 > comp2 { return 1 }
            if comp1 < comp2 { return -1 }
            rvs += 1
        }
        return 0
    }
    private func arrVer(_ v: String) -> [Int] {
        return v.split(separator: ".").compactMap({Int($0)})
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Ignoring leading zeroes, both "01" and "001" represent the same integer "1".
    func test0() {
        let value = solution.compareVersion("1.01", "1.001")
        XCTAssertEqual(value, 0)
    }
    
    // version1 does not specify revision 2, which means it is treated as "0".
    func test1() {
        let value = solution.compareVersion("1.0", "1.0.0")
        XCTAssertEqual(value, 0)
    }
    
    // version1's revision 0 is "0", while version2's revision 0 is "1". 0 < 1, so version1 < version2.
    func test2() {
        let value = solution.compareVersion("0.1", "1.1")
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()
