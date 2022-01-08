import Foundation

// 1239. Maximum Length of a Concatenated String with Unique Characters
// https://leetcode.com/problems/maximum-length-of-a-concatenated-string-with-unique-characters/

class Solution {
    private typealias Chars = Set<Character>
    func maxLength(_ arr: [String]) -> Int {
        var map: [String:Chars] = [:], value = 0
        for s in arr {
            let chars = Chars(s)
            if chars.count == s.count {
                for (k,ex) in map where ex.intersection(chars).isEmpty {
                    let str = ("" + k + s)
                    map[str] = ex.union(chars)
                    value = max(value, str.count)
                }
                map[s] = chars
                value = max(value, s.count)
                if value == 26 { return 26 }
            }
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.018 (0.020) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.maxLength(["un","iq","ue"])
        XCTAssertEqual(value, 4)
    }
    
    func test1() {
        let value = solution.maxLength(["cha","r","act","ers"])
        XCTAssertEqual(value, 6)
    }
    
    func test2() {
        let value = solution.maxLength(["abcdefghijklmnopqrstuvwxyz"])
        XCTAssertEqual(value, 26)
    }
}

Tests.defaultTestSuite.run()
