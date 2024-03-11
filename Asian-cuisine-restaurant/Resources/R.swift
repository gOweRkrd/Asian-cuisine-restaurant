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
    
    enum AboutViewAppController {
        static let versionAppLabel = "Версия приложения"
        static let numberVersionAppLabel = "1.0.0"
        static let descriptionLabel = "Доставка суши и прочей вкусной еды от \nсети японских ресторанов Нияма. \nЗапоминает ваши предпочтения, сильно сокращает время выбора."
        static let rateButton = "Оценить в App Store"
        static let developerLabel = "Разработчик"
    }

    enum Colors {
        static let white = UIColor(hexString: "#FFFFFF")
        static let black = UIColor(hexString: "#000000")
        static let gray = UIColor(hexString: "#C3C4C4")
        static let darkGray = UIColor(hexString: "#59595a")
        static let lightGray = UIColor(hexString: "#D8D8D8")
        static let coolGray = UIColor(hexString: "#9AA19A")
        static let yellow = UIColor(hexString: "#FF9900")
    }
}

typealias R = StringResources
