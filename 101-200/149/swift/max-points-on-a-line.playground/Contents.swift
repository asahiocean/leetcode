import Foundation

// 149. Max Points on a Line
// https://leetcode.com/problems/max-points-on-a-line/

class Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        let len = points.count
        guard len >= 3 else { return len }
        
        var result = 0
        
        for i in 0..<len {
            
            var rep = 0
            var dict: [String:Int] = [:]
            var maxP = 0
            
            for j in i + 1 ..< len {
                
                var valX = points[j][0] - points[i][0]
                var valY = points[j][1] - points[i][1]
                
                if valX == 0 && valY == 0 {
                    rep += 1
                    continue
                }
                
                let gcdVal = gcd(valX, valY)
                valX /= gcdVal
                valY /= gcdVal
                
                let keyP = "\(valX)-\(valY)"
                dict[keyP, default: 0] += 1
                maxP = max(maxP, dict[keyP]!)
            }
            result = max(result, maxP + rep + 1)
        }
        return result
    }
    
    private func gcd(_ x: Int, _ y: Int) -> Int {
        if y == 0 { return x }
        return gcd(y, x % y)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.036 (0.038) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.maxPoints([[1,1],[2,2],[3,3]])
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.maxPoints([[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]])
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()
