var board: [[Bool?]] = [
    [nil, nil, nil], [nil, nil, nil], [nil, nil, nil]
]

func checkFinished() -> Int? {
    for i in 0...2 {
        let x = board[i].compactMap { $0 }
        guard x.count == 3 else { continue }
        if x[0] == x[1] && x[1] == x[2] { return x[0] ? 1 : 2 }
    }
    for j in 0...2 {
        guard let a = board[0][j], let b = board[1][j], let c = board[2][j] else { continue }
        if a == b && b == c { return a ? 1 : 2 }
    }
    if let a = board[0][0], let b = board[1][1], let c = board[2][2] {
        if a == b && b == c { return a ? 1 : 2 }
    }
    if let a = board[0][2], let b = board[1][1], let c = board[2][0] {
        if a == b && b == c { return a ? 1 : 2 }
    }
    for row in board {
        if row.compactMap({ $0 }).count != 3 { return nil }
    }
    return 0
}

var player = Int(readLine()!)!
while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (row, col) = (input[0] - 1, input[1] - 1)
    board[row][col] = player == 1
    if let result = checkFinished() {
        print(result)
        break
    }
    player = 3 - player
}