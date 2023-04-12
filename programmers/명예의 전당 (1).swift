import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var hallOfFame = [Int]()
    var result = [Int]()
    for s in score {
        hallOfFame.append(s)
        hallOfFame = hallOfFame.sorted { $0 > $1 }
        if hallOfFame.count > k { hallOfFame.removeLast() }
        result.append(hallOfFame.last!)
    }
    return result
}