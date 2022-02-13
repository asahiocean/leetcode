import Foundation

// 18. 4Sum
// https://leetcode.com/problems/4sum/

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let len = nums.count
        guard len >= 4 else { return [] }
        
        var result = [[Int]]()
        let sort = nums.sorted()
        
        for a in 0..<(len - 1) where a == 0 || sort[a] != sort[a-1] {
            for b in (a + 1)..<len where b == a + 1 || sort[b] != sort[b-1] {
                var c = b + 1, d = len - 1
                while c < d {
                    let val = (a: sort[a], b: sort[b], c: sort[c], d: sort[d])
                    let sum = (val.a + val.b + val.c + val.d)
                    if sum == target { result.append([val.a,val.b,val.c,val.d]) }
                    if sum < target {
                        while sort[c] == val.c, c < d { c += 1 }
                    } else {
                        while sort[d] == val.d, d > b { d -= 1 }
                    }
                }
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.fourSum([1,0,-1,0,-2,2], 0)
        XCTAssertEqual(value, [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]])
    }
    func test1() {
        let value = solution.fourSum([2,2,2,2,2], 8)
        XCTAssertEqual(value, [[2,2,2,2]])
    }
}

Tests.defaultTestSuite.run()
