import Foundation

// 1630. Arithmetic Subarrays
// https://leetcode.com/problems/arithmetic-subarrays/

class Solution {
    func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        var result: [Bool] = []
        for i in 0..<l.count {
            let arr = [Int](nums[l[i]...r[i]]).sorted()
            var found = true
            for i in 2..<arr.count where arr[i] - arr[i-1] != (arr[1] - arr[0]) {
                found = false
                break
            }
            result.append(found)
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    /*
     In the 0th query, the subarray is [4,6,5]. This can be rearranged as [6,5,4], which is an arithmetic sequence.
     In the 1st query, the subarray is [4,6,5,9]. This cannot be rearranged as an arithmetic sequence.
     In the 2nd query, the subarray is [5,9,3,7]. This can be rearranged as [3,5,7,9], which is an arithmetic sequence.
    */
    func test0() {
        let value = solution.checkArithmeticSubarrays([4,6,5,9,3,7],[0,0,2],[2,3,5])
        XCTAssertEqual(value, [true,false,true])
    }
    
    func test1() {
        let value = solution.checkArithmeticSubarrays([-12,-9,-3,-12,-6,15,20,-25,-20,-15,-10],
                                                      [0,1,6,4,8,7],
                                                      [4,4,9,7,9,10])
        XCTAssertEqual(value, [false,true,false,false,true,true])
    }
}

Tests.defaultTestSuite.run()
