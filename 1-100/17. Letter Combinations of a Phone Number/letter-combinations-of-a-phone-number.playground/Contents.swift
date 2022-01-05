import Foundation

// 17. Letter Combinations of a Phone Number
// https://leetcode.com/problems/letter-combinations-of-a-phone-number/

class Solution {
    private let matrix: [Character:[Character]] = ["2":["a","b","c"],
                                                   "3":["d","e","f"],
                                                   "4":["g","h","i"],
                                                   "5":["j","k","l"],
                                                   "6":["m","n","o"],
                                                   "7":["p","q","r","s"],
                                                   "8":["t","u","v"],
                                                   "9":["w","x","y","z"]]
    func letterCombinations(_ digits: String) -> [String] {
        var digs = digits.map { Character($0.lowercased()) }, result: [String] = []
        for n in digs {
            guard let chars = matrix[n] else { break }
            guard !(result.isEmpty) else {
                chars.forEach { result.append("\($0)") }
                continue
            }
            
            let current = result
            result.removeAll()
            
            for ch in chars {
                result.append(contentsOf: current.map { $0 + "\(ch)" })
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.078 (0.080) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.letterCombinations("23")
        XCTAssertEqual(value, ["ad","bd","cd","ae","be","ce","af","bf","cf"])
    }
    func test1() {
        let value = solution.letterCombinations("")
        XCTAssertEqual(value, [])
    }
    func test2() {
        let value = solution.letterCombinations("2")
        XCTAssertEqual(value, ["a","b","c"])
    }
}

Tests.defaultTestSuite.run()
