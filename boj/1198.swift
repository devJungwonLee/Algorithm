let n = Int(readLine()!)!
var a = [[Int]]()
var answer = 0.0
for _ in 0..<n {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
	a.append(s)
}
func area(_ array: [Int]) -> Double {
	let x1 = a[array[0]][0]
	let y1 = a[array[0]][1]
	let x2 = a[array[1]][0]
	let y2 = a[array[1]][1]
	let x3 = a[array[2]][0]
	let y3 = a[array[2]][1]
	var result = 0
	result += x1*y2 + x2*y3 + x3*y1
	result -= x2*y1 + x3*y2 + x1*y3
	if result < 0 { result *= -1 }
	return Double(result) / 2
}
func combination(_ target: [Int], _ depth: Int, _ array: [Int]) {
	if array.count == 3 {
		answer = max(answer, area(array))
		return
	}
	if depth == target.count { return }
	var array = array
	array.append(target[depth])
	combination(target, depth+1, array)
	array.removeLast()
	combination(target, depth+1, array) 
}
combination(Array(0..<n), 0, [])
print(answer)
