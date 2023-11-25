_ = readLine()!
var s = readLine()!
if s.last! == "G" { s.removeLast() }
else { s.append("G") }
print(s)