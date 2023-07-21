//
//  TahminEkraniVC.swift
//  Sayı Tahmin Et
//
//  Created by Yaşar Duman on 21.07.2023.
//

import UIKit

class TahminEkraniVC: UIViewController {

    @IBOutlet weak var labelKalanHak: UILabel!
    @IBOutlet weak var labelYardim: UILabel!
    @IBOutlet weak var textfieldGirdi: UITextField!
    
    var rasgeleSayi:Int?
    var kalanHak = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rasgeleSayi = Int.random(in: 0...100) //0 - 100 arası sayı üretecektir
        
        print("Rasgele Sayı :\(rasgeleSayi!)")
    }
    
    //geçişi dinleme metodu
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let GelenVeri = sender as? Bool {
            //Verinin ulaşacagı VievController alınır
            let gidilecekVC = segue.destination as! SonucEkran_VC
            //Verinin ulaşacagı Sınıftaki sonuc değişkenine erişilir
            gidilecekVC.sonuc = GelenVeri
            
        }
    }

    @IBAction func tahminet(_ sender: Any) {
        labelYardim.isHidden = false
        kalanHak -= 1  // her tahminde bir azalacak
        
        if let veri = textfieldGirdi.text { //Textfield üzerinden veri kontrol edilerek alınır
            
            if let tahmin = Int(veri){ // String ifadeyi kontrol ederek int ifadeye dönüştürdük
                
                if kalanHak != 0 {
                    
                    if tahmin == rasgeleSayi! {
                        //Doğru bildin
                        //Sayfa Geçişi
                        
                //tahminToSonuc id li segue'yu Çalıştırır ve sender ile bilgi gönderir
                        let sonuc = true
                        performSegue(withIdentifier: "tahminToSonuc", sender: sonuc)
                    }
                    if tahmin > rasgeleSayi! {
                        //Azalt
                        labelYardim.text = "Azalt"
                        labelKalanHak.text = "Kalan Hak : \(kalanHak)"

                    }
                    if tahmin < rasgeleSayi! {
                        //Artır
                        labelYardim.text = "Artır"
                        labelKalanHak.text = "Kalan Hak : \(kalanHak)"
                    }
                    
                }else{
                    //Haklar Bitince Sayfa Geçişi ve veri transferi
                    let sonuc = false
                    performSegue(withIdentifier: "tahminToSonuc", sender: sonuc)
                }
                textfieldGirdi.text = ""
            }
        }
    }
   

}
