//
//  AlphaViewController.swift
//  PageViewControllerExample
//
//  Created by Jaewon on 2022/10/08.
//

import UIKit

final class AlphaViewController: UIViewController {
    
    @IBOutlet var buttonList: [UIButton]! {
        didSet {
            buttonList.enumerated().forEach { index, button in
                button.addAction(
                    UIAction.init(handler: { _ in
                        self.changeButtonColor(by: index)
                        self.alphaPageViewController.setViewControllers(by: index)
                    }),
                    for: .touchUpInside
                )
            }
        }
    }
    
    private var alphaPageViewController: AlphaPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeButtonColor(by: self.alphaPageViewController.currentIndex)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let alphaPageVC = segue.destination as? AlphaPageViewController
        else { return }
        
        self.alphaPageViewController = alphaPageVC
        
        alphaPageVC.transitionCompletion = { index in
            self.changeButtonColor(by: index)
        }
    }
    
    private func changeButtonColor(by index: Int) {
        buttonList.enumerated().forEach { i, button in
            if i == index {
                button.tintColor = .systemGreen
            } else {
                button.tintColor = .systemBlue
            }
        }
    }
}
