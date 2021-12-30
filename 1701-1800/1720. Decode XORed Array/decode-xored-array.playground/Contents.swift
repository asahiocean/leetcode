import Foundation

// https://leetcode.com/problems/decode-xored-array/

class Solution {
    func decode(_ encoded: [Int], _ first: Int) -> [Int] {
        var ans = [first]
        encoded.forEach({ ans.append(ans.last! ^ $0) })
        return ans
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssertEqual(s.decode([1,2,3], 1), [1,0,2,1]) // success
    }
    func testExample2() {
        XCTAssertEqual(s.decode([6,2,7,3], 4), [4,2,0,7,4]) // success
    }
}

Tests.defaultTestSuite.run()
