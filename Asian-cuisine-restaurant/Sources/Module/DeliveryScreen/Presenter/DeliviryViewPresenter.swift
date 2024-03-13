protocol DeliveryViewProtocolInput: AnyObject {
    func viewDidLoad()
    func detachView()
}

protocol DeliveryViewProtocolOutput: AnyObject {}

final class DeliveryViewPresenter: DeliveryViewProtocolInput {
    
    weak var output: DeliveryViewProtocolOutput?
    private var items: [DeliviryViewModel] = []
    
    func detachView() {
        self.output = nil
    }
    
    func viewDidLoad() {}
}
