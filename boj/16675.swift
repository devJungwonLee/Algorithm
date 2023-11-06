func canWin(_ x: String, _ y: String) -> Bool {
    if x == "R" && y == "S" { return true }
    if x == "S" && y == "P" { return true }
    if x == "P" && y == "R" { return true }
    return false
}
let input = readLine()!.split(separator: " ").map { String($0) }
if canWin(input[0], input[2]) && canWin(input[0], input[3]) || canWin(input[1], input[2]) && canWin(input[1], input[3]) {
    print("MS")
} else if canWin(input[2], input[0]) && canWin(input[2], input[1]) || canWin(input[3], input[0]) && canWin(input[3], input[1]) {
    print("TK")
} else {
    print("?")
}