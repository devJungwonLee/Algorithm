import Foundation

func isOneLine(_ numbers: [Int]) -> Bool {
    var oneLines: Set<[Int]> = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]
    for i in 0..<numbers.count {
        for j in (i+1)..<numbers.count {
            for k in (j+1)..<numbers.count {
                if oneLines.contains([numbers[i], numbers[j], numbers[k]]) {
                    return true
                }
            }
        }
    }
    return false
}

func solution(_ board:[String]) -> Int {
    var o = [Int]()
    var x = [Int]()
    var board = board.map { $0.map { String($0) } }
    for i in 0..<3 {
        for j in 0..<3 {
            if board[i][j] == "O" { o.append(3 * i + j) }
            else if board[i][j] == "X" { x.append(3 * i + j) }
        }
    }
    if x.count > o.count || o.count - x.count > 1 { return 0 }
    if o.count <= 2 { return 1 }
    if o.count == 3, x.count == 2 { return 1 }
    let oFlag = isOneLine(o)
    let xFlag = isOneLine(x)
    if o.count == x.count {
        if (oFlag && xFlag) || (oFlag && !xFlag) { return 0 }
        return 1
    } else {
        if xFlag { return 0 }
        return 1
    }
    return 0   
}