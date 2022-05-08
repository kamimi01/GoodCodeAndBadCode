enum SampleError: Error {
    case invalidParameter
}

protocol Shape {
    func area() -> Double
}

// 四角形
class Rectangle: Shape {
    private let width: Double
    private let height: Double

    init(width: Double, height: Double) throws {
        if width < 0.0 || height < 0.0 {
            throw SampleError.invalidParameter
        }
        self.width = width
        self.height = height
    }

    func area() -> Double {
        return width * height
    }
}

// 円
class Circle: Shape {
    private let radius: Double

    init(radius: Double) throws {
        if radius < 0.0 {
            throw SampleError.invalidParameter
        }
        self.radius = radius
    }

    func area() -> Double {
        return radius * radius * .pi
    }
}

var shape: Shape = try Circle(radius: 10)
print(shape.area())

shape = try Rectangle(width: 20, height: 25)
print(shape.area())
