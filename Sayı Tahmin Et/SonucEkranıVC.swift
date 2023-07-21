//
//  SonucEkranıVC.swift
//  Sayı Tahmin Et
//
//  Created by Yaşar Duman on 21.07.2023.
//

import UIKit

class SonucEkran_VC: UIViewController {

    @IBOutlet weak var imageViewSonuc: UIImageView!
    
    @IBOutlet weak var labelSonuc: UILabel!
    
    var sonuc:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Geri buttonunu Gizleme
        self.navigationItem.hidesBackButton = true
        print(sonuc!)
        
        if sonuc! { //true ise
            labelSonuc.text = "Kazandınız"
            imageViewSonuc.image = UIImage(named: "mutlu_resim")
        }else{ //false ise
            labelSonuc.text = "Kaybettiniz"
            imageViewSonuc.image = UIImage(named: "uzgun_resim")
        }
    }
    

    @IBAction func tekrarOyna(_ sender: Any) {
        //Başlangıç ekranına Dönme
        navigationController?.popToRootViewController(animated: true)
    }
    

}
