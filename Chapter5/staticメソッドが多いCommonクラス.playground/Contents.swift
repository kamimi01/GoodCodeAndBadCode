class User {
    var name = ""
}

class Product {
    var name = ""
}

class Common {
    // 税込金額を計算する
    static func calcAmountIncludingTax(amountExcludingTax: Double, taxRate: Double) -> Double {
        return amountExcludingTax * taxRate
    }

    // ユーザーが退会済みの場合true
    static func hasResigned(user: User) -> Bool {
        return true
    }

    // 商品を注文する
    static func createOrder(product: Product) {
        // do something
    }

    // 有効な電話番号である場合true
    static func isValidPhoneNumber(phoneNumber: String) -> Bool {
        return true
    }
}

// 共通クラスを安易につくらない
class AmountExcludingTax {
    let value: Double

    init(value: Double) {
        self.value = value
    }
}

class TaxRate {
    let value: Double

    init(value: Double) {
        self.value = value
    }
}

class AmountIncludingTax {
    let value: Double

    init(amountExcludingTax: AmountExcludingTax, taxRate: TaxRate) {
        value = amountExcludingTax.value * taxRate.value
    }
}
