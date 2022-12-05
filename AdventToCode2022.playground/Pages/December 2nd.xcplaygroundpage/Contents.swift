//: [Previous](@previous)

/// A and X = Rock
/// B and Y = Scissors
/// C and Z = Paper


import Foundation



enum FightStatus {
    case won(Symbol)
    case draw(Symbol)
    case loos(Symbol)

    var point: Int {
        switch self {
        case let .won(with):
            return 6 + with.score

        case let .draw(with):
            return 3 + with.score

        case let .loos(with):
            return 0 + with.score
        }
    }
}

enum Symbol {
    case rock
    case paper
    case scissors

    var score: Int {
        switch self {
        case .rock: return 1
        case .paper: return 2
        case .scissors: return 3
        }
    }
}

enum NeedTo {
    case win
    case draw
    case loos
}

extension String {

    var symbol: Symbol {
        switch self {
        case "A", "X": return .rock
        case "B", "Y": return .paper
        case "C", "Z": return .scissors
        default: fatalError()
        }
    }

    var needTo: NeedTo {
        switch self {
        case "X": return .loos
        case "Y": return .draw
        case "Z": return .win
        default: fatalError()
        }
    }
}

func scoreFight(elf: String, you: String) -> FightStatus? {
    switch elf.symbol {
    case .rock:
        switch you.needTo {
        case .win: return .won(.paper)
        case .draw: return .draw(.rock)
        case .loos: return .loos(.scissors)
        }

    case .scissors:
        switch you.needTo {
        case .win: return .won(.rock)
        case .draw: return .draw(.scissors)
        case .loos: return .loos(.paper)
        }

    case .paper:
        switch you.needTo {
        case .win: return .won(.scissors)
        case .draw: return .draw(.paper)
        case .loos: return .loos(.rock)
        }
    }
}


guard let filePath = Bundle.main.path(forResource: "strategy", ofType: "txt") else {
    fatalError()
}

do {
    let strategyGuideFile = try String(contentsOfFile: filePath, encoding: .utf8)
    let values = strategyGuideFile.components(separatedBy: .newlines)
    var fights = 0
    var fightsWon = 0
    var fightsDraw = 0
    var fightsLost = 0
    var score = 0



    for value in values {
        let fight = value.components(separatedBy: .whitespaces)
        guard fight.count == 2 else { continue }
        if let fightScore = scoreFight(elf: fight.first!, you: fight.last!) {
            fights += 1
            score += fightScore.point
            switch fightScore {
            case .draw:
                fightsDraw += 1
            case .won:
                fightsWon += 1
            case .loos:
                fightsLost += 1
            }
        }
    }

    print("you win:\(fightsWon), draws:\(fightsDraw) and looses: \(fightsLost), with a total score of:\(score) ")

} catch {
    print(error.localizedDescription)
}


//: [Next](@next)
