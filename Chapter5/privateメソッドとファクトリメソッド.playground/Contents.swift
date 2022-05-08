enum SampelError: Error {
    case invalidParameter
}

class ConsumptionPoint {
    var value = 0
}

class GiftPoint {
    static private let MIN_POINT = 0
    static private let STANDARD_MEMBERSHIP_POINT: Int = 3000
    static private let PREMIUM_MEMBERSHIP_POINT: Int = 10000
    let value: Int

    // 外部からはインスタンス化できない
    private init(point: Int) throws {
        if point < GiftPoint.MIN_POINT {
            throw SampelError.invalidParameter
        }

        self.value = point
    }

    /// - Returns: 標準会員向け入会ギフトポイント
    static func forStandardMemberShip() throws -> GiftPoint {
        return try GiftPoint(point: STANDARD_MEMBERSHIP_POINT)
    }

    /// - Returns: プレミアム会員向け入会ギフトポイント
    static func forPremiumMemberShip() throws -> GiftPoint {
        return try GiftPoint(point: PREMIUM_MEMBERSHIP_POINT)
    }
}

// 標準会員の入会ポイント
let standardMemberShipPoint = try GiftPoint.forStandardMemberShip()

// プレミアム会員の入会ポイント
let premiumMemberShipPoint = try GiftPoint.forPremiumMemberShip()

