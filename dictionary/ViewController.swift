//
//  ViewController.swift
//  dictionary
//
//  Created by 関根康太 on 2017/06/06.
//  Copyright © 2017年 関根康太. All rights reserved.
//

import UIKit



//UitableViewのDaeaSourceメゾットを使うためのプロトコル宣言を行う
class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate ,UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    /// 画像のファイル名
    @IBOutlet weak var shipgazou: CustomTableViewCell!
    let shipNames = ["艦これ.jpg",
                     "",
                     "吹雪.jpg", "白雪.jpg", "初雪.jpg", "深雪.jpg", "叢雲.jpg", "東雲.jpg", "薄雲.jpg", "白雲.jpg","磯波.jpg","浦波.jpg",
                     
                     "",
                     "綾波.jpg","敷波.jpg","朝霧.jpg","夕霧.jpg","天霧.jpg","狭霧.jpg","朧.jpg","曙.jpg","漣.jpg","潮.jpg",
                     
                     "",
                     "暁.jpg", "響.jpg", "雷.jpg", "電.jpg",
                     
                     "",
                     "球磨.jpg", "多摩.jpg","北上.jpg", "大井.jpg", "木曽.jpg",
                     
                     "",
                     "金剛.jpg", "比叡.jpg", "榛名.jpg","霧島.jpg",]
    
    
    var kensakuContent = [String]()
    
    
    var shipData:[[String]] = [
        ["艦これ.jpg","艦これ","DMMブラウザゲーム"],
        ["","特I型駆逐艦","特I型（吹雪型）駆逐艦",],
        ["吹雪.jpg","吹雪","特I型駆逐艦１番艦『吹雪』"],
        ["白雪.jpg","白雪","特I型駆逐艦２番艦『白雪』"],
        ["初雪.jpg","初雪","特I型駆逐艦３番艦『初雪』"],
        ["深雪.jpg","深雪","特I型駆逐艦４番艦『深雪』"],
        ["叢雲.jpg","叢雲","特I型駆逐艦５番艦『叢雲』"],
        ["東雲.jpg","東雲","特I型駆逐艦６番艦『東雲』"],
        ["薄雲.jpg","薄雲","特I型駆逐艦７番艦『薄雲』"],
        ["白雲.jpg","白雲","特I型駆逐艦８番艦『白雲』"],
        ["磯波.jpg","磯波","特I型駆逐艦９番艦『磯波』"],
        ["浦波.jpg","浦波","特I型駆逐艦１０番艦『浦波』"],
        ["","特II型駆逐艦","特II型（綾波型）駆逐艦"],
        ["綾波.jpg","綾波","特II型駆逐艦１番艦『綾波』"],
        ["敷波.jpg","敷波","特II型駆逐艦２番艦『敷波』"],
        ["朝霧.jpg","朝霧","特II型駆逐艦３番艦『朝霧』"],
        ["夕霧.jpg","夕霧","特II型駆逐艦４番艦『夕霧』"],
        ["天霧.jpg","天霧","特II型駆逐艦５番艦『天霧』"],
        ["狭霧.jpg","狭霧","特II型駆逐艦６番艦『狭霧』"],
        ["朧.jpg","朧","特II型駆逐艦７番艦『朧』"],
        ["曙.jpg","曙","特II型駆逐艦８番艦『曙』"],
        ["漣.jpg","漣","特II型駆逐艦９番艦『漣』"],
        ["潮.jpg","潮","特II型駆逐艦１０番艦『潮』"],
        ["","特III型駆逐艦","特III型（暁型）駆逐艦"],
        ["暁.jpg","暁","特III型駆逐艦１番艦『暁』"],
        ["響.jpg","響","特III型駆逐艦２番艦『響』"],
        ["雷.jpg","雷","特III型駆逐艦３番艦『雷』"],
        ["電.jpg","電","特III型駆逐艦４番艦『電』"],
        ["", "球磨型軽巡洋艦","球磨型軽巡洋艦"],
        ["球磨.jpg","球磨","球磨型軽巡洋艦１番艦『球磨』"],
        ["多摩.jpg","多摩","球磨型軽巡洋艦２番艦『多摩』"],
        ["北上.jpg","北上","球磨型軽巡洋艦３番艦『北上』"],
        ["大井.jpg","大井","球磨型軽巡洋艦４番艦『大井』"],
        ["木曽.jpg","木曽","球磨型軽巡洋艦５番艦『木曽』"],
        ["","金剛型巡洋戦艦","金剛型巡洋戦艦"],
        ["金剛.jpg","金剛","金剛型巡洋戦艦１番艦『金剛』"],
        ["比叡.jpg","比叡","金剛型巡洋戦艦２番艦『比叡』"],
        ["榛名.jpg","榛名","金剛型巡洋戦艦３番艦『榛名』"],
        ["霧島.jpg","霧島","金剛型巡洋戦艦４番艦『霧島』"]]
    
    var kennsaku = [[String]]()
    
    var selectedImage:UIImage!
    
    var cellNum:Int = 0
    
    var shipdata = Shipdata()
    
    /// 画像のタイトル
    @IBOutlet weak var shiptitle: CustomTableViewCell!
    let shipTitles = [
        ""
    ]
    
    @IBOutlet var table:UITableView? = UITableView()
    
    /// 画像の説明
    @IBOutlet weak var shipdescription: CustomTableViewCell!
    let shipDescriptions = [
        ""
    ]
    
    /// セルの個数を指定するデリゲートメソッド（必須）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kennsaku.count
    }
    
    /// セルに値を設定するデータソースメソッド（必須)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
        
        // セルに値を設定
        cell.setCell(imageName: kennsaku[indexPath.row][0], titleText: kennsaku[indexPath.row][1], descriptionText: kennsaku[indexPath.row][2])
        
        return cell
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var index = 0
        
        kennsaku.removeAll()
        kensakuContent.removeAll()
        
        if(searchBar.text == ""){
            kennsaku = shipData
        }else{
            for data in shipData{
                if data[1].contains(searchBar.text!){
                    
                    kennsaku.append(shipData[index])
                    
                    kensakuContent.append(shipdata.content[index])
                    
                }
                
                index += 1
            }
        }
        
        table?.reloadData()
    }
    
    
    func searchBar(searchbar: UISearchBar, textDidChang searchText: String) {
        
        var index = 0
        
        kennsaku.removeAll()
        
        if(searchbar.text == ""){
            kennsaku = shipData
            
            kensakuContent = shipdata.content
        }else{
            for data in shipData{
                if data.contains(searchbar.text!){
                    if data[1].range(of: searchbar.text!) != nil {
                        kennsaku.append(shipData[index])
                    }
                    
                    index += 1
                }
            }
        }
        
        table?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = UIImage(named:"\(kennsaku[indexPath.row][0])")
        if selectedImage != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            cellNum = indexPath.row
            
            performSegue(withIdentifier: "toSub",sender: nil)
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toSub") {
            let subVC: SubViewController = (segue.destination as? SubViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.selectedImg = selectedImage
            subVC.nameStr = kennsaku[cellNum][1]
            
            
            subVC.contentText = kensakuContent[cellNum]
        }
        
        
    }
    
    //艦名を入れるための配列
    var shipNameArray = [String]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.enablesReturnKeyAutomatically = false
        
        
        self.table?.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        
        //tableviewのDataSourceメゾットはviewcontrollerクラスに書くよという設定
        table?.dataSource = self
        table?.delegate = self
        
        //shipnamearrayに艦名を入れていく　説明部分名前
        shipNameArray = ["艦これ",
                         
                         "特Ⅰ型駆逐艦",
                         "吹雪","白雪","初雪","深雪","叢雲","東雲","薄雲","白雲","磯波","浦波",
                         
                         "特II型駆逐艦",
                         "綾波","敷波","朝霧","夕霧","天霧","狭霧","朧","曙","漣","潮",
                         
                         "特Ⅲ型駆逐艦",
                         "暁","響","雷","電",
                         
                         "球磨型軽巡洋艦",
                         "球磨","多摩","北上","大井","木曽",
                         
                         "金剛型巡洋戦艦",
                         "金剛","比叡","榛名","霧島"]
        
        
        kennsaku = shipData
        
        kensakuContent = shipdata.content

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

