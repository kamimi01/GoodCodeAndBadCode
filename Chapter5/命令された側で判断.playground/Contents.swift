class Equipment {
    var name = ""
    var level: Int = 0

    static let empty = Equipment()
}

class Equipments {
    private var canChange: Bool
    private var head: Equipment
    private var armor: Equipment
    private var arm: Equipment

    init(canChange: Bool, head: Equipment, armor: Equipment, arm: Equipment) {
        self.canChange = canChange
        self.head = head
        self.armor = armor
        self.arm = arm
    }

    /// 鎧を装備する
    /// - Parameter newArmor: 装備する鎧
    func equipArmor(newArmor: Equipment) {
        if canChange {
            armor = newArmor
        }
    }

    /// 全装備を解除する
    func deactiveAll() {
        head = Equipment.empty  // emptyの実装がよくわからなくて下手かも
        armor = Equipment.empty
        arm = Equipment.empty
    }
}
