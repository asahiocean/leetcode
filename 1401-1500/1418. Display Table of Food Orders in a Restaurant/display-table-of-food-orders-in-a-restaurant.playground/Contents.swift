import Foundation

// 1418. Display Table of Food Orders in a Restaurant
// https://leetcode.com/problems/display-table-of-food-orders-in-a-restaurant/

class Solution {
    func displayTable(_ orders: [[String]]) -> [[String]] {
        var set = Set<String>()
        var map = [String:[String:Int]]()
        
        orders.forEach {
            let table = $0[1], food = $0[2]
            set.insert(food)
            if (map[table] == nil) { map[table] = .init() }
            if (map[table]![food] == nil) { map[table]![food] = 0 }
            map[table]![food]! += 1
        }
        
        let nArr = set.sorted(by: <)
        let tArr = map.keys.sorted { Int($0)! < Int($1)! }
        var table = [[String]](repeating: [String](), count: tArr.count + 1)
        table[0] = [["Table"][0]]
        nArr.forEach { table[0].append($0) }
        
        for i in 1...tArr.count {
            table[i].append("\(tArr[i-1])")
            nArr.indices.forEach {
                switch map[tArr[i - 1]]![nArr[$0]] {
                case .some(let num): table[i].append("\(num)")
                default: table[i].append("0")
                }
            }
        }
        return table
    }
}

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.054 (0.061) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.displayTable([["David","3","Ceviche"],["Corina","10","Beef Burrito"],["David","3","Fried Chicken"],["Carla","5","Water"],["Carla","5","Ceviche"],["Rous","3","Ceviche"]])
        XCTAssertEqual(res, [["Table","Beef Burrito","Ceviche","Fried Chicken","Water"],["3","0","2","1","0"],["5","0","1","0","1"],["10","1","0","0","0"]])
    }
    func test1() {
        let res = s.displayTable([["James","12","Fried Chicken"],["Ratesh","12","Fried Chicken"],["Amadeus","12","Fried Chicken"],["Adam","1","Canadian Waffles"],["Brianna","1","Canadian Waffles"]])
        XCTAssertEqual(res, [["Table","Canadian Waffles","Fried Chicken"],["1","2","0"],["12","0","3"]])
    }
    func test2() {
        let res = s.displayTable([["Laura","2","Bean Burrito"],["Jhon","2","Beef Burrito"],["Melissa","2","Soda"]])
        XCTAssertEqual(res, [["Table","Bean Burrito","Beef Burrito","Soda"],["2","1","1","1"]])
    }
}

Tests.defaultTestSuite.run()
