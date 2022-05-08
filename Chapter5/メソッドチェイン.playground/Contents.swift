class Armor {
    let name: String

    init(name: String) {
        self.name = name
    }
}

class Equipment {
    var armor: Armor
    var canChange: Bool

    init(armor: Armor, canChange: Bool) {
        self.armor = armor
        self.canChange = canChange
    }
}

class Member {
    var name: String
    var equipment: Equipment

    init(name: String, equipment: Equipment) {
        self.name = name
        self.equipment = equipment
    }
}

class Party {
    let name: String
    let members: [Member]

    init(name: String, members: [Member]) {
        self.name = name
        self.members = members
    }
}

let party = Party(name: "パーティ1", members: [Member(name: "メンバー1", equipment: Equipment(armor: Armor(name: "鎧1"), canChange: true))])

/// 鎧を装備する
/// - Parameters:
///   - memberId: 装備変更したいメンバーのID
///   - newArmor: 装備する鎧
func equipArmor(memberId: Int, newArmor: Armor) {
    if party.members[memberId].equipment.canChange {
        party.members[memberId].equipment.armor = newArmor
    }
}
