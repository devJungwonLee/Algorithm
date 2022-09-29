let s = readLine()!.map { String($0) }
var result = ""
var cnt = 0
for i in 0..<s.count {
    if s[i] == "X" { 
        cnt += 1
        if cnt == 4 { 
            result += "AAAA"
            cnt = 0
        }
    } else {
        if cnt == 2 {
            result += "BB"
            cnt = 0
        } else if cnt > 0 {
            cnt = -1
            break
        }
        result += "."
    }
}

if cnt == 2 { result += "BB" }
else if cnt > 0 { cnt = -1 }
if cnt == -1 { print(cnt) }
else { print(result) }
