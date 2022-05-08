class Member {
    var level = 10.0
    var agility = 10.0
}

enum MagicType {
    case fire
    case shiden
}

class CostMagicPoint {
    private let value: Int

    init(value: Int) {
        self.value = value
    }
}

class AttackPower {
    private let value: Int

    init(value: Int) {
        self.value = value
    }
}

class CostTechnicalPoint {
    private let value: Int

    init(value: Int) {
        self.value = value
    }
}

// 魔法型
protocol Magic {
    var name: String { get }
    var costMagicPoint: CostMagicPoint { get }
    var attackPower: AttackPower { get }
    var costTechnicalPoint: CostTechnicalPoint { get }
}

// 種類それぞれのクラスにinterfaceを実装する
// 魔法「ファイア」
class Fire: Magic {
    private let member: Member

    init(member: Member) {
        self.member = member
    }

    var name: String {
        return "ファイア"
    }

    var costMagicPoint: CostMagicPoint {
        return CostMagicPoint(value: 2)
    }

    var attackPower: AttackPower {
        return AttackPower(value: 20 + Int(member.level * 0.5))
    }

    var costTechnicalPoint: CostTechnicalPoint {
        return CostTechnicalPoint(value: 0)
    }
}

// 紫電
class Shiden: Magic {
    private let member: Member

    init(member: Member) {
        self.member = member
    }

    var name: String {
        return "紫電"
    }

    var costMagicPoint: CostMagicPoint {
        return CostMagicPoint(value: 5 + Int(member.level * 0.2))
    }

    var attackPower: AttackPower {
        return AttackPower(value: 50 + Int(member.agility * 1.5))
    }

    var costTechnicalPoint: CostTechnicalPoint {
        return CostTechnicalPoint(value: 5)
    }
}

var magics = [MagicType: Magic]()

let member = Member()
let fire = Fire(member: member)
let shiden = Shiden(member: member)

magics.updateValue(fire, forKey: .fire)
magics.updateValue(shiden, forKey: .shiden)

func magicAttack(magicType: MagicType) {
    guard let usingMagic = magics[magicType] else {
        return
    }
    showMagicName(magic: usingMagic)
    consumeMagicPoint(magic: usingMagic)
    consumeTechnicalPoint(magic: usingMagic)
    magicDamage(magic: usingMagic)
}

// 魔法の名前を画面表示する
func showMagicName(magic: Magic) {
    let name = magic.name
    // 名前を使った処理
}

// 魔法力を消費する
func consumeMagicPoint(magic: Magic) {
    let costMagicPoint = magic.costMagicPoint
    // costMagicPointを使った処理
}

// テクニカルポイントを消費する
func consumeTechnicalPoint(magic: Magic) {
    let costTechnicalPoint = magic.costTechnicalPoint
    // costTechnicalPointを使った処理
}

// ダメージ計算する
func magicDamage(magic: Magic) {
    let attackPower = magic.attackPower
    // attackPowerを使った処理
}
