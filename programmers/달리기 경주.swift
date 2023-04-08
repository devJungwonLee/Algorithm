import Foundation

var order = [String: Int]()

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    players.enumerated().forEach { (index, player) in
        order[player] = index
    }
    callings.forEach { calling in
        guard let index = order[calling] else { return }
        let player = players[index-1]
        players[index-1] = calling
        players[index] = player
        order[calling] = index-1
        order[player] = index
    }
    return order.keys.sorted { order[$0]! < order[$1]! }
}