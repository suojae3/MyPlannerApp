
import UIKit


class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let monthlyVC = MonthlyViewController()
        monthlyVC.tabBarItem = UITabBarItem(title: "Scene 1", image: UIImage(named: "1.png"), tag: 0)
        
        let weeklyVC = WeeklyViewController()
        weeklyVC.tabBarItem = UITabBarItem(title: "Scene 2", image: UIImage(named: "2.png"), tag: 1)
        
        let dailyVC = DailyViewController()
        dailyVC.tabBarItem = UITabBarItem(title: "Scene 3", image: UIImage(named: "3.png"), tag: 2)
        
        self.viewControllers = [monthlyVC, weeklyVC, dailyVC]
    }
}
