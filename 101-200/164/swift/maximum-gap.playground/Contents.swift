import Foundation

// 164. Maximum Gap
// https://leetcode.com/problems/maximum-gap/

class Solution {
    func maximumGap(_ n: [Int]) -> Int {
        guard n.count > 1 else { return 0 }
        let low = n.min()!, dif = n.max()! - low, val = max(1, dif / n.count - 1)
        var res = 0, prev = -1, bkts = [[Int]](repeating: [-1,-1], count: dif / val + 1)
        for i in 0..<n.count {
            let eln = n[i], idb = (n[i] - low) / val, elb = bkts[idb]
            bkts[idb] = elb[0] == -1 ? [eln,eln] : [min(elb[0],eln), max(elb[1],eln)]
        }
        for b in bkts where b[0] != -1 {
            res = max(res, b[0] - (prev == -1 ? b[1] : prev))
            prev = b[1]
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The sorted form of the array is [1,3,6,9], either (3,6) or (6,9) has the maximum difference 3.
    func test0() {
        let value = solution.maximumGap([3,6,9,1])
        XCTAssertEqual(value, 3)
    }
    
    // The array contains less than 2 elements, therefore return 0.
    func test1() {
        let value = solution.maximumGap([10])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
