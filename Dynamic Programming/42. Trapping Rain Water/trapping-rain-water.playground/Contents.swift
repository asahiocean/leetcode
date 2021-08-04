import Foundation

// 42. Trapping Rain Water
// https://leetcode.com/problems/trapping-rain-water/

class Solution {
    func trap(_ height: [Int]) -> Int {
        var stack = [Int](), result = 0
        height.indices.forEach {
            while !stack.isEmpty && height[$0] > height[stack.last!] {
                let top = stack.removeLast()
                guard !stack.isEmpty else { break }
                let l = stack.last!
                result += ($0-l-1) * (min(height[$0], height[l]) - height[top])
            }
            stack.append($0)
        }
        return result
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.024 (0.026) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.trap([0,1,0,2,1,0,1,3,2,1,2,1])
        XCTAssertEqual(res, 6)
    }
    func test1() {
        let res = s.trap([4,2,0,3,2,5])
        XCTAssertEqual(res, 9)
    }
}

Tests.defaultTestSuite.run()
