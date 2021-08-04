import Foundation

// https://leetcode.com/problems/letter-combinations-of-a-phone-number

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let matrix: [Character:[Character]] = ["2":[Character]("abc"),
                                               "3":[Character]("def"),
                                               "4":[Character]("ghi"),
                                               "5":[Character]("jkl"),
                                               "6":[Character]("mno"),
                                               "7":[Character]("pqrs"),
                                               "8":[Character]("tuv"),
                                               "9":[Character]("wxyz")]
        var res = [String](), digs = digits.map({Character($0.lowercased())})
        for num in digs {
            let chars = matrix[num]!
            if res.isEmpty {
                chars.forEach{ res.append("\($0)") }
                continue
            }
            let cur = res; res = [String]()
            chars.forEach({ ch in
                let externStr = cur.map { $0 + "\(ch)" }
                res.append(contentsOf: externStr)
            })
        }
        return res
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.125 (0.127) seconds

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
