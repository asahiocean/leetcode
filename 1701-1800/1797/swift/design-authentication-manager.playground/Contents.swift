import Foundation

// 1797. Design Authentication Manager
// https://leetcode.com/problems/design-authentication-manager/

class AuthenticationManager {
    
    private struct Token {
        let id: String
        let time: Int
    }
    
    private let timeToLive:Int
    private var tokens: [Token] = []
    private var unexpTokens: [String:Int] = [:]
    
    init(_ timeToLive: Int) {
        self.timeToLive = timeToLive
    }
    
    func generate(_ id: String, _ ct: Int) {
        cleanTokens(ct)
        insert(Token(id: id, time: ct + timeToLive))
    }
    
    func renew(_ id: String, _ ct: Int) {
        cleanTokens(ct)
        guard let tm = unexpTokens[id] else { return }
        if let idx = binarySearch(Token(id: id, time: tm)) {
            tokens.remove(at: idx)
            insert(Token(id: id, time: ct + timeToLive))
        }
    }
    
    func countUnexpiredTokens(_ ct: Int) -> Int {
        cleanTokens(ct)
        return tokens.count
    }
    
    
    private func insert(_ tk: Token) {
        unexpTokens[tk.id] = tk.time
        guard !tokens.isEmpty else {
            tokens.append(tk)
            return
        }
        if let idx = binarySearch(tk) {
            if idx == tokens.count {
                tokens.append(tk)
            } else {
                tokens.insert(tk, at: idx)
            }
        }
    }
    private func binarySearch(_ tk: Token) -> Int? {
        guard !tokens.isEmpty else { return nil }
        guard tokens[0].time <= tk.time else { return 0 }
        guard tokens.last!.time >= tk.time else { return tokens.count }
        var lhs = 0, rhs = tokens.count - 1
        while lhs < rhs {
            let mid = (lhs + rhs) >> 1
            if tokens[mid].time >= tk.time {
                rhs = mid
            } else {
                lhs = mid + 1
            }
        }
        return lhs
    }
    
    private func cleanTokens(_ tm: Int) {
        while !tokens.isEmpty && tokens[0].time <= tm {
            unexpTokens.removeValue(forKey: tokens[0].id)
            tokens.removeFirst()
        }
    }
}

/**
 * Your AuthenticationManager object will be instantiated and called as such:
 * let obj = AuthenticationManager(timeToLive)
 * obj.generate(tokenId, currentTime)
 * obj.renew(tokenId, currentTime)
 * let ret_3: Int = obj.countUnexpiredTokens(currentTime)
 */
