import Foundation

// 215. Kth Largest Element in an Array
// https://leetcode.com/problems/kth-largest-element-in-an-array/

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard let vals = nums.first else { return 0 }
        
        let lhs = nums.filter({ $0 > vals })
        let mids = nums.filter({ $0 == vals })
        let rhs = nums.filter({ $0 < vals })
        
        let lnLhs = lhs.count, lnMid = mids.count
        
        switch true {
        case nums.count == lnMid:  return vals
        case lnLhs > (k - 1):      return findKthLargest(lhs, k)
        case (k - lnLhs) <= lnMid: return findKthLargest(mids, k - lnLhs)
        default:                   return findKthLargest(rhs, k - lnLhs - lnMid)
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findKthLargest([3,2,1,5,6,4], 2)
        XCTAssertEqual(value, 5)
    }
    
    func test1() {
        let value = solution.findKthLargest([3,2,3,1,2,4,5,5,6], 4)
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()
