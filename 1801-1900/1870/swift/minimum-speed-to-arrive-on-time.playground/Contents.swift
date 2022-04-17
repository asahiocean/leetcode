import Foundation

// 1870. Minimum Speed to Arrive on Time
// https://leetcode.com/problems/minimum-speed-to-arrive-on-time/

class Solution {
    func minSpeedOnTime(_ d: [Int], _ h: Double) -> Int {
        let lnD = d.count, hour = Int(h.rounded(.up))
        guard hour >= lnD else { return -1 }
        let maxD = Double(d.last!), maxH = h == h.rounded(.down) ? 1.0 : (h - h.rounded(.down))
        var lhs = 1, rhs = hour > lnD ? d.max()! : max(d.max()!, Int((maxD / maxH).rounded(.up)))
        while lhs < rhs {
            let mid = Double((lhs + rhs) / 2)
            var time = 0.0
            for i in 0..<(lnD - 1) { time += (Double(d[i]) / mid).rounded(.up) }
            time += maxD / mid
            time > h ? (lhs = Int(mid + 1)) : (rhs = Int(mid))
        }
        return lhs
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.minSpeedOnTime([1,3,2], 6)
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.minSpeedOnTime([1,3,2], 2.7)
        XCTAssertEqual(value, 3)
    }
    
    func test2() {
        let value = solution.minSpeedOnTime([1,3,2], 1.9)
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()
