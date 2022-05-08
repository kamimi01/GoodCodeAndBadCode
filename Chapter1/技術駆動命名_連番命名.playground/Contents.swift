// x 技術駆動命名
class MemoryStateManager {
    var intValue01 = 0

    func changeIntValue01(changeValue: Int) {
        intValue01 -= changeValue
        if intValue01 < 0 {
            intValue01 = 0
            updateState02Flag()
        }
    }

    func updateState02Flag() {
        // do something
    }
}

// x 連番命名
class Class01 {
    func method001() {}
    func method002() {}
    func method003() {}
}
