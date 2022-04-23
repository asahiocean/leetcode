import Foundation

// 1345. Jump Game IV
// https://leetcode.com/problems/jump-game-iv/

class Solution {
    func minJumps(_ a: [Int]) -> Int {
        guard !a.isEmpty else { return 0 }
        var map = [Int:[Int]](), vis = Set<Int>(), queue: Set<Int> = [0], steps = 0
        for i in 0..<a.count {
            map[a[i], default: [0]].append(i)
        }
        while !queue.isEmpty {
            var jmp = Set<Int>()
            for n in queue {
                guard n != a.count - 1 else { return steps }
                for i in map[a[n], default: []] where !vis.contains(i) {
                    jmp.insert(i)
                }
                map[a[n]] = nil
                let next = n + 1, prev = n - 1
                if next < a.count, !vis.contains(next) { jmp.insert(next) }
                if prev >= 0, !vis.contains(prev) { jmp.insert(prev) }
            }
            queue = jmp
            vis.formUnion(jmp)
            steps += 1
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.036 (0.039) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // You need three jumps from index 0 --> 4 --> 3 --> 9. Note that index 9 is the last index of the array.
    func test0() {
        let value = solution.minJumps([100,-23,-23,404,100,23,23,23,3,404])
        XCTAssertEqual(value, 3)
    }
    
    // Start index is the last index. You do not need to jump.
    func test1() {
        let value = solution.minJumps([7])
        XCTAssertEqual(value, 0)
    }
    
    // You can jump directly from index 0 to index 7 which is last index of the array.
    func test2() {
        let value = solution.minJumps([7,6,9,6,9,6,9,7])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
