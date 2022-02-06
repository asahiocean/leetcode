import Foundation

// 165. Compare Version Numbers
// https://leetcode.com/problems/compare-version-numbers/

class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let v1comp = verNum(version1), v2comp = verNum(version2)
        let lnv1 = v1comp.count, lnv2 = v2comp.count
        var i = 0
        while i < lnv1 || i < lnv2 {
            let comp1 = (i < lnv1) ? v1comp[i] : 0
            let comp2 = (i < lnv2) ? v2comp[i] : 0
            switch true {
            case comp1 > comp2: return 1
            case comp1 < comp2: return -1
            default: i += 1
            }
        }
        return 0
    }
    private func verNum(_ ver: String) -> [Int] {
        return ver.split(separator: ".").compactMap({ Int($0) })
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
