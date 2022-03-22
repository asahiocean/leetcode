import Foundation

// 556. Next Greater Element III
// https://leetcode.com/problems/next-greater-element-iii/

class Solution {
    func nextGreaterElement(_ n: Int) -> Int {
        var arr = Array(String(n)), end = arr.count - 1
        while end > 0 {
            if arr[end] > arr[end-1] {
                var j = end
                while j < arr.count && arr[j] > arr[end-1] { j += 1 }
                (arr[end-1], arr[j-1]) = (arr[j-1], arr[end-1])
                arr = arr[0..<end] + arr[end...].sorted()
                return Int(String(arr))! < Int(pow(2.0, 31.0)) ? Int(String(arr))! : -1
            }
            end -= 1
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    func test0() {
        let value = solution.nextGreaterElement(12)
        XCTAssertEqual(value, 21)
    }
    
    func test1() {
        let value = solution.nextGreaterElement(21)
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()
