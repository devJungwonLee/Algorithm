let n = Int(readLine()!)!
for i in 0..<n {
    if i % 2 == 0 { print(n - i / 2, terminator: " ") }
    else { print(i / 2 + 1, terminator: " ") }
}
print("")