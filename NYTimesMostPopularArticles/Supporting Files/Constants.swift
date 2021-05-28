//
//  Constants.swift
//  NYTimesMostPopularArticles
//
//  Created by Farhan Khan on 25/05/2021.
//

import Foundation
import UIKit


let networkError = "Please check your internet connection!"
let generalError = "Something went wrong! Please try later."
let articleError = "Something wrong with the Article Details..."

// MARK: - Alert On View
func ShowAlertViewOnTop(msg:String){
    let alert = UIAlertController(title: "NYTimes", message:msg, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { (action) in
    }))
    UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
 }

// MARK: - Getting Formated Date
func getFormatedDate(date: String, currentFormat: String, requiredFormat: String) -> String{
    var formatedDate = ""
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = currentFormat
    dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
    if let dateConverted = dateFormatter.date(from: date){
        dateFormatter.dateFormat = requiredFormat
        formatedDate =  dateFormatter.string(from: dateConverted)
    }else{
        dateFormatter.dateFormat = requiredFormat
        formatedDate =  dateFormatter.string(from: Date())
    }
   return formatedDate

}
