import Foundation

extension String {
    func capitalizedFirstLetter() -> String {
        prefix(1).uppercased() + dropFirst().lowercased()
    }
}
