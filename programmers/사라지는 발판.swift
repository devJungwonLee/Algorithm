import Foundation

var dir = [[-1,0], [0,1], [1,0], [0,-1]]

func dfs(_ board: [[Int]], _ aloc: [Int], _ bloc: [Int], _ depth: Int, _ turn: Bool) -> (Bool, Int) {
    let row = turn ? aloc[0] : bloc[0]
    let col = turn ? aloc[1] : bloc[1]
    var winner = !turn
    var minValue = 100
    var maxValue = depth
    if (board[row][col] == 0) { return (!turn, depth) }
    var flag = false
    for i in 0..<4 {
        let newr = row + dir[i][0]
        let newc = col + dir[i][1]
        if newr<0 || newr>=board.count || newc<0 || newc>=board[0].count { continue }
        if board[newr][newc] == 0 { continue }
        flag = true
        var newBoard = board
        newBoard[row][col] = 0
        var d: (Bool, Int)!
        if turn { d = dfs(newBoard, [newr,newc], bloc, depth+1, !turn) }
        else { d = dfs(newBoard, aloc, [newr,newc], depth+1, !turn) }
        if turn == d.0 {
            winner = turn
            minValue = min(minValue, d.1)
        }
        else { maxValue = max(maxValue, d.1) }
    }
    if !flag { return (!turn, depth) }
    return (winner, winner == turn ? minValue : maxValue)
}

func solution(_ board:[[Int]], _ aloc:[Int], _ bloc:[Int]) -> Int {
    let result = dfs(board, aloc, bloc, 0, true)
    return result.1
}