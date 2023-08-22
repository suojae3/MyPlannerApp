
import Foundation

class MonthlyViewModel {
    
    let baseVM: BasePlannerViewModel
    
    init(useCases: UseCase) {
        self.baseVM = BasePlannerViewModel(useCases: useCases)
    }
}
