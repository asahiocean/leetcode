import Foundation

// 946. Validate Stack Sequences
// https://leetcode.com/problems/validate-stack-sequences/

class Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        var arr: [Int] = [], idx = 0
        
        for n in pushed {
            arr.append(n)
            while arr.count > 0, idx < popped.count, arr.last! == popped[idx] {
                idx += 1
                arr.removeLast()
            }
        }
        return idx == popped.count
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /*
         We might do the following sequence:
         push(1), push(2), push(3), push(4),
         pop() -> 4,
         push(5),
         pop() -> 5, pop() -> 3, pop() -> 2, pop() -> 1
     */
    func test0() {
        let value = solution.validateStackSequences([1,2,3,4,5], [4,5,3,2,1])
        XCTAssertEqual(value, true)
    }
    
    // 1 cannot be popped before 2.
    func test1() {
        let value = solution.validateStackSequences([1,2,3,4,5], [4,3,5,1,2])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
