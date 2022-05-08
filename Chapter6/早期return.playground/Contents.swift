class Member {
    var hitPoint: Int = 0
    var canAct: Bool = true
    var magicPoint: Int = 0
    var technicalPoint: Int = 0

    func chant(magic: Magic) {
        // do something
    }

    func consumeMagicPoinnt(magicPoint: Int) {
        // do something
    }
}

class Magic {
    var costTechnicalPoint: Int = 0
    var costMagicPoint: Int = 0
}

func doSomething() {
    let member = Member()
    let magic = Magic()

    if member.hitPoint <= 0 { return }
    if !member.canAct { return }
    if member.magicPoint < magic.costMagicPoint { return }

    member.consumeMagicPoinnt(magicPoint: magic.costMagicPoint)
    member.chant(magic: magic)
}
