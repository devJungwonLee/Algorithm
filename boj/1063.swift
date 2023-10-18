import Foundation

var columns = ["", "A", "B", "C", "D", "E", "F", "G", "H"]
var columnIndex = [String: Int]()
for i in 1..<columns.count {
    columnIndex[columns[i]] = i
}

var direction = [
    "R": [1, 0], "L": [-1, 0], "B": [0, -1], "T": [0, 1],
    "RT": [1, 1], "LT": [-1, 1], "RB": [1, -1], "LB": [-1, -1]
]

func toPoint(_ s: String) -> [Int] {
    let x = columnIndex[String(s.first!)]!
    let y = Int(String(s.last!))!
    return [x, y]
}

func toString(_ p: [Int]) -> String {
    return columns[p[0]] + String(p[1])
}

func move(_ a: inout [Int], _ d: [Int]) {
    var b = a
    b[0] += d[0]
    b[1] += d[1]
    if (1...8) ~= b[0], (1...8) ~= b[1] {
        a = b
    }
}

let input = readLine()!.components(separatedBy: " ")
var king = toPoint(input[0])
var stone = toPoint(input[1])
let n = Int(input[2])!
for _ in 0..<n {
    let d = direction[readLine()!]!
    let tempKing = king
    move(&king, d)
    if king == stone { 
        let tempStone = stone
        move(&stone, d)
        if tempStone == stone {
            king = tempKing
        }
    }
}
print(toString(king))
print(toString(stone))