var playerArmPower = 0
var playerWeaponPower = 0
var enemyBodyDefence = 0
var enemyArmorDefence = 0

// x 再代入
//let totalPlayerAttackPower = playerArmPower + playerWeaponPower
//let totalEnemyDefence = enemyBodyDefence + enemyArmorDefence
//
//damageAmount = totalEnemyDefence - (totalEnemyDefence / 2)

// 意味のあるまとまりでメソッド化
// プレイヤーの攻撃力を合算する
func sumUpPlayerAttackPower(playerArmPower: Int, playerWeaponPower: Int) -> Int {
    return playerArmPower + playerWeaponPower
}

// 敵の防御力を合算する
func sumUpEnemyDefence(enemyBodyDefence: Int, enemyArmorDefence: Int) -> Int {
    return enemyBodyDefence + enemyArmorDefence
}

// ダメージ量を評価する
func estimateDamage(totalPlayerAttackPower: Int, totalEnemyDefence: Int) -> Int {
    let damageAmount = totalPlayerAttackPower - (totalEnemyDefence / 2)
    if damageAmount < 0 {
        return 0
    }
    return damageAmount
}

// 上記のメソッドを呼び出す
let totalPlayerAttackPower = sumUpPlayerAttackPower(playerArmPower: playerArmPower, playerWeaponPower: playerWeaponPower)
let totalEnemyDefence = sumUpEnemyDefence(enemyBodyDefence: enemyBodyDefence, enemyArmorDefence: enemyArmorDefence)
let damageAmount = estimateDamage(totalPlayerAttackPower: totalPlayerAttackPower, totalEnemyDefence: totalEnemyDefence)
