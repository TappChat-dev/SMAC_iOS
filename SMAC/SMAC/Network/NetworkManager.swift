//
//  NetworkManager.swift
//  SMAC
//
//  Created by MAC on 05/08/21.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON
import AVFoundation
import SVProgressHUD

 protocol NetworkManagerDelegate : class {
    func callBackGetDictionary(dicUrlPath:NSDictionary)
//    func callBackGetUploadProgress(dicUrlPath:NSDictionary)
    
}

struct BaseUrl {
    private struct Domains {
        
        static let Base_Url = "https://icg.net.in/" //for Product
        static let Base_UrlIP = "http://112.133.213.8:8080/"
        
    }
    
    private  struct Routes {
        static let Api = "icgRestful/api/"            // Production url
        static let ApiZero = "icgRestful/api/"            // Production url
        static let ApiDevelopment = "icgRestful_development/api/"            // development url
        static let ApiWithIP = "icgRestful_pro/api/"            //  url With IP
    }
    

    
    private  static let Domain = Domains.Base_Url
    private  static let Route = Routes.Api
    private  static let BaseURL = Domain + Route
    
    private  static let RouteZero = Routes.ApiZero
    private  static let BaseURLZero = Domain + RouteZero
    private  static let RouteDev = Routes.ApiDevelopment
    private  static let BaseURLDev = Domain + RouteDev
    // For IP
    private  static let RouteWithIPRoute = Routes.ApiWithIP
    private  static let BaseURLIPDomain = Domains.Base_UrlIP
    private  static let BaseURLIP = BaseURLIPDomain + RouteWithIPRoute
    static var baseURL: String {
        return BaseURL
    }
    static var baseURLZero: String {
        return BaseURLZero
    }
    static var baseURLDev: String {
        return BaseURLDev
    }
    static var baseURLWithIP: String {
        return BaseURLIP
    }
}

class NetworkManager: NSObject {
     var delegate : NetworkManagerDelegate?
    
    func getBaseUrl() -> String{
        return BaseUrl.baseURL
    }
    
     public func getBaseUrlDevlopment() -> String{
        return BaseUrl.baseURLDev
    }
    
     public func getBaseUrlWithIP() -> String{
        return BaseUrl.baseURLWithIP
    }
    
    func createLocalUrl(forImageNamed name: String) -> URL? {

            let fileManager = FileManager.default
            let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            let url = cacheDirectory.appendingPathComponent("\(name).png")

            guard fileManager.fileExists(atPath: url.path) else {
                guard
                    let image = UIImage(named: name),
                    let data = image.pngData()
                else { return nil }

                fileManager.createFile(atPath: url.path, contents: data, attributes: nil)
                return url
            }

            return url
        }
    
    
    // MARK:- Api Get
class func apiGet(serviceName:String,parameters: [String:Any]?, completionHandler: @escaping (_ result : [Dictionary<String, Any>]?, _ error : Error?) -> ()) -> Void {

        
        AF.request(serviceName, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { response in
            
            switch(response.result) {
            case .success(_):


                print("Response For Request URL in network manager - " + serviceName)
                if let data = response.data {
                    do {
                        let  dictonary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String:Any]]
                        let  dictonaryArray = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                        if let dataDictionary = dictonary {
                            print(dataDictionary)
                            if dataDictionary.count > 0 {
                                completionHandler(dataDictionary, nil)
                            }
                            
                        }
                    } catch let error as NSError {
                        print(error)
                    }
                
                }
                break
                
            case .failure(_ ):
                if response.response?.statusCode == 401 {
//                    completionHandler(nil,"Request timed out.")
                    SVProgressHUD.showInfo(withStatus: "Request timed out.")
                }else{
                completionHandler(nil,response.error)
                }
                break
                
            }
        }
    }
    
    //MARK:- APi POST LOGIN
 public func apiPostLogin(serviceName:String,  parameters:[String:Any], completionHandler: @escaping (_ result : Dictionary<String, Any>?, _ error : Error?) -> ()){
           
           var request = URLRequest(url: URL(string: serviceName)!)
           request.httpMethod = HTTPMethod.post.rawValue
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           let jsonData = try! JSONSerialization.data(withJSONObject: parameters, options: [.prettyPrinted])
           request.httpBody = jsonData
           
           AF.request(request).responseData { (response) in
               print(response)
               switch(response.result) {
               case .success(_):
                   print("Service url of Make call - " + serviceName)
                   if let data = response.data {
                       do {
                           let  dictonary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any]
                           if let dataDictionary = dictonary {
                               print(dataDictionary)
                               completionHandler(dataDictionary, nil)
                           }
                       } catch let error as NSError {
                           print(error)
                        let  dictonaryDicError : [String:Any]? = ["message":"Server error","status":0]
                        completionHandler(dictonaryDicError,nil)
                       }
                   }
                   break
               case .failure(_):
                   completionHandler(nil,response.error)
                   break
               }
           }
       }
}
