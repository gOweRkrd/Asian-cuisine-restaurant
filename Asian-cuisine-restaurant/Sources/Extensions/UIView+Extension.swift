import UIKit

extension UIView {
    
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
    
    func addGradient(frame: CGRect) {
        let gradientView = UIView(frame: self.frame)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = [UIColor.clear.cgColor, R.Colors.black.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
        addSubview(gradientView)
    }
}
