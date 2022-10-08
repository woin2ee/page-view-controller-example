//
//  AlphaPageViewController.swift
//  PageViewControllerExample
//
//  Created by Jaewon on 2022/10/08.
//

import UIKit

final class AlphaPageViewController: UIPageViewController {
    
    private let viewList: [UIViewController] = {
        let storyboard = UIStoryboard.init(name: "Alpha", bundle: nil)

        let firstVC = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "ThirdViewController")

        return [firstVC, secondVC, thirdVC]
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

extension AlphaPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard
            let index = viewList.firstIndex(of: viewController),
            index + 1 < viewList.count
        else { return nil }
        
        return viewList[index + 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard
            let index = viewList.firstIndex(of: viewController),
            index - 1 >= 0
        else { return nil }
        
        return viewList[index - 1]
    }
}
