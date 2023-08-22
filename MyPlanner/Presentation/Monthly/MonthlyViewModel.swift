
import Foundation


protocol UseCaseProvider {
    func makeUseCase() -> UseCase
}

class DefaultUseCaseProvider: UseCaseProvider {
    func makeUseCase() -> UseCase {
        return UserDefaultsTaskDataSource()
    }
}

class MonthlyViewModel {
    
    private let baseVM: BasePlannerViewModel
    
    init(useCases: UseCase) {
        self.baseVM = BasePlannerViewModel(useCases: useCases)
    }
 
    
    var profileText: String {
        // TODO: Fetch or provide the profile text
        return "Profile Description"
    }
    
    // 달력 데이터
    var currentMonth: String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter.string(from: date)
    }
    
    var daysInMonth: [String] {
        return []
    }
    
    // task
    var monthlyTasks: [Task] {
        return []
    }
    
    func addTask(task: Task) {
        baseVM.handleAddTask()
    }
}
