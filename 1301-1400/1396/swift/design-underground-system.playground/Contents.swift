import Foundation

// 1396. Design Underground System
// https://leetcode.com/problems/design-underground-system/

class UndergroundSystem {
    
    private typealias Dir = Direction
    private struct Direction: Hashable {
        let from: String, to: String
        init(_ a: String, _ b: String) { from = a; to = b }
    }
    
    private typealias DTS = DurationTimestamp
    private struct DurationTimestamp {
        let dur: Int, time: Int
        init(_ d: Int, _ t: Int) { dur = d; time = t }
    }
    
    private typealias SST = StartSTAtm
    private struct StartSTAtm {
        let sta: String, time: Int
        init(_ st: String, _ t: Int) { sta = st; time = t }
    }
    
    private var dictIdSST: [Int:SST]
    private var dictDTS: [Dir:DTS]
    
    init() {
        self.dictIdSST = [Int:SST]()
        self.dictDTS = [Dir:DTS]()
    }
    
    func checkIn(_ id: Int, _ st: String, _ t: Int) {
        dictIdSST[id] = SST(st, t)
    }
    
    func checkOut(_ id: Int, _ sta: String, _ t: Int) {
        guard let start = dictIdSST[id] else { fatalError() }
        var dur = t - start.time, time = 1
        if let dts = dictDTS[Dir(start.sta, sta)] { dur += dts.dur; time += dts.time }
        dictDTS[Dir(start.sta, sta)] = DTS(dur, time)
    }
    
    func getAverageTime(_ start: String, _ end: String) -> Double {
        let dts = dictDTS[Dir(start, end)]!
        return Double(dts.dur) / Double(dts.time)
    }
}
