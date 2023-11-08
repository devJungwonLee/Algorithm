let s: Set<Character> = ["M", "O", "B", "I", "S"]
var a: Set<Character> = []
readLine()!.forEach { 
    if s.contains($0) { a.insert($0) }
}
a == s ? print("YES") : print("NO")