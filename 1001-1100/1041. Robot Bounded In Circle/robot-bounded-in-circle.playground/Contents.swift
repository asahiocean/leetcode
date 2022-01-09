import Foundation

// 1041. Robot Bounded In Circle
// https://leetcode.com/problems/robot-bounded-in-circle/

class Solution {
    func isRobotBounded(_ instructions: String) -> Bool {
        var dir = 0, x = 0, y = 0
        for inst in instructions {
            switch inst {
            case "G":
                switch dir {
                case 0: y += 1
                case 1: x -= 1
                case 2: y -= 1
                case 3: x += 1
                default: break
                }
            case "L": dir = (dir + 1) % 4
            case "R": dir = (dir - 1 + 4) % 4
            default: break
            }
        }
        return x == 0 && y == 0 || dir > 0
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// The robot moves from (0,0) to (0,2), turns 180 degrees, and then returns to (0,0).
    /// When repeating these instructions, the robot remains in the circle of radius 2 centered at the origin.
    func test0() {
        let value = solution.isRobotBounded("GGLLGG")
        XCTAssertEqual(value, true)
    }
    
    /// The robot moves north indefinitely.
    func test1() {
        let value = solution.isRobotBounded("GG")
        XCTAssertEqual(value, false)
    }
    
    /// The robot moves from (0, 0) -> (0, 1) -> (-1, 1) -> (-1, 0) -> (0, 0) -> ...
    func test2() {
        let value = solution.isRobotBounded("GL")
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()
