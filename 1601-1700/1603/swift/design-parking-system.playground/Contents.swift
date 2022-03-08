import Foundation

// 1603. Design Parking System
// https://leetcode.com/problems/design-parking-system/

class ParkingSystem {
    private var dict: [Int:Int] = [:]
    
    init(_ b: Int, _ m: Int, _ s: Int) {
        [b,m,s].enumerated().forEach {
            dict[$0 + 1] = $1
        }
    }
    
    func addCar(_ t: Int) -> Bool {
        dict[t, default: 1] -= 1
        return (dict[t] ?? 0) >= 0
    }
}
