var counts = ["H": 0, "I": 0, "A": 0, "R": 0, "C": 0]
_ = Int(readLine()!)!
let s = readLine()!
for c in s {
    let st = String(c)
    if ["H", "I", "A", "R", "C"].contains(st) {
        counts[st] = counts[st]! + 1
    }
}
print(counts.values.min()!)

