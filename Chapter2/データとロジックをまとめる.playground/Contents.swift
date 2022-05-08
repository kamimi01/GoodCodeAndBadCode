// データとロジックをまとめる
enum SampelError: Error {
    case invalidParameter(detail: String)
}

class HitPoint {
    private let MIN = 0
    private let MAX = 999
    let value: Int

    init(value: Int) throws {
        if value < MIN {
            throw SampelError.invalidParameter(detail: "\(MIN) 以上を指定してください")
        }
        if MAX < value {
            throw SampelError.invalidParameter(detail: "\(MAX) 以下を指定してください")
        }
        self.value = value
    }

    // ダメージを受ける
    func damage(damageAmount: Int) throws -> HitPoint {
        let damaged = value - damageAmount
        let corrected = damaged < MIN ? MIN : damaged
        return try HitPoint(value: corrected)
    }

    // 回復する
    func recover(recoveryAmount: Int) throws -> HitPoint {
        let recovered = value + recoveryAmount
        let corrected = MAX < recovered ? MAX : recovered
        return try HitPoint(value: corrected)
    }
}

do {
    var hitp = try HitPoint(value: -1)
//    hitp.damage(damageAmount: -1)
} catch {
    print("ここきた")
    print(error)
}
