let mod = 1000007
let school = readLine()!.split(separator: " ").map { Int($0)! }
let toast = readLine()!.split(separator: " ").map { Int($0)! }
let n = school[0] + school[1]
var comb = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
for i in 0...n {
    for j in 0...i {
        if j == 0 || j == i { comb[i][j] = 1 }
        else { comb[i][j] = (comb[i-1][j-1] + comb[i-1][j]) % mod }
    }
}
let toToast = [toast[0] - 1, toast[1] - 1]
let toSchool = [school[0] - toast[0], school[1] - toast[1]]
let count1 = comb[toToast[0] + toToast[1]][toToast[0]]
let count2 = comb[toSchool[0] + toSchool[1]][toSchool[0]]
let answer = Int64(count1) * Int64(count2) % Int64(mod)
print(answer)