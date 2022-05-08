enum SampelError: Error {
    case invalidParameter
}

class ConsumptionPoint {
    var value = 0
}

// 一見良さそうだが、初期化ロジックが散らばってしまうコード
class GiftPoint {
    static private let MIN_POINT = 0
    let value: Int

    init(point: Int) throws {
        if point < GiftPoint.MIN_POINT {
            throw SampelError.invalidParameter
        }

        self.value = point
    }

    /// ポイントを加算する
    /// - Parameter other: 加算ポイント
    /// - Returns: 加算後の残余ポイント
    func add(other: GiftPoint) throws -> GiftPoint {
        return try GiftPoint(point: value + other.value)
    }

    /// - Returns: 残余ポイントが消費ポイント以上であればtrue
    func isEnough(point: ConsumptionPoint) -> Bool {
        return point.value <= value
    }

    func consume(point: ConsumptionPoint) throws -> GiftPoint {
        if !isEnough(point: point) {
            throw SampelError.invalidParameter
        }

        return try GiftPoint(point: value - point.value)
    }
}

// 標準会員の入会ポイント
let standardMemberShipPoint = try GiftPoint(point: 3000)

// プレミアム会員の入会ポイント
let premiumMemberShipPoint = try GiftPoint(point: 10000)
