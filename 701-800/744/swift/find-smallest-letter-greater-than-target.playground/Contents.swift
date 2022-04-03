import Foundation

// 744. Find Smallest Letter Greater Than Target
// https://leetcode.com/problems/find-smallest-letter-greater-than-target/

class Solution {
    func nextGreatestLetter(_ letters: [Character], _ t: Character) -> Character {
        let set = Set(letters).sorted()
        let len = set.count, first = set[0]
        guard len >  1 else { return first }
        if t >= set.last! || t < first { return first }
        for i in 0..<(len - 1) where t >= set[i]  && t < set[i + 1] {
            return set[i + 1]
        }
        return " "
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.nextGreatestLetter(["c","f","j"],"a")
        XCTAssertEqual(value, "c")
    }
    
    func test1() {
        let value = solution.nextGreatestLetter(["c","f","j"],"c")
        XCTAssertEqual(value, "f")
    }
    
    func test2() {
        let value = solution.nextGreatestLetter(["c","f","j"],"d")
        XCTAssertEqual(value, "f")
    }
}

Tests.defaultTestSuite.run()
