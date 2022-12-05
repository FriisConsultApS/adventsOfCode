//: [Previous](@previous)

import Foundation
guard let filePath = Bundle.main.path(forResource: "data", ofType: "txt") else { fatalError("No file") }

do {
    let file = try String(contentsOfFile: filePath, encoding: .utf8)
    let lines = file.components(separatedBy: .newlines)
    var stackLines = [String]()

    for line in lines {
        stackLines.append(line)
        if line.isEmpty { break }
    }

    var stacks = Array(repeating: Array<Character>(), count: 9)
    for row in stackLines {
        print(row)
        for index in stacks.indices {
            let colIndex = (index * 4) + 1
            if row.count >= colIndex {
                let element = row[row.index(row.startIndex, offsetBy: colIndex)]
                if element.isLetter {
                    stacks[index].append(element)
                }

            }
        }
    }



    guard let movesIndexFrom = lines.firstIndex(where: {$0.isEmpty}) else { fatalError( "No moves")}
    for stack in stacks {
        print(stack)
    }


    for move in lines[movesIndexFrom...] {
        let values =  move.components(separatedBy: .whitespaces)
        guard values.count == 6  else { continue }

        if let moveCount = Int(values[1]),
           let fromContainer = Int(values[3]),
           let toContainer = Int(values[5]) {

            print("move \(moveCount) from \(fromContainer) to \(toContainer)")
            guard moveCount > 0 else { continue }
            stacks[toContainer-1].insert(contentsOf: stacks[fromContainer-1][0..<moveCount], at: 0)
            for _ in 0..<moveCount {
                guard !stacks[fromContainer - 1].isEmpty else { continue }
                let element = stacks[fromContainer-1].removeFirst()
            //    stacks[toContainer-1].insert(element, at: 0)
            }
            for stack in stacks {
                print(stack)
            }

        }
    }

    print(stacks.compactMap({$0.first}).compactMap({String($0)}).joined())



} catch {

}

//: [Next](@next)
