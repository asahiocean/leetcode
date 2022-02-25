import Foundation

// 733. Flood Fill
// https://leetcode.com/problems/flood-fill/

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var img = image
        dfs(&img, sr, sc, img[sr][sc], newColor)
        return img
    }
    private func dfs(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ pix: Int, _ newColor: Int) {
        if (sr < 0 || sr >= image.count) { return }
        if (sc < 0 || sc >= image[0].count) { return }
        let pixOld = image[sr][sc]
        if pixOld == newColor || pixOld != pix { return }
        image[sr][sc] = newColor
        for p in [(0,1),(0,-1),(1,0),(-1,0)] {
            dfs(&image, (sr + p.0), (sc + p.1), pix, newColor)
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.027 (0.029) seconds

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
