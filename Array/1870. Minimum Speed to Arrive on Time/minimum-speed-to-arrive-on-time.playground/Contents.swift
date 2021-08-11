import Foundation

// https://leetcode.com/problems/minimum-speed-to-arrive-on-time/
// Discuss: https://vk.cc/c3RYQq

class Solution {
    func minSpeedOnTime(_ dist: [Int], _ hour: Double) -> Int {
        let n = dist.count, maxd = dist.max()!
        let hourVal: Int = Int(hour.rounded(.up))
        guard hourVal >= n else { return -1 }
        let dlast = Double(dist.last!), lastHour = hour == hour.rounded(.down) ? 1.0 : (hour - hour.rounded(.down))
        var value = 1, r = hourVal > n ? maxd : max(maxd, Int((dlast / lastHour).rounded(.up)))
        while value < r {
            let center = Double((value + r) / 2)
            var time: Double = 0.0
            for i in 0..<(n - 1) { time += (Double(dist[i]) / center).rounded(.up) }
            time += dlast / center
            time > hour ? (value = Int(center + 1)) : (r = Int(center))
        }
        return value
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

class Tests: XCTestCase {
    let s = Solution()
    func test0() {
        let res = s.minSpeedOnTime([1,3,2], 6)
        XCTAssertEqual(res, 1)
    }
    func test1() {
        let res = s.minSpeedOnTime([1,3,2], 2.7)
        XCTAssertEqual(res, 3)
    }
    func test2() {
        let res = s.minSpeedOnTime([1,3,2], 1.9)
        XCTAssertEqual(res, -1)
    }
}

Tests.defaultTestSuite.run()
