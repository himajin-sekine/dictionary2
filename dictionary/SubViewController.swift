//
//  SubViewController.swift
//  dictionary
//
//  Created by 関根康太 on 2017/06/27.
//  Copyright © 2017年 関根康太. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {

    var selectedImg:UIImage!
    
    var nameStr:String!
    
    var contentText:String!
    
    @IBOutlet var image:UIImageView!
    
    @IBOutlet var label:UILabel!
    
    @IBOutlet var text:UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = selectedImg
        
        label.text = nameStr
        
        text.text = contentText
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backFromHelp(segue: UIStoryboardSegue) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
