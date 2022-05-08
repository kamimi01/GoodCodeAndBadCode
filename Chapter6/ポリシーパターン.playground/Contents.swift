class PurchaseHistory {
    var totalAmount = 0
    var purchaseFrequencyPerMonth = 0
    var returnRate = 0.0
}

// x 同じロジックが重複して存在
/// - Parameter history: 購入履歴
/// - Returns: ゴールド会員であるかどうか
func isGoldCustomer(history: PurchaseHistory) -> Bool {
    if 100000 <= history.totalAmount {
        if 10 <= history.purchaseFrequencyPerMonth {
            if history.returnRate <= 0.001 {
                return true
            }
        }
    }
    return false
}

/// - Parameter history: 購入履歴
/// - Returns: シルバー会員である場合true
func isSilverCustomer(history: PurchaseHistory) -> Bool {
    if 10 <= history.purchaseFrequencyPerMonth {
        if history.returnRate <= 0.001 {
            return true
        }
    }
    return false
}

// ポリシーパターンを適用
protocol ExcellentCustomerRule {
    /// - Parameters:
    ///   - history: 購入履歴
    /// - Returns: 条件を満たす場合true
    func ok(history: PurchaseHistory) -> Bool
}

// ゴールド会員の購入金額ルール
class GoldCustomerPurchaseAmountRule: ExcellentCustomerRule {
    func ok(history: PurchaseHistory) -> Bool {
        return 100000 <= history.totalAmount
    }
}

// 購入頻度のルール
class PurchaseFrequentRule: ExcellentCustomerRule {
    func ok(history: PurchaseHistory) -> Bool {
        return 10 <= history.purchaseFrequencyPerMonth
    }
}

//返品率のルール
class ReturnRateRule: ExcellentCustomerRule {
    func ok(history: PurchaseHistory) -> Bool {
        return history.returnRate <= 0.001
    }
}

// 優良顧客の方針を表現するクラス
class ExcellentCustomerPolicy {
    var rules: [ExcellentCustomerRule]

    init() {
        rules = [ExcellentCustomerRule]()
    }

    /// ルールを追加する
    /// - Parameter rule: ルール
    func add(rule: ExcellentCustomerRule) {
        rules.append(rule)
    }

    /// - Parameter history: 購入履歴
    /// - Returns: ルールをすべて満たす場合true
    func complyWithAll(history: PurchaseHistory) -> Bool {
        for each in rules {
            if each.ok(history: history) { return false }
        }
        return true
    }
}

var goldCustomerPolicy = ExcellentCustomerPolicy()
goldCustomerPolicy.add(rule: GoldCustomerPurchaseAmountRule())
goldCustomerPolicy.add(rule: PurchaseFrequentRule())
goldCustomerPolicy.add(rule: ReturnRateRule())

class GoldCustomerPolicy {
    let policy: ExcellentCustomerPolicy

    init() {
        policy = ExcellentCustomerPolicy()
        policy.add(rule: GoldCustomerPurchaseAmountRule())
        policy.add(rule: PurchaseFrequentRule())
        policy.add(rule: ReturnRateRule())
    }

    /// - Parameter history: 購入履歴
    /// - Returns: ルールを全て満たす場合 true
    func complyWithAll(history: PurchaseHistory) -> Bool {
        return policy.complyWithAll(history: history)
    }
}
