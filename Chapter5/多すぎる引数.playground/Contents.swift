/// 魔法力を回復する
/// - Parameters:
///   - currentMagicPoint: 現在の魔法力残量
///   - originalMaxMagicPoint: オリジナルの魔法力最大値
///   - maxMagicIncrements: 魔法力最大値の増分
///   - recoveryAmount: 回復する魔法力値
/// - Returns: 回復後の魔法力残量
func recoverMagicPoint(currentMagicPoint: Int, originalMaxMagicPoint: Int, maxMagicIncrements: [Int], recoveryAmount: Int) -> Int {
    var currentMaxMagicPoint = originalMaxMagicPoint
    for each in maxMagicIncrements {
        currentMaxMagicPoint += each
    }

    return min(currentMagicPoint + recoveryAmount, currentMaxMagicPoint)
}
