//
//  GCYDevice.m
//  GCYProjectDemo
//
//  Created by gaochongyang on 2018/1/26.
//  Copyright © 2018年 TonyYang. All rights reserved.
//

#import "GCYDevice.h"
#import <CoreTelephony/CoreTelephonyDefines.h>
#include <CoreFoundation/CoreFoundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <UIKit/UIKit.h>
#import<CoreTelephony/CTCarrier.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation GCYDevice
/// @brief 获取连接方式

+ (NSString *)getConfiguration{
    
    // 状态栏是由当前app控制的，首先获取当前app
    
    UIApplication *app = [UIApplication sharedApplication];
    
    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    
    int type = 0;
    
    for (id child in children) {
        
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
            
        }
        
    }
    
    
    
    switch (type) {
            
        case 0:return @"无网络";break;
            
        case 1:return @"2G";break;
            
        case 2:return @"3G";break;
            
        case 3:return @"4G";break;
            
        case 5:return @"WIFI";break;
            
            
            
        default:return @"无网络";
            
            break;
            
    }
    
}
/// @brief 获取运营商信息 可能会被封杀

+ (NSString *)getCarrier {
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    return [NSString stringWithFormat:@"%@",[carrier carrierName]];
    
}


/// @brief 获取当前wifi名称

+ (NSString *)getSSID {
    
    NSString *ssid = nil;
    
    NSArray *ifs = (__bridge   id)CNCopySupportedInterfaces();
    
    for (NSString *ifname in ifs) {
        
        NSDictionary *info = (__bridge id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifname);
        
        if (info[@"SSID"])
            
        {
            
            ssid = info[@"SSID"];
            
        }
        
    }
    
    return ssid;
    
}


/// @brief 获取bssid

+ (NSString *)getbSSID {
    
    NSString *bssid = nil;
    
    NSArray *ifs = (__bridge   id)CNCopySupportedInterfaces();
    
    for (NSString *ifname in ifs) {
        
        NSDictionary *info = (__bridge id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifname);
        
        if (info[@"BSSID"])
            
        {
            
            bssid = info[@"BSSID"];
            
        }
        
    }
    
    return bssid;
    
}



//获取ip地址

//+ (NSString *)getIpAddresses{
//
//    NSString *address = @"error";
//
//    struct ifaddrs *interfaces = NULL;
//
//    struct ifaddrs *temp_addr = NULL;
//
//    int success = 0;
//
//    // retrieve the current interfaces - returns 0 on success
//
//    success = getifaddrs(&interfaces);
//
//    if (success == 0)
//
//    {
//
//        // Loop through linked list of interfaces
//
//        temp_addr = interfaces;
//
//        while(temp_addr != NULL)
//
//        {
//
//            if(temp_addr->ifa_addr->sa_family == AF_INET)
//
//            {
//
//                // Check if interface is en0 which is the wifi connection on the iPhone
//
//                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"])
//
//                {
//
//                    // Get NSString from C String
//
//                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
//
//                }
//
//            }
//
//            temp_addr = temp_addr->ifa_next;
//
//        }
//
//    }
//
//    // Free memory
//
//    freeifaddrs(interfaces);
//
//    return address;
//
//}

@end
