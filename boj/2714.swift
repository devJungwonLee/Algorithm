import Foundation

let dir = [[0, 1], [1, 0], [0, -1], [-1, 0]]

func toAlphabet(_ input: String) -> String {
    let num = Int(input, radix: 2)!
    if num == 0 { return " " }
    return String(UnicodeScalar(UInt8(64+num)))
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let s = readLine()!.components(separatedBy: " ")
    let r = Int(s[0])!
    let c = Int(s[1])!
    let message = s[2].map { String($0) }
    var a = [[String]](repeating: [String](repeating: "", count: c), count: r)
    var v = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
    for i in 0..<r {
        for j in 0..<c {
            a[i][j] = message[i*c + j]
        }
    }
    var d = 0
    var row = 0
    var col = 0
    var word = ""
    var answer = ""
    let n = message.count - message.count % 5
    for _ in 0..<n {
        v[row][col] = true
        word += a[row][col]
        if word.count == 5 {
            answer += toAlphabet(word)
            word = ""
        }
        var newr = row + dir[d][0]
        var newc = col + dir[d][1]
        if newr < 0 || newr >= r || newc < 0 || newc >= c || v[newr][newc] {
            d = (d + 1) % 4
            newr = row + dir[d][0]
            newc = col + dir[d][1]
        }
        row = newr
        col = newc
    }
    print(answer.trimmingCharacters(in: .whitespaces))
}
