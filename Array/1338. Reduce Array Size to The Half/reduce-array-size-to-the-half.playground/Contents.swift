import Foundation

// https://leetcode.com/problems/reduce-array-size-to-the-half/
// Discuss: https://vk.cc/c3S0ff

class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        guard 1 <= arr.count && arr.count <= Int(10e5) else { return 0 }
        var dict: [Int:Int] = [:]
        arr.forEach { dict[$0, default: 0] += 1 }
        var count = arr.count
        let values = dict.values.sorted { $0 > $1 }
        for i in stride(from: 0, to: values.count, by: 1) {
            count -= values[i]
            if count * 2 <= arr.count { return i + 1 }
        }
        return values.count
    }
}

import XCTest

// Executed 5 tests, with 0 failures (0 unexpected) in 0.089 (0.092) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.minSetSize([3,3,3,3,5,5,5,2,2,7])
        XCTAssertEqual(res, 2)
    }
    func test1() {
        let res = s.minSetSize([7,7,7,7,7,7])
        XCTAssertEqual(res, 1)
    }
    func test2() {
        let res = s.minSetSize([1,9])
        XCTAssertEqual(res, 1)
    }
    func test3() {
        let res = s.minSetSize([1000,1000,3,7])
        XCTAssertEqual(res, 1)
    }
    func test4() {
        let res = s.minSetSize([1,2,3,4,5,6,7,8,9,10])
        XCTAssertEqual(res, 5)
    }
}

Tests.defaultTestSuite.run()
