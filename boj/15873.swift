let s = readLine()!.map { Int(String($0))! }
if s.count == 4 { print(20) }
else if s.count == 3 {
  if s[0] * 10 + s[1] == 10 { print(s[2] + 10) }
  else { print(s[0] + 10) }
}
else { print(s[0] + s[1]) } 
