import Foundation

// 535. Encode and Decode TinyURL
// https://leetcode.com/problems/encode-and-decode-tinyurl/

class Codec {

    private var dict = [String:String]()
    private let set = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    func encode(_ longUrl: String) -> String {
        let key = String(set.shuffled().suffix(6))
        dict[key] = longUrl
        return "https://tinyurl.com/\(key)"
    }

    func decode(_ shortUrl: String) -> String {
        let lastPath = shortUrl.split(separator: "/").last!
        return dict[String(lastPath)]!
    }
}
