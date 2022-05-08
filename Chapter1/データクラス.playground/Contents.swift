// x データクラス
// 契約金額
class ContractAmount {
    var amountIncludingTax: Int = 0  // 税込金額
    var salesTaxRate: Double = 0  // 消費税率
}

// 別のクラスに書かれる金額計算ロジック
// 契約を管理するクラス
class ContractManager {
    var contractAmount = ContractAmount()

    // 税込金額を計算する
    func calculateAmouontIncludingTax(_ amountExcludingTax: Int, _ salesTaxRate: Double) -> Int {
        let multiplier = salesTaxRate + 1.0
        let amountIncludingTax = multiplier * Double(amountExcludingTax)
        return Int(amountIncludingTax)
    }
}

// 不正値が混入できてしまう
var contractAMount = ContractAmount()
contractAMount.salesTaxRate = -0.1
