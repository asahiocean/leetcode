import Foundation

// https://leetcode.com/problems/flood-fill
// Discuss: https://vk.cc/c3Iyqw

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var img = image
        dfs(&img, sr, sc, img[sr][sc], newColor)
        return img
    }
    fileprivate func dfs(_ img: inout [[Int]], _ r: Int, _ c: Int, _ tc: Int, _ nc: Int) {
        if r < 0 || r >= img.count || c < 0 || c >= (img.first?.count ?? 0) { return }
        if img[r][c] != tc || img[r][c] == nc { return }
        img[r][c] = nc
        for d in [(0,1),(0,-1),(1,0),(-1,0)] { dfs(&img, r + d.0, c + d.1, tc, nc) }
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.049 (0.050) seconds

class Tests: XCTestCase {
    let s = Solution()
    func test1() {
        let res = s.floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2)
        XCTAssertEqual(res, [[2,2,2],[2,2,0],[2,0,1]])
    }
    func test2() {
        let res = s.floodFill([[0,0,0],[0,0,0]], 0, 0, 2)
        XCTAssertEqual(res, [[2,2,2],[2,2,2]])
    }
}

Tests.defaultTestSuite.run()
