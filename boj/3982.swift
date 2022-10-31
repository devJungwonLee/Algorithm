import Foundation
let c = Int(readLine()!)!
for _ in 0..<c {
    var win = [String: Int]()
    for _ in 0..<16 {
        let s = readLine()!.components(separatedBy: " ")
        let winner = Int(s[2])! < Int(s[3])! ? s[1] : s[0]
        if let w = win[winner] {
            win[winner] = w + 1
        } else {
            win[winner] = 1
        }
    }
    print(win.keys.max { win[$0]! < win[$1]! }!)
}
