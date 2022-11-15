let s = readLine()!.map { $0 }
let t = readLine()!.map { $0 }
var result = ""
for i in 0..<s.count {
    let c1 = s[i]
    if String(c1) == " " {
        result += " "
        continue
    }
    let c2 = t[i % t.count]
    let d1 = Int(c1.asciiValue!) - 97
    let d2 = Int(c2.asciiValue!) - 97
    let c = UnicodeScalar(UInt8((d1 - d2 + 25) % 26 + 97))
    result += String(c)
}
print(result)
