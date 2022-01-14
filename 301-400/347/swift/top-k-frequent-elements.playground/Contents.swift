import Foundation

// 347. Top K Frequent Elements
// https://leetcode.com/problems/top-k-frequent-elements/

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let dictFreq: [Int:Int] = Dictionary(nums.map({($0, 1)}), uniquingKeysWith: +)
        let sorted = dictFreq.keys.sorted { dictFreq[$0]! > dictFreq[$1]! }
        return Array(sorted[0..<k])
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.topKFrequent([1,1,1,2,2,3], 2)
        XCTAssertEqual(value, [1,2])
    }
    
    func test1() {
        let value = solution.topKFrequent([1], 1)
        XCTAssertEqual(value, [1])
    }
}

Tests.defaultTestSuite.run()
