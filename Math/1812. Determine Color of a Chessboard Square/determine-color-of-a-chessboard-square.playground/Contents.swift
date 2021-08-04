import Foundation

// 1812. Determine Color of a Chessboard Square
// https://leetcode.com/problems/determine-color-of-a-chessboard-square/

// Runtime: 0 ms
// Memory Usage: 13.9 MB

class Solution {
    func squareIsWhite(_ coordinates: String) -> Bool {
        return Int(coordinates.first!.asciiValue! - 97 + coordinates.last!.asciiValue! - 48) & 1 == 0
    }
}
