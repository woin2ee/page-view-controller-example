//
//  BetaPageViewController.swift
//  PageViewControllerExample
//
//  Created by Jaewon on 2022/10/09.
//

import UIKit

final class BetaPageViewController: UIPageViewController {
    
    private let viewList: [UIViewController] = {
        let greenVC = GreenViewController.init()
        let blueVC = BlueViewController.init()
        let redVC = RedViewController.init()
        
        return [greenVC, blueVC, redVC]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = viewList.first {
            self.setViewControllers(
                [firstVC],
                direction: .forward,
                animated: true
            )
        }
    }
}

extension BetaPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard
            let index = viewList.firstIndex(of: viewController),
            index - 1 >= 0
        else { return nil }
        
        return viewList[index - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard
            let index = viewList.firstIndex(of: viewController),
            index + 1 < viewList.count
        else { return nil }
        
        return viewList[index + 1]
    }
}
