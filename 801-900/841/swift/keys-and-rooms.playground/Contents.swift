import Foundation

// 841. Keys and Rooms
// https://leetcode.com/problems/keys-and-rooms/

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        
        var visited: Set<Int> = []
        var roomsQueue: [Int] = []
        roomsQueue.append(0)
        
        while !roomsQueue.isEmpty {
            for _ in 0..<roomsQueue.count {
                let room = roomsQueue.removeFirst()
                visited.insert(room)
                for r in rooms[room] where !visited.contains(r) {
                    roomsQueue.append(r)
                }
            }
        }
        return visited.count == rooms.count
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // We visit room 0 and pick up key 1.
    // We then visit room 1 and pick up key 2.
    // We then visit room 2 and pick up key 3.
    // We then visit room 3.
    // Since we were able to visit every room, we return true.
    func test0() {
        let value = solution.canVisitAllRooms([[1],[2],[3],[]])
        XCTAssertEqual(value, true)
    }
    
    // We can not enter room number 2 since the only key that unlocks it is in that room.
    func test1() {
        let value = solution.canVisitAllRooms([[1,3],[3,0,1],[2],[0]])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
