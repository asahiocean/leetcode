import Foundation

// 1675. Minimize Deviation in Array
// https://leetcode.com/problems/minimize-deviation-in-array/

class Solution {
    func minimumDeviation(_ nums: [Int]) -> Int {
        var res = Int.max, low = Int.max, arr: [Int] = []
        
        for n in nums {
            let val = n % 2 != 0 ? n * 2 : n
            arr.append(val)
            low = min(low, val)
        }
        arr.sort(by: >)
        
        while arr[0] % 2 == 0 {
            for i in 0..<arr.count {
                let val = arr[i]
                if (val % 2) != 0 || val < arr[0] { break }
                res = min(res, val - low)
                low = min(low, val / 2)
                arr[i] /= 2
            }
            arr.sort(by: >)
        }
        return min(res, arr[0] - low)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // You can transform the array to [1,2,3,2],
    // then to [2,2,3,2], then the deviation will be 3 - 2 = 1.
    func test0() {
        let value = solution.minimumDeviation([1,2,3,4])
        XCTAssertEqual(value, 1)
    }
    
    // You can transform the array after two operations to [4,2,5,5,3],
    // then the deviation will be 5 - 2 = 3.
    func test1() {
        let value = solution.minimumDeviation([4,1,5,20,3])
        XCTAssertEqual(value, 3)
    }
    
    func test2() {
        let value = solution.minimumDeviation([2,10,8])
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
