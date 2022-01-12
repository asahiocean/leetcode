import Foundation

// 733. Flood Fill
// https://leetcode.com/problems/flood-fill/

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var img = image
        dfs(&img, sr, sc, img[sr][sc], newColor)
        return img
    }
    private func dfs(_ img: inout [[Int]], _ r: Int, _ c: Int, _ tc: Int, _ nc: Int) {
        if r < 0 || r >= img.count || c < 0 || c >= (img.first?.count ?? 0) { return }
        if img[r][c] != tc || img[r][c] == nc { return }
        img[r][c] = nc
        for d in [(0,1),(0,-1),(1,0),(-1,0)] { dfs(&img, r + d.0, c + d.1, tc, nc) }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.049 (0.050) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel),
    // all pixels connected by a path of the same color as the starting pixel
    // (i.e., the blue pixels) are colored with the new color.
    // Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.
    func test0() {
        let value = solution.floodFill([[1,1,1],
                                        [1,1,0],
                                        [1,0,1]], 1, 1, 2)
        
        XCTAssertEqual(value, [[2,2,2],
                               [2,2,0],
                               [2,0,1]])
    }
    
    func test1() {
        let value = solution.floodFill([[0,0,0],
                                        [0,0,0]], 0, 0, 2)
        
        XCTAssertEqual(value, [[2,2,2],
                               [2,2,2]])
    }
}

Tests.defaultTestSuite.run()
