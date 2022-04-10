import Foundation

// 682. Baseball Game
// https://leetcode.com/problems/baseball-game/

class Solution {
    func calPoints(_ ops: [String]) -> Int {
        var arr: [Int] = []
        for i in ops {
            switch i {
            case "+":
                let len = arr.count
                arr.append(arr[len - 1] + arr[len - 2])
            case "C":
                arr.removeLast()
            case "D":
                arr.append((arr.last ?? 0) * 2)
            default:
                arr.append(Int(i) ?? 0)
            }
        }
        return arr.reduce(0, +)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // "5" - Add 5 to the record, record is now [5].
    // "2" - Add 2 to the record, record is now [5, 2].
    // "C" - Invalidate and remove the previous score, record is now [5].
    // "D" - Add 2 * 5 = 10 to the record, record is now [5, 10].
    // "+" - Add 5 + 10 = 15 to the record, record is now [5, 10, 15].
    // The total sum is 5 + 10 + 15 = 30.
    func test0() {
        let value = solution.calPoints(["5","2","C","D","+"])
        XCTAssertEqual(value, 30)
    }
    
    // "5" - Add 5 to the record, record is now [5].
    // "-2" - Add -2 to the record, record is now [5, -2].
    // "4" - Add 4 to the record, record is now [5, -2, 4].
    // "C" - Invalidate and remove the previous score, record is now [5, -2].
    // "D" - Add 2 * -2 = -4 to the record, record is now [5, -2, -4].
    // "9" - Add 9 to the record, record is now [5, -2, -4, 9].
    // "+" - Add -4 + 9 = 5 to the record, record is now [5, -2, -4, 9, 5].
    // "+" - Add 9 + 5 = 14 to the record, record is now [5, -2, -4, 9, 5, 14].
    // The total sum is 5 + -2 + -4 + 9 + 5 + 14 = 27.
    func test1() {
        let value = solution.calPoints(["5","-2","4","C","D","9","+","+"])
        XCTAssertEqual(value, 27)
    }
    
    func test2() {
        let value = solution.calPoints(["1"])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
