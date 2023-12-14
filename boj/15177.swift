let a: [Character: Int] = ["k": 1, "a": 2, "n": 1, "g": 1, "r": 1, "o": 2]
let b: [Character: Int] = ["k": 1, "i": 3, "w": 1, "b": 1, "r": 1, "d": 1]
let s = readLine()!.lowercased()
let x = s.map { a[$0] ?? 0 }.reduce(0, +)
let y = s.map { b[$0] ?? 0 }.reduce(0, +)
if x > y { print("Kangaroos") }
else if x < y { print("Kiwis") }
else { print("Feud continues") }