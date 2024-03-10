import UIKit

enum StringResources {

    enum FatalError {
        static let fatalError = "init(coder:) has not been implemented"
    }

    enum AboutAppViewController {
        // swiftlint: disable line_length
        static let subTitle = "Подписывайтесь \n и узнайте первыми о скидках, акциях \n и конкурсах повышения квалификации \n и труда красоты!"
        // swiftlint: enable line_length
    }
    
    enum MainItemRestaurants {
        static let menu = "МЕНЮ"
        static let promo = "АКЦИИ"
        static let restaurants = "РЕСТОРАНЫ"
        static let delivery = "ДОСТАВКА"
        static let feedback = "ОСТАВИТЬ ОТЗЫВ"
        static let aboutApp = "О ПРИЛОЖЕНИИ"
        static let socialMedia = "CОЦИАЛЬНЫЕ СЕТИ"
        static let nameRestaurants = "Нияма ресторан"
    }
    
    enum SocialMedia {
        static let facebook = "facebook"
        // swiftlint: disable identifier_name
        static let vk = "vk"
        // swiftlint: enable dentifier_name
        static let twitter = "twitter"
        static let instagram = "instagram"
        static let odnoklassniki = "odnoklassniki"
    }

    enum Colors {
        static let white = UIColor(hexString: "#FFFFFF")
        static let black = UIColor(hexString: "#000000")
        static let gray = UIColor(hexString: "#C3C4C4")
        static let lightGray = UIColor(hexString: "#D8D8D8")
    }
}

typealias R = StringResources
