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
    
    var shipArray: [Ship] = Array()
    
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
    
    
    var kensakuShipArray = [Ship]()
    
    var shipImageArray: [UIImage] = [UIImage(named:"艦これ.jpg")!,
                                     
                                     UIImage(),
                                     UIImage(named:"吹雪.jpg")!,
                                     UIImage(named:"白雪.jpg")!,
                                     UIImage(named:"初雪.jpg")!,
                                     UIImage(named:"深雪.jpg")!,
                                     UIImage(named:"叢雲.jpg")!,
                                     UIImage(named:"東雲.jpg")!,
                                     UIImage(named:"薄雲.jpg")!,
                                     UIImage(named:"白雲.jpg")!,
                                     UIImage(named:"磯波.jpg")!,
                                     UIImage(named:"浦波.jpg")!,
                                     
                                     UIImage(),
                                     UIImage(named:"綾波.jpg")!,
                                     UIImage(named:"敷波.jpg")!,
                                     UIImage(named:"朝霧.jpg")!,
                                     UIImage(named:"夕霧.jpg")!,
                                     UIImage(named:"天霧.jpg")!,
                                     UIImage(named:"狭霧.jpg")!,
                                     UIImage(named:"朧.jpg")!,
                                     UIImage(named:"曙.jpg")!,
                                     UIImage(named:"漣.jpg")!,
                                     UIImage(named:"潮.jpg")!,
                                    
                                     UIImage(),
                                     UIImage(named:"暁.jpg")!,
                                     UIImage(named:"響.jpg")!,
                                     UIImage(named:"雷.jpg")!,
                                     UIImage(named:"電.jpg")!,
                                    
                                     UIImage(),
                                     UIImage(named:"球磨.jpg")!,
                                     UIImage(named:"多摩.jpg")!,
                                     UIImage(named:"北上.jpg")!,
                                     UIImage(named:"大井.jpg")!,
                                     UIImage(named:"木曽.jpg")!,
                                     
                                     UIImage(),
                                     UIImage(named:"阿賀野.jpg")!,
                                     UIImage(named:"能代.jpg")!,
                                     UIImage(named:"矢矧.jpg")!,
                                     UIImage(named:"酒匂.jpg")!,
                                     
                                     
                                     UIImage(),
                                     UIImage(named:"妙高.jpg")!,
                                     UIImage(named:"那智.jpg")!,
                                     UIImage(named:"足柄.jpg")!,
                                     UIImage(named:"羽黒.jpg")!,
                                     
                                     UIImage(),
                                     UIImage(named:"金剛.jpg")!,
                                     UIImage(named:"比叡.jpg")!,
                                     UIImage(named:"榛名.jpg")!,
                                     UIImage(named:"霧島.jpg")!,]
    
    var shipName: [String] = ["艦これ",
                              "特Ⅰ型駆逐艦",
                              "吹雪","白雪","初雪","深雪","叢雲","東雲","薄雲","白雲","磯波","浦波",
                              "特II型駆逐艦","綾波","敷波","朝霧","夕霧","天霧","狭霧","朧","曙","漣","潮",
                              "特Ⅲ型駆逐艦","暁","響","雷","電",
                              "球磨型軽巡洋艦","球磨","多摩","北上","大井","木曽",
                              "阿賀野型軽巡洋艦","阿賀野","能代","矢矧","酒匂",
                              "妙高型重巡洋艦","妙高","那智","足柄","羽黒",
                              "金剛型巡洋戦艦","金剛","比叡","榛名","霧島",]
    
    var detailNameArray: [String] = ["DMMブラウザゲーム",
                                     "特I型（吹雪型）駆逐艦",
                                     "特I型1番艦『吹雪』",
                                     "特I型2番艦『白雪』",
                                     "特I型3番艦『初雪』",
                                     "特I型4番艦『深雪』",
                                     "特I型5番艦『叢雲』",
                                     "特I型6番艦『東雲』",
                                     "特I型7番艦『薄雲』",
                                     "特I型8番艦『白雲』",
                                     "特I型9番艦『磯波』",
                                     "特I型10番艦『浦波』",
                                     
                                     "特II型（綾波型）駆逐艦",
                                     "特II型1番艦『綾波』",
                                     "特II型2番艦『敷波』",
                                     "特II型3番艦『朝霧』",
                                     "特II型4番艦『夕霧』",
                                     "特II型5番艦『天霧』",
                                     "特II型6番艦『狭霧』",
                                     "特II型7番艦『朧』",
                                     "特II型8番艦『曙』",
                                     "特II型9番艦『漣』",
                                     "特II型10番艦『潮』",
                                     
                                     "特III型（暁型）駆逐艦",
                                     "特III型1番艦『暁』",
                                     "特III型2番艦『響』",
                                     "特III型3番艦『雷』",
                                     "特III型4番艦『電』",
                                     
                                     "球磨型軽巡洋艦",
                                     "球磨型1番艦『球磨』",
                                     "球磨型2番艦『多摩』",
                                     "球磨型3番艦『北上』",
                                     "球磨型4番艦『大井』",
                                     "球磨型5番艦『木曽』",
                                     
                                     "阿賀野型軽巡洋艦",
                                     "阿賀野型1番艦『阿賀野』",
                                     "阿賀野型2番艦『能代』",
                                     "阿賀野型3番艦『矢矧』",
                                     "阿賀野型4番艦『酒匂』",
                                     
                                     "妙高型重巡洋艦",
                                     "妙高型1番艦『妙高』",
                                     "妙高型2番艦『那智』",
                                     "妙高型3番艦『足柄』",
                                     "妙高型4番艦『羽黒』",
                                     
                                     "金剛型巡洋戦艦",
                                     "金剛型1番艦『金剛』",
                                     "金剛型2番艦『比叡』",
                                     "金剛型3番艦『榛名』",
                                     "金剛型4番艦『霧島』",]
    
    var contentArray: [String] = [
"『艦隊これくしょん -艦これ-』（かんたいこれくしょん かんこれ）は、角川ゲームスが開発しDMM.comがブラウザゲームとして配信している育成シミュレーションゲームおよび、そのメディアミックス作品群。ゲーム内容は、第二次世界大戦時の大日本帝国海軍の軍艦を中心とした艦艇を女性キャラクターに擬人化した「艦娘（かんむす）」をゲーム中で集め、強化しながら敵と戦闘し勝利を目指すというものである。2013年4月23日にブラウザ版のサービスを開始した。2016年6月10日からは、ブラウザ版とデータが同期するAndroid版を提供している。公式略称は「艦これ」。表記揺れとして「艦隊これくしょん〜艦これ〜」などがある。2016年2月下旬現在、ブラウザ版における登録や課金サーバーなどのプラットフォーム系以外は全て「「艦これ」運営鎮守府」（運営）が担当している。",

"特I型駆逐艦",
"吹雪（ふぶき）は、大日本帝国海軍の一等駆逐艦。重武装（砲塔式12.7cm連装砲3基と61センチ3連装魚雷発射管を中心に配備し9本の予備魚雷も搭載した）で凌波性に優れた本型の出現は、当時の列強海軍に衝撃をあたえた。吹雪は特型駆逐艦のネームシップで、同時に雪級の一番艦。この名を持つ日本海軍の艦艇としては2隻目である（初代は春雨型駆逐艦の吹雪）。 吹雪は1942年10月11日のサボ島沖海戦で沈没し、吹雪型は白雪型駆逐艦と改名された。その後、初雪型駆逐艦として再登録された。   以下ゲームなどにおける吹雪　　　艦これ内ではプレイヤーが最初に選ぶことのできる五隻の初期艦(ポケモンで言う御三家)のうちの一隻",
"白雪（しらゆき）は、大日本帝国海軍の駆逐艦。特型駆逐艦こと一等駆逐艦吹雪型(白雪型・初雪型)の2番艦。 雪級（ゆきクラス）の1隻。 当初の艦名は第三十六号駆逐艦。白雪の名を持つ日本海軍の艦船としては神風型駆逐艦（初代）「白雪」に続いて2隻目。名称ははつゆき型護衛艦（現、しまゆき型護衛艦）2番艦「しらゆき」に受け継がれている。",
"初雪（はつゆき）は大日本帝国海軍の駆逐艦。 特型（一等駆逐艦吹雪型）の3番艦。 雪級の3番艦。 「吹雪、白雪」沈没後は『初雪型駆逐艦』の1番艦（ネームシップ）である。当初の艦名は、第37号駆逐艦。この名を持つ帝国海軍の艦船としては神風型駆逐艦（初代）「初雪」に続いて2隻目。戦後、はつゆき型護衛艦「はつゆき」としてその名は受け継がれた。",
"深雪（みゆき）は大日本帝国海軍の駆逐艦。",
"叢雲（むらくも）は大日本帝国海軍の駆逐艦。一等駆逐艦吹雪型の5番艦。 雲級の1番艦。 当初の艦名は、第39号駆逐艦。この名を持つ帝国海軍の艦船としては東雲型駆逐艦「叢雲」に続いて2隻目。",
"東雲（しののめ）は日本海軍の駆逐艦（2代目）。",
"薄雲（うすぐも）は日本海軍の駆逐艦。一等駆逐艦吹雪型（特型駆逐艦）の7番艦。雲級の1隻。当初の艦名は、第41号駆逐艦。この名を持つ日本海軍の艦船としては東雲型駆逐艦「薄雲」に続いて2隻目。",
"白雲（しらくも）は日本海軍の駆逐艦。一等駆逐艦吹雪型（初雪型）の8番艦で、特型駆逐艦。雲級（くもクラス）の1隻。当初の艦名は、第42号駆逐艦。この名を持つ日本海軍の艦船としては白雲型駆逐艦「白雲」に続いて2隻目。太平洋戦争後半の1944年（昭和19年）3月16日深夜、船団護衛中に北海道の釧路沖合で米潜水艦の雷撃により撃沈された。",
"磯波（いそなみ）は大日本帝国海軍の駆逐艦。特型（吹雪型）の9番艦である。当初の艦名は、第43号駆逐艦。艦名は磯に打ち寄せる波から由来し、この名を持つ帝国海軍の艦船としては神風型駆逐艦「磯波」に続き2代目にあたる。",
"浦波（うらなみ）は日本海軍の駆逐艦（2代目）。 吹雪型駆逐艦の10番艦。 特型駆逐艦の波級。 浦波級として紹介されたこともある。 当初の艦名は第四十四号駆逐艦。 「磯波」までの特I型と煙突基部の缶室給気路が改正され異なっており、特改I型と呼ばれる場合がある（日本海軍の法令上は吹雪型駆逐艦。吹雪型1番艦吹雪と吹雪型2番艦沈没後は初雪型駆逐艦）。",
                                  
"特II型駆逐艦",
"綾波（あやなみ）は大日本帝国海軍の駆逐艦。特型駆逐艦（吹雪型）の11番艦。艦名は重なりあって寄せる波から由来し、この名を受け継いだ日本の艦艇としては神風型駆逐艦 (初代)「綾波」に続き2代目にあたる。特型駆逐艦(一等駆逐艦吹雪型)の11番艦であるが、実質吹雪型の改良艦となっており特型II型駆逐艦（綾波型）という分類に属する一番艦である。吹雪型（I型）との違いは主に煙突の形状の違いや、主砲のタイプの違いである。",
"敷波（しきなみ）は、日本海軍の駆逐艦。吹雪型（特型）の12番艦（特II型の2番艦）である。艦名は頻りに寄せる波に由来し、この名を受け継ぐ日本海軍の艦船としては敷波型駆逐艦「敷波」に続き2代目に当たる。",
"朝霧（あさぎり）は日本海軍の駆逐艦。吹雪型（特型）の13番艦（特II型の3番艦）である。この名を持つ日本海軍の艦船としては春雨型駆逐艦「朝霧」に続いて2隻目。",
"夕霧（ゆうぎり/ゆふぎり）は日本海軍の駆逐艦。吹雪型（特型）の14番艦（特II型の4番艦）である。この名を持つ日本海軍の艦船としては東雲型駆逐艦「夕霧」に続いて2隻目。",
"天霧（あまぎり）は、日本海軍の駆逐艦。 海軍省が定めた艦艇類別等級では吹雪型駆逐艦に属する。",
"狭霧（さぎり）は、大日本帝国海軍の駆逐艦。",
"朧（おぼろ）は日本海軍の駆逐艦。一等駆逐艦吹雪型（特型）の17番艦。朧型（吹雪型後期型）の1番艦。特II型の7番艦。この名を持つ日本海軍の艦船としては、雷型駆逐艦「朧」に続いて2隻目。",
"曙（あけぼの）は日本海軍の駆逐艦。吹雪型（特型）の18番艦（特II型の8番艦）である。この名を持つ日本海軍の艦船としては雷型駆逐艦「曙」に続いて2隻目。",
"漣（さざなみ）は大日本帝国海軍の駆逐艦。一等駆逐艦吹雪型（初雪型）の19番艦。特型駆逐艦[1]。吹雪型の後期型（朧型)。特II型の9番艦。この名を持つ帝国海軍の艦船としては、雷型駆逐艦「漣」に続いて2隻目。戦後、海上自衛隊のたかなみ型護衛艦「さざなみ」が就役した。",
"潮（うしお / うしほ）は日本海軍の駆逐艦。一等駆逐艦吹雪型（特型）の20番艦（特II型の10番艦）。吹雪型の後期型（朧型）。この名を持つ日本海軍の艦船としては神風型駆逐艦 (初代)「潮」に続いて2隻目。",
                                  
"特III型駆逐艦",
"暁（あかつき）は、日本海軍の駆逐艦。一等駆逐艦で吹雪型駆逐艦の21番艦。日本海軍で「暁」を名乗るのは暁型駆逐艦1番艦とロシア海軍からの捕獲艦で一時的に名乗った駆逐艦「山彦」（Решительный）に続いて3隻目。　　　",
"響（ひびき）は、日本海軍の駆逐艦。吹雪型（特型）の22番艦（III型の2番艦）である。この名を持つ日本海軍の艦船としては神風型駆逐艦 (初代)「響」に続いて2隻目。太平洋戦争で戦火により3度の甚大な損傷を蒙ったにもかかわらず沈没せず、終戦まで生き残った強運ぶりと活躍から「不沈艦」、「不死鳥」、「戦争を生きのびる運命の艦」などと形容された。　　　排水量:基準1,680t 公試1,980t  全長:118m  全幅:10.36m　　吃水:3.2m　　機関:ロ号艦本式缶3基,艦本式タービン2基2軸,50,000hp",
"雷（いかづち）は、日本海軍の駆逐艦。一等駆逐艦吹雪型（初雪型）の23番艦（III型の3番艦）である。この名を持つ日本海軍の艦船としては雷型駆逐艦「雷」に続いて2隻目",
"電（いなづま）は、日本海軍の駆逐艦。一等駆逐艦吹雪型(初雪型)（特型）の24番艦（III型の4番艦）、朧型（吹雪型の後期型）。この名を持つ日本海軍の艦船としては雷型駆逐艦「電」に続いて2隻目。ロンドン海軍軍縮条約により、駆逐艦は「1500トンを超える艦は、合計排水量の16パーセントまで」という制限が設けられ特型の増産が不可能となり、本艦をもって建造が打ち切られた。スラバヤ沖海戦では、撃沈された敵乗組員376名を救助したことで知られている",
                                  
"球磨型軽巡洋艦",
"球磨（くま）は、日本海軍の二等巡洋艦(軽巡洋艦)。 球磨型の1番艦である。 その艦名は、熊本県を流れる球磨川にちなんで命名された。 帝国海軍の命名慣例については日本艦船の命名慣例を参照のこと。",
"多摩（たま）は、日本海軍の二等巡洋艦 (軽巡洋艦)。 球磨型の2番艦。 その艦名は、多摩川に因んで命名された。",
"北上（きたかみ）は、大日本帝国海軍の軽巡洋艦。球磨型の3番艦。その艦名は、岩手県・宮城県を流れる北上川より名づけられた。",
"大井（おおい/おほゐ）は、大日本帝国海軍の軽巡洋艦。球磨型の4番艦。その艦名は、静岡県の中部を流れる大井川から因んで命名された。大井の艦名はローマ字表記（英語表記）にした場合「Oi」と僅か2文字であるため、鵜来型海防艦の伊王と並び、艦名としては世界一短いものだとされている",
"木曾（きそ）は、大日本帝国海軍の球磨型軽巡洋艦の5番艦。艦名は東海地方を流れる木曽川に由来して命名された。",

"阿賀野型軽巡洋艦",
"阿賀野（あがの）は、大日本帝国海軍の軽巡洋艦。阿賀野型軽巡洋艦（阿賀野型二等巡洋艦）の１番艦。艦名は新潟県と福島県を流れる阿賀野川からちなんで命名された。　1940年六月十八日第132号間は佐世保海軍工廠で起工1941年九月二十日132号艦は軍艦『阿賀野』と命名される。同日附で阿賀野型（二等巡洋艦）のネームシップとして登録。同年九月十二日に内示された昭和17年度戦時編成で、阿賀野は第四艦隊・第九潜水戦隊の旗艦になる予定だった",
"能代（のしろ）は日本海軍の軽巡洋艦。（阿賀野型二等巡洋艦）の２番艦。艦名は秋田県の米代川の下流の別称、能代川からちなんで命名された",
"",
"",

"",
"",
"",
"",
"",

"金剛型巡洋戦艦",
"金剛（こんごう/こんかう）は、日本海軍が初の超弩級巡洋戦艦として発注した金剛型の1番艦。イギリスに発注された最後の主力艦である。2度の改装後は高速戦艦として、太平洋戦争でも活躍した。なお金剛は、日本海軍が太平洋戦争で使用した唯一の外国製日本戦艦でもあった。",
"比叡 （ひえい）は、大日本帝国海軍（以下日本海軍）の巡洋戦艦、戦艦、練習戦艦。",
"榛名（はるな）は、日本海軍の戦艦で、金剛型戦艦の3番艦",
"霧島（きりしま）は、日本海軍の軍艦。建造時は巡洋戦艦。最終時は戦艦で、金剛型戦艦の4番艦。",
]

    
    
    var shipData:[[String]] = [
        ["艦これ.jpg","艦これ","DMMブラウザゲーム"],
        ["","特I型駆逐艦","特I型（吹雪型）駆逐艦",],
        ["吹雪.jpg","吹雪","特I型１番艦『吹雪』"],
        ["白雪.jpg","白雪","特I型２番艦『白雪』"],
        ["初雪.jpg","初雪","特I型３番艦『初雪』"],
        ["深雪.jpg","深雪","特I型４番艦『深雪』"],
        ["叢雲.jpg","叢雲","特I型５番艦『叢雲』"],
        ["東雲.jpg","東雲","特I型６番艦『東雲』"],
        ["薄雲.jpg","薄雲","特I型７番艦『薄雲』"],
        ["白雲.jpg","白雲","特I型８番艦『白雲』"],
        ["磯波.jpg","磯波","特I型９番艦『磯波』"],
        ["浦波.jpg","浦波","特I型１０番艦『浦波』"],
        ["","特II型駆逐艦","特II型（綾波型）駆逐艦"],
        ["綾波.jpg","綾波","特II型１番艦『綾波』"],
        ["敷波.jpg","敷波","特II型２番艦『敷波』"],
        ["朝霧.jpg","朝霧","特II型３番艦『朝霧』"],
        ["夕霧.jpg","夕霧","特II型４番艦『夕霧』"],
        ["天霧.jpg","天霧","特II型５番艦『天霧』"],
        ["狭霧.jpg","狭霧","特II型６番艦『狭霧』"],
        ["朧.jpg","朧","特II型７番艦『朧』"],
        ["曙.jpg","曙","特II型８番艦『曙』"],
        ["漣.jpg","漣","特II型９番艦『漣』"],
        ["潮.jpg","潮","特II型１０番艦『潮』"],
        ["","特III型駆逐艦","特III型（暁型）駆逐艦"],
        ["暁.jpg","暁","特III型１番艦『暁』"],
        ["響.jpg","響","特III型２番艦『響』"],
        ["雷.jpg","雷","特III型３番艦『雷』"],
        ["電.jpg","電","特III型４番艦『電』"],
        ["", "球磨型軽巡洋艦","球磨型軽巡洋艦"],
        ["球磨.jpg","球磨","球磨型１番艦『球磨』"],
        ["多摩.jpg","多摩","球磨型２番艦『多摩』"],
        ["北上.jpg","北上","球磨型３番艦『北上』"],
        ["大井.jpg","大井","球磨型４番艦『大井』"],
        ["木曽.jpg","木曽","球磨型５番艦『木曽』"],
        ["","阿賀野型軽巡洋艦","阿賀野型軽巡洋艦"],
        ["","阿賀野","阿賀野型1番艦『阿賀野』"],
        ["","能代","阿賀野型2番艦『能代』"],
        ["","矢矧","阿賀野型3番艦『矢矧』"],
        ["","酒匂","阿賀野型4番艦『酒匂』"],
        ["","妙高型重巡洋艦","妙高型重巡洋艦"],
        ["","妙高","妙高型1番艦『妙高』"],
        ["","那智","妙高型2番艦『那智』"],
        ["","足柄","妙高型3番艦『足柄』"],
        ["","羽黒","妙高型4番艦『』"],
        ["金剛.jpg","金剛","金剛型１番艦『金剛』"],
        ["比叡.jpg","比叡","金剛型２番艦『比叡』"],
        ["榛名.jpg","榛名","金剛型３番艦『榛名』"],
        ["霧島.jpg","霧島","金剛型４番艦『霧島』"],]
    
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
        return kensakuShipArray.count
    }
    
    /// セルに値を設定するデータソースメソッド（必須)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
        
        // セルに値を設定
        cell.setCell(image: kensakuShipArray[indexPath.row].image, titleText: kensakuShipArray[indexPath.row].shipName, descriptionText: kensakuShipArray[indexPath.row].detailName)
        
        return cell
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var index = 0
        
        kensakuShipArray.removeAll()
        
        print(searchBar.text)
        if(searchBar.text == ""){
            kensakuShipArray = shipArray
            
        }else{
            for ship in shipArray{
                print(ship.shipName)
                
                if ship.shipName.contains(searchBar.text!){
                    
                    kensakuShipArray.append(ship)
                    
                    
                }
                
                index += 1
            }
            
            print(kensakuShipArray)
        }
        
        table?.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = kensakuShipArray[indexPath.row].image
        if selectedImage != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            cellNum = indexPath.row
            
            performSegue(withIdentifier: "toSubViewController",sender: nil)
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toSubViewController") {
            let subVC: SubViewController = (segue.destination as? SubViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.selectedImg = selectedImage
            subVC.nameStr = kensakuShipArray[cellNum].detailName
            
            
            subVC.contentText = kensakuShipArray[cellNum].content
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
                         
                         "阿賀野型軽巡洋艦","阿賀野型1番艦『阿賀野』","阿賀野型2番艦『能代』","阿賀野型3番艦『矢矧』","阿賀野型4番艦『酒匂』",
                         
                         "妙高型重巡洋艦", "妙高型1番艦『妙高』","妙高型2番艦『那智』","妙高型3番艦『足柄』","妙高型4番艦『羽黒』",
                         
                         "金剛型巡洋戦艦",
                         "金剛","比叡","榛名","霧島"]
        
       kensakuShipArray = shipArray
        print(shipImageArray.count)
        print(shipNameArray.count)
        print(detailNameArray.count)
        print(contentArray.count)
        
        
        for i in 0 ... 48 {
            print(i)
           
            shipArray.append(Ship(image : shipImageArray[i],shipName : shipNameArray[i],detailName : detailNameArray[i],content : contentArray[i]))
            
        }
        print(shipArray)
        kensakuShipArray = shipArray
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

