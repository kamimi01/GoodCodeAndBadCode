// JavaではCurrencyクラスが元から用意されているがSwiftにはないので適当なクラスを自作
class Currency {
    var code: String = ""
    var locale: String = ""
}

enum SampleError: Error {
    case invalidParameter(detail: String)
}

class Money {
    var amount = 0
    var currency = Currency()

    init(amount: Int, currency: Currency) throws {
        if amount < 0 {
            throw SampleError.invalidParameter(detail: "金額が0以上ではありません")
        }

        self.amount = amount
        self.currency = currency
    }
}
