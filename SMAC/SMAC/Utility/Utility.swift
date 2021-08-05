//
//  Utility.swift
//  SMAC
//
//  Created by MAC on 20/07/21.
//

import Foundation
import UIKit
import MBProgressHUD
import SystemConfiguration
import MaterialComponents.MaterialSnackbar
import CoreLocation
import CoreTelephony

@objc public class Utility : NSObject {
    static func setViewCornerRadius(_ view: UIView, _ radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.clipsToBounds = false
    }
    
    static func createCircularView(_ view: UIView) {
        view.layer.cornerRadius = view.frame.size.width/2
        view.clipsToBounds = true
    }
    
    static func addAllSidesShadowOnView(_ view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 2.0
        view.layer.shadowOpacity = 0.5
        view.layer.masksToBounds = false
    }
    static func AllSidesShadowOnView(_ view: UIView) {
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 5.0
        view.layer.shadowOpacity = 0.5
        view.layer.masksToBounds = false
    }
    
    static func addBottomSidesShadowOnView(_ view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0 , height: 1)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 0.0
        view.layer.masksToBounds = false
    }
    
    
    @objc public class func getGmtTime() -> String {
         let now = Date()
         let formatter = DateFormatter()
         formatter.timeZone = TimeZone.current
         formatter.dateFormat = "dd MMM yyyy HH:MM:SS"
         let dateString = formatter.string(from: now)
         let gmtTime = dateString + " GMT"
         return gmtTime
     }
    
    @objc public class func getRefID() -> String {
          let id = Date().inDigits
          let refId = String(describing: id)
          return refId
      }
    
    
    class func getIP() -> String {
        var ip = ""
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next } // memory has been renamed to pointee in swift 3 so changed memory to pointee
                let interface = ptr?.pointee
                let addrFamily = interface?.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    let name = String(cString: (interface?.ifa_name)!)
                    if name == "en0" {
                        // String.fromCString() is deprecated in Swift 3. So use the following code inorder to get the exact IP Address.
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                        ip = String(cString: hostname)
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        return ip
    }
    
    class func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
}
