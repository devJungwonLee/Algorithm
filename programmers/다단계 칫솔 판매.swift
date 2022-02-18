import Foundation

var parent = [String: String]()
var profit = [String: Int]()

func dfs(_ seller: String, _ price: Int) {
    if seller == "-" || price == 0 { return }
    let a = Int(Float(price) * 0.1)
    let b = price - a
    if let p = profit[seller] { profit[seller] = p + b }
    else { profit[seller] = b }
    dfs(parent[seller]!, a)
}

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    for i in 0..<enroll.count { parent[enroll[i]] = referral[i] }
    for i in 0..<seller.count { dfs(seller[i], amount[i] * 100) }
    return enroll.map { profit[$0] ?? 0 }
}