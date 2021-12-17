//
//  Fukuwarai.swift
//  goodbyeSleepTwice
//
//  Created by 入船 on 2021/12/17.
//

import UIKit

class Fukuwarai: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    let BnSdf = ButtonSound()
    
    
    @IBOutlet weak var eyelBt: UIButton!
    @IBOutlet weak var eyerBt: UIButton!
    @IBOutlet weak var noseBt: UIButton!
    @IBOutlet weak var mouthBt: UIButton!
    @IBOutlet weak var faceBt: UIButton!
    @IBOutlet weak var FstartBt: UIButton!
    @IBOutlet weak var label: UILabel!    //
    let myImagePicker = UIImagePickerController()
    /*
     let myImagePickerNose = UIImagePickerController()
     */
    //目鼻口どのぼたんが押されたか識別
    var facePartsID=0
    
    //使用者から見て左目
    @IBOutlet weak var myImage: UIImageView!
    //右目
    
    @IBOutlet weak var myImageRightEye: UIImageView!
    //鼻
    
    @IBOutlet weak var myNose: UIImageView!
    //口
    
    @IBOutlet weak var myMouth: UIImageView!
    //顔面
    
    @IBOutlet weak var myImageFace: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myImage.frame = CGRect(x: 120, y: 270, width: 65, height: 73)
        myImageRightEye.frame = CGRect(x: 215, y: 270, width: 65, height: 73)
        myNose.frame = CGRect(x: 152, y: 283, width: 86, height: 107)
        myMouth.frame = CGRect(x: 140, y: 352, width: 117, height: 84)
        
    }
    //左眼ボタン
    
    @IBAction func photoPick(_ sender: Any) {
        eyelBt.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: .touchUpInside)
        BnSdf.buttonSound()
        myImagePicker.delegate = self
        myImagePicker.sourceType = .photoLibrary
        present(myImagePicker, animated: true)
        facePartsID=1
        
    }
    //右目ボタン（右目だけどleftって書いちゃった）
    
    @IBAction func photoLeftEye(_ sender: Any) {
        eyerBt.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: .touchUpInside)
        BnSdf.buttonSound()
        myImagePicker.delegate = self
        myImagePicker.sourceType = .photoLibrary
        present(myImagePicker, animated: true)
        facePartsID=2
    }
    //鼻ぼたん
    
    @IBAction func photoNose(_ sender: Any) {
        noseBt.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: .touchUpInside)
        BnSdf.buttonSound()
        myImagePicker.delegate = self
        myImagePicker.sourceType = .photoLibrary
        present(myImagePicker, animated: true)
        facePartsID=3
    }
    
    //口ボタn
    
    @IBAction func photoMouth(_ sender: Any) {
        mouthBt.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: .touchUpInside)
        BnSdf.buttonSound()
        myImagePicker.delegate = self
        myImagePicker.sourceType = .photoLibrary
        present(myImagePicker, animated: true)
        facePartsID=4
    }
    //顔面ボタン
    
    @IBAction func photoFace(_ sender: Any) {
        faceBt.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: .touchUpInside)
        BnSdf.buttonSound()
        myImagePicker.delegate = self
        myImagePicker.sourceType = .photoLibrary
        present(myImagePicker, animated: true)
        facePartsID=5
    }
    
        //福笑いの機能
    
    @IBAction func hukuwarai(_ sender: Any) {
        let randomuLeX = Int.random(in: -10...10)
        let randomuReX = Int.random(in: -10...10)
        let randomuNX = Int.random(in: -10...10)
        let randomuMX = Int.random(in: -10...10)

        let randomuLeY = Int.random(in: -10...10)
        let randomuReY = Int.random(in: -10...10)
        let randomuNY = Int.random(in: -10...10)
        let randomuMY = Int.random(in: -10...10)
        
        myImage.frame = CGRect(x: 120+randomuLeX, y: 270+randomuLeY, width: 65, height: 73)
        myImageRightEye.frame = CGRect(x: 215+randomuReX, y: 270+randomuReY, width: 65, height: 73)
        myNose.frame = CGRect(x: 152+randomuNX, y: 283+randomuNY, width: 86, height: 107)
        myMouth.frame = CGRect(x: 140+randomuMX, y: 352+randomuMY, width: 117, height: 84)
        
        FstartBt.addTarget(self, action: #selector(self.buttonTapped(sender:)), for: .touchUpInside)
        
        BnSdf.buttonSound()
        /*
        let myImage2 = myImage.image
        let myImageRightEye2 = myImageRightEye.image
        let myNose2 = myNose.image
        let myMouth2 = myMouth.image
        let myImageFace2 = myImageFace.image
        
        var faceRandomID = [0,1,2,3,4,5,6,7,8,9,10,11,12,13]
        faceRandomID.shuffle()
        print(faceRandomID)
        
        //ここからゴリ押ししたため非常に長い
        //顔のパーツランダムパターン
        switch faceRandomID[0] {
        case 0:
            myImage.image = myImage2
            myImageRightEye.image = myNose2
            myNose.image = myImageRightEye2
            myMouth.image = myMouth2
            
        case 1:
            myImage.image = myImage2
            myImageRightEye.image = myNose2
            myNose.image = myImageRightEye2
            myMouth.image = myImageRightEye2
            
            
        case 2:
            myImage.image = myImage2
            myImageRightEye.image = myMouth2
            myNose.image = myImageRightEye2
            myMouth.image = myNose2
            
        case 3:
            myImage.image = myImage2
            myImageRightEye.image = myMouth2
            myNose.image = myNose2
            myMouth.image = myImageRightEye2
            
        case 4:
            myImage.image = myImageRightEye2
            myImageRightEye.image = myImage2
            myNose.image = myMouth2
            myMouth.image = myNose2
            
        case 5:
            myImage.image = myImageRightEye2
            myImageRightEye.image = myImage2
            myNose.image = myMouth2
            myMouth.image = myNose2
            
        case 6:
            myImage.image = myImageRightEye2
            myImageRightEye.image = myMouth2
            myNose.image = myImage2
            myMouth.image = myNose2
            
        case 7:
            myImage.image = myImageRightEye2
            myImageRightEye.image = myMouth2
            myNose.image = myNose2
            myMouth.image = myImage2
            
        case 8:
            myImage.image = myNose2
            myImageRightEye.image = myImage2
            myNose.image = myMouth2
            myMouth.image = myImageRightEye2
            
        case 9:
            myImage.image = myNose2
            myImageRightEye.image = myImageRightEye2
            myNose.image = myImage2
            myMouth.image = myMouth2
            
        case 10:
            myImage.image = myNose2
            myImageRightEye.image = myImageRightEye2
            myNose.image = myMouth2
            myMouth.image = myImage2
        case 11:
            myImage.image = myNose2
            myImageRightEye.image = myMouth2
            myNose.image = myImage2
            myMouth.image = myImageRightEye2
            
        case 12:
            myImage.image = myMouth2
            myImageRightEye.image = myImage2
            myNose.image = myNose2
            myMouth.image = myImageRightEye2
            
        case 13:
            myImageRightEye.image = myNose2
            myImage.image = myMouth2
            myNose.image = myImage2
            myMouth.image = myImageRightEye2
            
        default:
            break
        }
         */
         
         }
    
    
    
    
    //カメラロールが呼ばれた時勝手に起動
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info:
                               [UIImagePickerController.InfoKey : Any]
    ) {
        if let image = info[.originalImage] as? UIImage {
            switch facePartsID {
                //何のボタンが押されたか判別して画像をどこに配置するか決める
            case 1:
                myImage.image = image
            case 2:
                myImageRightEye.image = image
            case 3:
                myNose.image = image
            case 4:
                myMouth.image=image
            case 5:
                myImageFace.image=image
            default:
                break
            }
            
        } else {
            print("Error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }    /*
          override func viewDidLoad(){
          super.viewDidLoad()
          myImagePicker.delegate = self
          myImagePicker.sourceType = .photoLibrary
          }
          */
    @objc func buttonTapped(sender:UIButton) {
            animateView(sender)
        }

    func animateView(_ viewToAnimate:UIView) {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1.08, y: 1.08)
            }) { (_) in
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                    viewToAnimate.transform = .identity
                    
                }, completion: nil)
            }
        }
}

