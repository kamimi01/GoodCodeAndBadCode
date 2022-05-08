// JavaではCurrencyクラスが元から用意されているがSwiftにはないので適当なクラスを自作
class Currency {
    var code: String = ""
    var locale: String = ""
    var amount: Int = 0
}

class Money {
    // finalをさらにつけることもできるが、Swiftではletで定義すれば不変となるので、finalは不要だと思う
    let amount: Int
    let currency: Currency

    init(amount: Int, currency: Currency) {
        self.amount = amount
        self.currency = currency
    }

//    func add(other: Int) -> Money {
//        let added = amount + other
//        return Money(amount: added, currency: currency)
//    }

    func add(other: Currency) -> Money {
        let added = amount + other.amount
        return Money(amount: added, currency: currency)
    }
}

// swiftでは以下はコンパイルエラーになる
//func doSometing(value: Int) {
//    value = 100
//}

let jpnCurrency = Currency()
jpnCurrency.code = "JPN"
jpnCurrency.locale = "JPN"
jpnCurrency.amount = 1000

let ticketCount = 3  // チケット枚数
let money = Money(amount: 100, currency: jpnCurrency)
// 金額ではないチケット枚数の値を加算できてしまう
//money.add(other: ticketCount)

money.add(other: jpnCurrency)
