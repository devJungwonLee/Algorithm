let chart = [
    "A": ["A": "A", "G": "C", "C": "A", "T": "G"],
    "G": ["A": "C", "G": "G", "C": "T", "T": "A"],
    "C": ["A": "A", "G": "T", "C": "C", "T": "G"],
    "T": ["A": "G", "G": "A", "C": "G", "T": "T"]
]
_ = readLine()!
var s = readLine()!.map { String($0) }
while s.count > 1 {
    let y = s.removeLast()
    let x = s.removeLast()
    s.append(chart[x]![y]!)
}
print(s.first!)