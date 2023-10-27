var cup = [true, false, false]
let s = readLine()!
for c in s {
    if c == "A" { cup.swapAt(0, 1) }
    else if c == "B" { cup.swapAt(1, 2) }
    else if c == "C" { cup.swapAt(0, 2) }
}
print(cup.firstIndex { $0 }! + 1)