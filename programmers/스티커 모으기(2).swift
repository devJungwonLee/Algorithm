import Foundation

func dp(_ sticker: [Int]) -> Int {
    var d = [Int](repeating: 0, count: sticker.count)
    for i in 0..<sticker.count {
        if i == 0 { d[i] = sticker[i] }
        else if i == 1 { d[i] = max(sticker[i], d[i-1]) }
        else { d[i] = max(d[i-2] + sticker[i], d[i-1]) }
    }
    return d.last!
}

func solution(_ sticker: [Int]) -> Int {
    if sticker.count == 1 { return sticker[0] }
    var sticker = sticker
    let first = sticker.removeFirst()
    let last = sticker.removeLast()
    return max(dp([first] + sticker), dp(sticker + [last]))
}