import UIKit

protocol Assembly {
    static func assembleModule() -> UIViewController
}

extension Assembly {
    static func assembleModule() -> UIViewController {
        fatalError("Implement assembleModule() in ModuleAssembly")
    }
}
