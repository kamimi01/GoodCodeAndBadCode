// 何のロジックかわからない
var p1 = 0
var p2 = 0
var d = 0
var d1 = 0
var d2 = 0

d = p1 + p2
d = d - ((d1 + d2) / 2)

if d < 0 {
    d = 0
}

// 意図が伝わる名前をつけよう
var damageAmount = 0
var playerArmPower = 0
var playerWeaponPower = 0

var enemyBodyDefence = 0
var enemyArmorDefence = 0

damageAmount = playerArmPower + playerWeaponPower  // ①
damageAmount = damageAmount - ((enemyBodyDefence + enemyArmorDefence) / 2)  // ②

if damageAmount < 0 {
    damageAmount = 0
}
