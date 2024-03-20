import UIKit

enum StringResources {

    enum FatalError {
        static let fatalError = "init(coder:) has not been implemented"
    }
    
    enum MainViewController {
        static let identifier = "RestaurantViewCell"
        static let fatalError = "Unable to dequeue RestaurantViewCell"
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
    
    enum AboutAppPresenter {
        static let сommunication = "Для связи"
        static let сommunicationDescription = "office@niyama.ru"
        static let qualityDepartment = "Отдел качества"
        static let qualityDepartmentDescription = "quality@niyama.ru"
        static let deliveryService = "Служба доставки"
        static let deliveryServiceDescription = "7 (495) 781-781-99"
    }

    enum AboutViewAppController {
        static let versionAppLabel = "Версия приложения"
        static let numberVersionAppLabel = "1.0.0"
        static let descriptionLabel = "Доставка суши и прочей вкусной еды от" +
        "\nсети японских ресторанов Нияма. \nЗапоминает ваши предпочтения, сильно сокращает время выбора."
        static let rateButton = "Оценить в App Store"
        static let developerLabel = "Разработчик"
        static let identifier = "AboutAppViewCell"
        static let fatalError = "Unable to dequeue AboutAppViewCell"
    }
    
    enum SocialMediaViewController {
        static let subTitle = "Подписывайтесь\n" +
        "и узнайте первыми о скидках, акциях\n" +
        "и конкурсах повышения квалификации\n" +
        "и труда красоты!"
        static let identifier = "SocialMediaCell"
        static let fatalError = "Unable to dequeue SocialMediaCell"
    }

    enum FeedbackViewController {
        static let restaurantButton = "Ресторан"
        static let deliviryButton = "Доставка"
        static let nameLabel = "Имя"
        static let nameTextField = "Введите ваше имя"
        static let phoneNumberLabel = "Номер телефона"
        static let phoneNumberTextField = "Введите ваш номер телефона"
        static let numberOrderLabel = "Номер заказа"
        static let numberOrderTextField = "Введите ваш номер заказа"
        static let identifier = "FeedBackViewCell"
        static let fatalError = "Unable to dequeue FeedBackViewCell"
        static let addPhotoLabel = "Добавить фото"
        static let feedBackLabel = "Отзыв"
        static let subDescription = "Спасибо за вовремя выполненный заказ."
        static let sendButton = "ОТПРАВИТЬ ОТЗЫВ"
    }

    enum DeliveryViewController {
        static let descriptionLabel = "Укажите пожалуйста \n адрес доставки"
        static let city = "Город"
        static let station = "Станция"
        static let street = "Улица/дом"
        static let desciptionButton = "Cписок адресов"
        static let locationDesciptionButton = "Геолокация"
        static let cityTextField = "Введите город"
        static let stationTextField = "Введите станцию"
        static let streetTextField = "Введите улицу"
    }
    
    enum RestaurantsViewController {
        static let forMapsButton = "На карте"
        static let allButton = "Все"
        static let identifier = "RestaurantsViewCell"
        static let fatalError = "Unable to dequeue RestaurantsViewCell"
    }
    
    enum PromoViewCell {
        static let titleLabel = "text"
    }
    
    enum PromoViewController {
        static let identifier = "PromoViewCell"
        static let fatalError = "Unable to dequeue PromoViewCell"
    }
    
    enum MenuViewController {
        static let identifier = "MenuViewCell"
        static let fatalError = "Unable to dequeue MenuViewCell"
        static let searchTextField = "Введите адрес"
    }
    
    enum Colors {
        static let white = UIColor(hexString: "#FFFFFF")
        static let black = UIColor(hexString: "#000000")
        static let darkGray = UIColor(hexString: "#1F2023")
        static let gray = UIColor(hexString: "#59595A")
        static let lightGray = UIColor(hexString: "#D8D8D8")
        static let coolGray = UIColor(hexString: "#9AA19A")
        static let yellow = UIColor(hexString: "#FF9900")
        static let tangerine = UIColor(hexString: "FB9C02")
        static let darkOrange = UIColor(hexString: "F29200")
        static let brownishOrange = UIColor(hexString: "371F07")
    }
}

typealias R = StringResources
