//
//  QuizResultViewController.swift
//  dictionary
//
//  Created by 関根康太 on 2017/10/24.
//  Copyright © 2017年 関根康太. All rights reserved.
//

import UIKit

class QuizResultViewController: UIViewController {
    
    //正解数
    var correctAnswer: Int = 0
    
    //結果
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        resultLabel.text = String(correctAnswer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
}

}
