//: [Previous](@previous)

import Foundation

guard let filePath = Bundle.main.path(forResource: "food", ofType: "txt") else {
    fatalError()
}

do {
    let data = try String(contentsOfFile: filePath, encoding: .utf8)
    let stringValues = data.components(separatedBy: .newlines)

    var elfs = [Int]()
    var elfIndex = 0


    for stringValue in stringValues {
        if elfs.count == elfIndex {
            elfs.append(0)
        }

        if let value = Int(stringValue) {
            elfs[elfIndex] += value
        } else {
            elfIndex += 1
        }

    }
    let max = elfs.max() ?? 0
    print("\(elfs.firstIndex(where: {$0 == max})!): \(max)")

    let sortedElfs = Array(elfs.sorted().reversed())

    let topThree = sortedElfs[0] + sortedElfs[1] + sortedElfs[2]
    print("\(sortedElfs[0]) + \(sortedElfs[1]) + \(sortedElfs[2]) = \(topThree)")

} catch {
    print(error.localizedDescription)
}

//: [Next](@next)
