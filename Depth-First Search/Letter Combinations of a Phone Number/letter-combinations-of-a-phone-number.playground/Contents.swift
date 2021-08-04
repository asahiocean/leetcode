import Foundation

// https://leetcode.com/problems/letter-combinations-of-a-phone-number

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let matrix: [Character:[Character]] = ["2":Array<Character>("abc"),
                                               "3":Array<Character>("def"),
                                               "4":Array<Character>("ghi"),
                                               "5":Array<Character>("jkl"),
                                               "6":Array<Character>("mno"),
                                               "7":Array<Character>("pqrs"),
                                               "8":Array<Character>("tuv"),
                                               "9":Array<Character>("wxyz")]
        var res = [String](), digs = digits.map({Character($0.lowercased())})
        for num in digs {
            let chars = matrix[num]!
            if res.isEmpty {
                chars.forEach({ res.append("\($0)") })
                continue
            }
            let cur = res; res = [String]()
            chars.forEach({ ch in
                let externStr = cur.map { (str) -> String in
                    str + "\(ch)"
                }
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
    func test1() {
        let res = s.letterCombinations("23")
        XCTAssertEqual(res, ["ad","bd","cd","ae","be","ce","af","bf","cf"])
    }
    func test2() {
        let res = s.letterCombinations("")
        XCTAssertEqual(res, [])
    }
    func test3() {
        let res = s.letterCombinations("2")
        XCTAssertEqual(res, ["a","b","c"])
    }
}

Tests.defaultTestSuite.run()
