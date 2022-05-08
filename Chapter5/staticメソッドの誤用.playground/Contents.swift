// 注文を管理するクラス
class OrderManager {
    static func add(moneyAmount1: Int, moneyAmount2: Int) -> Int {
        return moneyAmount1 + moneyAmount2
    }
}

class MoneyData {
    var amount = 0
}

let moneyData1 = MoneyData()
let moneyData2 = MoneyData()

moneyData1.amount = OrderManager.add(moneyAmount1: moneyData1.amount, moneyAmount2: moneyData2.amount)

// staticメソッドと同じ問題を抱えたインスタンスメソッド
class PaymentManager {
    private var discountRate: Int  // 割引率

    init(discountRate: Int) {
        self.discountRate = discountRate
    }

    func add(moneyAmount1: Int, moneyAmount2: Int) -> Int {
        return moneyAmount1 + moneyAmount2
    }
}
