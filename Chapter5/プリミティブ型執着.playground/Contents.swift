enum SampleError: Error {
    case invalidParameter
}

class Common {
    /// - Parameters:
    ///   - regularPrice: 定価
    ///   - discountRate: 割引率
    /// - Returns: 割引価格
    func discountedPrice(regularPrice: Int, discountRate: Double) throws -> Int {
        if regularPrice < 0 {
            throw SampleError.invalidParameter
        }
        if discountRate < 0.0 {
            throw SampleError.invalidParameter
        }

        return Int(Double(regularPrice) * (1.0 - discountRate))
    }
}

// プリミティブ型ではなくクラスの型を定義する
class RegularPrice {
    let amount: Int

    init(amount: Int) throws {
        if amount < 0 {
            throw SampleError.invalidParameter
        }

        self.amount = amount
    }
}

class DiscountRate {
    let value: Double

    init(value: Double) throws {
        if value < 0 {
            throw SampleError.invalidParameter
        }

        self.value = value
    }
}

class DiscountedPrice {
    let amount: Int

    init(regularPrice: RegularPrice, discountRate: DiscountRate) {
        self.amount = regularPrice.amount * Int(1.0 - discountRate.value)
    }
}
