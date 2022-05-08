enum SampleError: Error {
    case invalidParameter
}

class AttackPower {
    let MIN: Int = 0
    let value: Int

    init(value: Int) throws  {
        if value < MIN {
            throw SampleError.invalidParameter
        }

        self.value = value
    }

    /// 攻撃力を強化する
    /// - Parameter increment: 攻撃力の増分
    /// - Returns: 強化された攻撃力
    func reinForce(increment: AttackPower) throws -> AttackPower {
        return try AttackPower(value: self.value + increment.value)
    }

    /// 無力化する
    /// - Returns: 無力化された攻撃力
    func disable() throws -> AttackPower {
        return try AttackPower(value: MIN)
    }
}

let attackPower = try AttackPower(value: 20)
let reinForced = try attackPower.reinForce(increment: AttackPower(value: 15))
print("attack power: ", reinForced.value)

class Weapon {
    let attackPower: AttackPower

    init(attackPower: AttackPower) {
        self.attackPower = attackPower
    }
}

//let attackPower = try AttackPower(value: 20)

let attackPowerA = try AttackPower(value: 20)
let attackPowerB = try AttackPower(value: 20)

let weaponA = Weapon(attackPower: attackPowerA)
let weaponB = Weapon(attackPower: attackPowerB)

// 武器Aの攻撃力を変更する
weaponA.attackPower.value = 25

// 武器Bの攻撃力も変わってしまう
print("Weapon A attack power: ", weaponA.attackPower.value)
print("Weapon B attack power: ", weaponB.attackPower.value)
