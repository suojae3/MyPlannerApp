
import UIKit


class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let monthlyVC = MonthlyViewController()
        monthlyVC.tabBarItem = UITabBarItem(title: "Scene 1", image: nil,  tag: 0)
        
        let weeklyVC = WeeklyViewController()
        weeklyVC.tabBarItem = UITabBarItem(title: "Scene 2", image: nil, tag: 1)
        
        let dailyVC = DailyViewController()
        dailyVC.tabBarItem = UITabBarItem(title: "Scene 3", image: nil, tag: 2)
        
        self.viewControllers = [monthlyVC, weeklyVC, dailyVC]
    }
}
