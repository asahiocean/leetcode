import Foundation

// 17. Letter Combinations of a Phone Number
// https://leetcode.com/problems/letter-combinations-of-a-phone-number/

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let matrix: [Character:[Character]] = ["2":["a","b","c"],
                                               "3":["d","e","f"],
                                               "4":["g","h","i"],
                                               "5":["j","k","l"],
                                               "6":["m","n","o"],
                                               "7":["p","q","r","s"],
                                               "8":["t","u","v"],
                                               "9":["w","x","y","z"]]
        var res = [String](), digs = digits.map({Character($0.lowercased())})
        for num in digs {
            let chars = matrix[num]!
            if res.isEmpty { chars.forEach{ res.append("\($0)") }; continue }
            let cur = res; res = [String]()
            chars.forEach { ch in res.append(contentsOf: cur.map { $0 + "\(ch)" }) }
        }
        return res
    }
}

// MARK: - Test Cases -

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.117 (0.119) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.letterCombinations("23")
        XCTAssertEqual(res, ["ad","bd","cd","ae","be","ce","af","bf","cf"])
    }
    func test1() {
        let res = s.letterCombinations("")
        XCTAssertEqual(res, [])
    }
    func test2() {
        let res = s.letterCombinations("2")
        XCTAssertEqual(res, ["a","b","c"])
    }
}

Tests.defaultTestSuite.run()
