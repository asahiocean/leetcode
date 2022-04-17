import Foundation

// 1898. Maximum Number of Removable Characters
// https://leetcode.com/problems/maximum-number-of-removable-characters/

class Solution {
    func maximumRemovals(_ s: String, _ p: String, _ r: [Int]) -> Int {
        guard r.count > 0, s.count > 1 else { return 0 }
        
        let lnS = s.count, lnP = p.count
        
        var lhs = 0, rhs = r.count, vis = Set<Int>(), res = Int.min
        var rmIdx = Array(repeating: false, count: lnS)
        let arrS = Array(s), arrP = Array(p)
        
        func valid() -> Bool {
            var idx = 0
            for i in 0..<lnS where !rmIdx[i] && idx < lnS && arrS[i] == arrP[idx] {
                idx += 1
                if idx == lnP { return true }
            }
            return false
        }
                
        func getRmIdx(_ to: Int) {
            var idx = 0
            while idx < to {
                rmIdx[r[idx]] = true
                idx += 1
            }
        }
        
        while lhs < rhs {
            let mid = lhs + ((rhs - lhs) >> 1)
            vis.insert(mid)
            getRmIdx(mid)
            if valid() {
                res = max(res, mid)
                lhs = mid + 1
            } else {
                rhs = mid
            }
            // recover removed indices
            var idx = 0
            while idx < mid {
                if rmIdx[r[idx]] {
                    rmIdx[r[idx]] = false
                }
                idx += 1
            }
        }
        
        guard lhs > 0 else { return 0 }
        
        if !vis.contains(lhs) {
            getRmIdx(lhs)
            if valid() { res = max(res, lhs) }
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.023 (0.025) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    func test0() {
        let value = solution.maximumRemovals("abcacb","ab",[3,1,0])
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.maximumRemovals("abcbddddd","abcd",[3,2,1,4,5,6])
        XCTAssertEqual(value, 1)
    }
    
    func test2() {
        let value = solution.maximumRemovals("abcab","abc",[0,1,2,3,4])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
