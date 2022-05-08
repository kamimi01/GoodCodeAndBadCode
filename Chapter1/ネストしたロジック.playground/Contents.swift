// x 何重にもネストしたロジック
class Magic {
    var costMagicPoint = 0
    var magicPoint = 0
}

class Member {
    var magic = Magic()
    var hitPoint = 0

    func canAct() -> Bool {
        return true  // 仮でtrueを返す
    }

    func consumeMagicPoint(_ costMagicPoint: Int) {
        // do something
    }

    func chant(_ magic: Magic) {
        // do something
    }
}

let member = Member()

if 0 < member.hitPoint {
    // 行動可能かを判定
    if member.canAct() {
        // 魔法力が残存しているかを判定
        if member.magic.costMagicPoint <= member.magic.magicPoint {
            member.consumeMagicPoint(member.magic.costMagicPoint)
            member.chant(member.magic)
        }
    }
}
