let a = readLine()!.map { String($0) }
let b = readLine()!.map { String($0) }
var answer = 0
var end = -1
if a.count >= b.count {
	let c = (0...a.count-b.count).filter { Array(a[$0..<($0+b.count)]) == b }.map { [$0, $0+b.count-1] }
	for e in c {
		if e[0] > end {
			end = e[1]
			answer += 1
		}
	}
}
print(answer)
