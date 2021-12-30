import Foundation

// 1488. Avoid Flood in The City
// https://leetcode.com/problems/avoid-flood-in-the-city/

class Solution {
    func avoidFlood(_ rains: [Int]) -> [Int] {
        var result = [Int](repeating: -1, count: rains.count)
        var map = [Int:[Int]](), dd = [Int]()
        for i in 0..<rains.count {
            if rains[i] == 0 {
                dd.append(i)
            } else {
                let r = rains[i]
                if map[r] == nil {
                    map[r] = [1,i]
                } else {
                    if let d = dd.last {
                        if d < map[r]![1] { return [] }
                    } else {
                        return []
                    }
                    for j in 0..<dd.count where dd[j] > map[r]![1] {
                        result[dd[j]] = r
                        dd.remove(at: j)
                        map[r]![1] = i
                        break
                    }
                }
            }
        }
        dd.forEach{ result[$0] = 1 }
        return result
    }
}

import XCTest

// Executed 5 tests, with 0 failures (0 unexpected) in 0.044 (0.046) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        XCTAssertEqual(s.avoidFlood([1,2,3,4]), [-1,-1,-1,-1])
    }
    func test1() {
        XCTAssertEqual(s.avoidFlood([1,2,0,0,2,1]), [-1,-1,2,1,-1,-1])
    }
    func test2() {
        XCTAssertEqual(s.avoidFlood([1,2,0,1,2]), [])
    }
    func test3() {
        XCTAssertEqual(s.avoidFlood([69,0,0,0,69]), [-1,69,1,1,-1])
    }
    func test4() {
        XCTAssertEqual(s.avoidFlood([10,20,20]), [])
    }
}

Tests.defaultTestSuite.run()
