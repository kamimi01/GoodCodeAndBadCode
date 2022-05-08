class MagicPoint {
    // 現在の魔力力残量
    private var currentAmount: Int
    // オリジナルの魔法力最大値
    private var originalMaxAmount: Int
    private let maxIncrements: [Int]

    init(currentAmount: Int, originalMaxAmount: Int, maxIncrements: [Int]) {
        self.currentAmount = currentAmount
        self.originalMaxAmount = originalMaxAmount
        self.maxIncrements = maxIncrements
    }

    /// - Returns: 現在の魔法力残量
    func current() -> Int{
        return currentAmount
    }

    /// - Returns: 魔法力の最大値
    func max() -> Int {
        var amount = originalMaxAmount
        for each in maxIncrements {
            amount += each
        }

        return amount
    }

    /// 魔法力を回復する
    /// - Parameter recoveryAmount: 回復量
    func recover(recoveryAmount: Int) {
        currentAmount = min(currentAmount + recoveryAmount, max())
    }

    /// 魔法力を消費する
    /// - Parameter consumeAmount: 消費量
    func consume(consumeAmount: Int) {
        // do something
    }
}
