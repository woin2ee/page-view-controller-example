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
    
    var currentIndex: Int {
        guard let displayedVC = self.viewControllers?.first else { return 0 }
        return viewList.firstIndex(of: displayedVC) ?? 0
    }
    
    var transitionCompletion: ((Int) -> Void)? = nil
    
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
    
    func setViewControllers(by index: Int) {
        guard index >= 0, index < viewList.count else { return }
        
        let direction: UIPageViewController.NavigationDirection = {
            if index < currentIndex {
                return .reverse
            } else {
                return .forward
            }
        }()
        
        self.setViewControllers(
            [viewList[index]],
            direction: direction,
            animated: true
        )
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
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        if completed {
            transitionCompletion?(currentIndex)
        }
    }
}
