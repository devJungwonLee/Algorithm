let vowels = ["a", "e", "i", "o", "u"]
_ = Int(readLine()!)!
let s = readLine()!.map { String($0) }
print(s.filter { vowels.contains($0) }.count)
