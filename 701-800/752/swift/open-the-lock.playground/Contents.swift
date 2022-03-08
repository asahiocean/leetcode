import Foundation

// 752. Open the Lock
// https://leetcode.com/problems/open-the-lock/

class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        let ddends = deadends.map { $0.compactMap { Int("\($0)") }}
        let trgInt = target.compactMap { Int("\($0)") }
        
        var queue = [[0,0,0,0]], vzitd = Set(queue)
        var turns = 0
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let cur = queue.removeFirst()
                if ddends.contains(cur) { continue }
                if cur == trgInt { return turns }
                for i in 0...3 {
                    for d in stride(from: -1, through: 1, by: 2) {
                        var nbr: [Int] = cur
                        nbr[i] = ((nbr[i] + d) + 10) % 10
                        if !vzitd.contains(nbr) && !ddends.contains(nbr) {
                            queue.append(nbr)
                            vzitd.insert(nbr)
                        }
                    }
                }
            }
            turns += 1
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 34.202 (34.205) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /*
        A sequence of valid moves would be
            "0000" -> "1000" -> "1100" -> "1200" -> "1201" -> "1202" -> "0202".
        Note that a sequence like
            "0000" -> "0001" -> "0002" -> "0102" -> "0202" would be invalid,
        because the wheels of the lock become stuck after the display becomes the dead end "0102".
    */
    func test0() {
        let value = solution.openLock(["0201","0101","0102","1212","2002"], "0202")
        XCTAssertEqual(value, 6)
    }
    
    // We can turn the last wheel in reverse to move from "0000" -> "0009".
    func test1() {
        let value = solution.openLock(["8888"], "0009")
        XCTAssertEqual(value, 1)
    }
    
    // We cannot reach the target without getting stuck.
    func test2() {
        let value = solution.openLock(["8887","8889","8878","8898","8788","8988","7888","9888"], "8888")
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()
