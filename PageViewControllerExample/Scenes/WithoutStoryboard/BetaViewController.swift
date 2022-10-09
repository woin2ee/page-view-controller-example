//
//  BetaViewController.swift
//  PageViewControllerExample
//
//  Created by Jaewon on 2022/10/08.
//

import UIKit

final class BetaViewController: UIViewController {
    
    private var betaPageViewController: BetaPageViewController = .init(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        layoutPageViewController()
    }
    
    private func layoutPageViewController() {
        self.view.addSubview(betaPageViewController.view)
        betaPageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            betaPageViewController.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            betaPageViewController.view.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
            betaPageViewController.view.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            betaPageViewController.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
