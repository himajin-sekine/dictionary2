//
//  Quiz.swift
//  dictionary
//
//  Created by 関根康太 on 2017/10/24.
//  Copyright © 2017年 関根康太. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //問題文格納
    var quizArray = [AnyObject] ()
    
    //正解数
    var correctAnswer: Int = 0
    
    var count:Int = 0
    
    //クイズ表示
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢
    @IBOutlet var choiceBotton1: UIButton!
    @IBOutlet var choiceBotton2: UIButton!
    @IBOutlet var choiceBotton3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //一時的にクイズを格納
        var tmpArray = [Any]()
        
        //tmpArrayに問題と選択肢と答えの番号の入った配列
        tmpArray.append(["特I型駆逐艦６番艦はどれ","東雲","狭霧","薄雲",1])
        tmpArray.append(["軽巡洋艦はどれ","木曽","神風","妙高",1])
        tmpArray.append(["夕雲型駆逐艦ではないのは","秋雲","巻雲","長波",1])
        tmpArray.append(["特III型駆逐艦はどれ","電","曙","漣",1])
        tmpArray.append(["この中で戦艦はどれ","榛名","赤城","高雄",1])
        tmpArray.append(["特型駆逐艦なのはどれ","雪風","吹雪","北上",2])
        tmpArray.append(["第二次世界大戦中で一番古い戦艦はどれ","大和","金剛","日向",2])
        tmpArray.append(["戦後、海上自衛隊海上自衛隊が所有する汎用護衛艦として名前が受け継がれたのはどれ","陽炎","初雪","吹雪",2])
        tmpArray.append(["次のうち日本の山の名前が命名基準にされているのはどれ","加賀","霧島","山城",2])
        tmpArray.append(["戦艦には旧国名、練習巡洋艦には神社の名前など艦につける名前の基準のことを何と言うか","艦名基準","命名基準","襲名基準",2])
        tmpArray.append(["戦時中海軍の保有艦ではなく、陸軍の保有艦であったのはどれ","白虎丸","はりま丸","あきつ丸",3])
        tmpArray.append(["軍艦の一種で比較的小型で主として沿岸・河川・内水で活動する火砲を主兵装とした水上戦闘艦艇をなんというか","火砲艦","水上砲台艦","砲艦",3])
        tmpArray.append(["ミッドウェー開戦で沈んだ空母はどれ","天龍","龍鳳","蒼龍",3])
        tmpArray.append(["野外が暗くなってから行う戦闘のことをなんというか","暗戦","闇戦","夜戦",3])
        tmpArray.append(["世界のビック７（世界七大戦艦）と言われた戦艦はどれ","金剛","大和","長門",3])
        
        //問題のシャッフル→quizArrayに格納
        //srand(UInt32(time(nil)))
        
        while (tmpArray.count > 0) {
            let index = Int (arc4random()) % tmpArray.count
            quizArray.append(tmpArray[index] as AnyObject)
            tmpArray.remove(at: index)
        }
        choiceQuiz()
    }
    
    func choiceQuiz() {
        
        //問題文のテキスト表示
        quizTextView.text = quizArray[0][0] as! String
        
        //選択肢のボタンにそれぞれの選択肢のテキストをセット
        choiceBotton1.setTitle(quizArray[0][1] as? String, for: UIControlState())
        choiceBotton2.setTitle(quizArray[0][2] as? String, for: UIControlState())
        choiceBotton3.setTitle(quizArray[0][3] as? String, for: UIControlState())
    }
    
    @IBAction func choiceAnswer(_ sender: UIButton) {
        
        count += 1
        
        if quizArray [0][4] as! Int == sender.tag {
            
            //正解数増加
            correctAnswer = correctAnswer + 1
            print("seikai")
        }
        
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        
        print(quizArray.count)
        
        //解いた問題数の合計があらかじめ設定していた問題数に達していたら結果画面へ
        if count == 10 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "ToResult", sender: nil)
    }
    
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToResult" {
            print(correctAnswer)
            let resultViewController = segue.destination as! QuizResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}
}
