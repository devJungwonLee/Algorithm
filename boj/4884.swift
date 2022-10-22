func numOfTournamentPlayers(from num: Int) -> Int {
    var result = 1
    while result < num { result *= 2 }
    return result
}

while true {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
    let g = s[0]
    let t = s[1]
    let a = s[2]
    let d = s[3]
    if g == -1 && t == -1 && a == -1 && d == -1 { break }
    let numOfPlayers = numOfTournamentPlayers(from: g * a + d)
    let y = numOfPlayers - (g * a + d)
    let x = t * (t-1) / 2 * g + numOfPlayers - 1
    print("\(g)*\(a)/\(t)+\(d)=\(x)+\(y)")
}
