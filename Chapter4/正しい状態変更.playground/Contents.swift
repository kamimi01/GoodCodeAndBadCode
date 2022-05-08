enum SampleError: Error {
    case invalidParameter
}

class HitPoint {
    private let MIN = 0
    var amount: Int

    init(amount: Int) throws {
        if amount < MIN {
            throw SampleError.invalidParameter
        }

        self.amount = amount
    }

    /// ダメージを受ける
    /// - Parameter damageAmount: ダメージ量
    func damage(damageAmount: Int) {
        let nextAmount = amount - damageAmount
        amount = max(MIN, nextAmount)
    }

    /// ヒットポイントがゼロかどうか
    /// - Returns: ヒットポイントがゼロであればtrue
    func isZero() -> Bool {
        return amount == MIN
    }
}

class States {
    enum StateType {
        case dead
    }

    var something = ""

    func add(state: StateType) {
        // do something
    }
}

class Member {
    let hitPoint: HitPoint
    let states: States

    init(hitPoint: HitPoint, states: States) {
        self.hitPoint = hitPoint
        self.states = states
    }

    func damage(damageAmount: Int) {
        hitPoint.damage(damageAmount: damageAmount)
        if hitPoint.isZero() {
            states.add(state: .dead)
        }
    }
}
