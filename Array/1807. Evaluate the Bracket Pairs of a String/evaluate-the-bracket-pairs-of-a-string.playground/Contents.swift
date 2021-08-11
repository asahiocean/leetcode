import Foundation

// https://leetcode.com/problems/evaluate-the-bracket-pairs-of-a-string/
// Discuss: https://vk.cc/c3NLdj

class Solution {
    func evaluate(_ s: String, _ knowledge: [[String]]) -> String {
        let map = knowledge.reduce(into: [String:String](), { $0[$1[0]] = $1[1] })
        var key = "", isKey = false, result = ""
        s.forEach{
            switch $0 {
            case "(": isKey = true; key = ""
            case ")": isKey = false; result += map[key, default: "?"]
            default: isKey ? (key += "\($0)") : (result += "\($0)")
            }
        }
        return result
    }
}

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.038 (0.040) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.evaluate("(name)is(age)yearsold", [["name","bob"],["age","two"]])
        XCTAssertEqual(res, "bobistwoyearsold")
    }
    func test1() {
        let res = s.evaluate("hi(name)", [["a","b"]])
        XCTAssertEqual(res, "hi?")
    }
    func test2() {
        let res = s.evaluate("(a)(a)(a)aaa", [["a","yes"]])
        XCTAssertEqual(res, "yesyesyesaaa")
    }
    func test3() {
        let res = s.evaluate("(a)(b)", [["a","b"],["b","a"]])
        XCTAssertEqual(res, "ba")
    }
}

Tests.defaultTestSuite.run()
