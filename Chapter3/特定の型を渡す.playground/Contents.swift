enum SampleError: Error {
    case invalidParameter(detail: String)
}

// JavaではCurrencyクラスが元から用意されているがSwiftにはないので適当なクラスを自作
class Currency {
    var code: String = ""
    var locale: String = ""
    var amount: Int = 0
}

// Javaではequalsメソッドがあるようだが、Swiftでは自前実装が必要な認識（ちょっと自信ない...）
extension Currency: Equatable {
    static func == (lhs: Currency, rhs: Currency) -> Bool {
        return lhs.code == rhs.code && lhs.locale == rhs.locale && lhs.amount == rhs.amount
    }
}

class Money {
    let amount: Int
    let currency: Currency

    init(amount: Int, currency: Currency) {
        self.amount = amount
        self.currency = currency
    }

    func add(other: Money) throws -> Money {
        if currency != other.currency {
            throw SampleError.invalidParameter(detail: "通貨単位が違います。")
        }
        let added = amount + other.amount
        return Money(amount: added, currency: currency)
    }
}

let jpn = Currency()
jpn.amount = 100
jpn.locale = "jpn"
jpn.code = "jpn"
let money = Money(amount: 100, currency: jpn)

let otherCurrency = Currency()
otherCurrency.locale = "jpn"
otherCurrency.amount = 100
otherCurrency.code = "jpn"
let other = Money(amount: 100, currency: otherCurrency)

try money.add(other: other)
