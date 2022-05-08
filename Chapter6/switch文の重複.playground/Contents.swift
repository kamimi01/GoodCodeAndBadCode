enum MagicType {
    case fire
    case shiden
}

class MagicManager {
    func getName(magicType: MagicType) -> String {
        var name = ""

        switch magicType {
        case .fire:
            name = "ファイア"
        case .shiden:
            name = "紫電"
        }

        return name
    }
}
