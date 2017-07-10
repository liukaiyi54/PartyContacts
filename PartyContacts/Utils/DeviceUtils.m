//
//  DeviceUtils.m
//  PartyContacts
//
//  Created by Michael on 10/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#import "DeviceUtils.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

#import <sys/socket.h>
#import <sys/sysctl.h>
#import <net/if.h>
#import <net/if_dl.h>

#import <AdSupport/AdSupport.h>
#import <UIKit/UIKit.h>

#import <UIDevice-Hardware/UIDevice-Hardware.h>

@implementation DeviceUtils

+ (NSString *)macString {
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *macString = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return macString;
}

+ (NSString *)idfaString {
    NSBundle *adSupportBundle = [NSBundle bundleWithPath:@"/System/Library/Frameworks/AdSupport.framework"];
    [adSupportBundle load];
    
    if (!adSupportBundle) {
        return @"";
    }
    Class asIdentifierMClass = NSClassFromString(@"ASIdentifierManager");
    if(!asIdentifierMClass){
        return @"";
    }
    
    ASIdentifierManager *asIM = [[asIdentifierMClass alloc] init];
    if (!asIM) {
        return @"";
    }
    
    if(asIM.advertisingTrackingEnabled){
        return [asIM.advertisingIdentifier UUIDString];
    } else{
        return [asIM.advertisingIdentifier UUIDString];
    }
}

+ (NSString *)idfvString {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        return [[UIDevice currentDevice].identifierForVendor UUIDString];
    }
    return @"";
}

+ (BOOL)hasCellularCoverage {
    CTTelephonyNetworkInfo *networkInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [networkInfo subscriberCellularProvider];
    
    if (!carrier.isoCountryCode) {
        return NO;
    }
    return YES;
}

+ (NSString *)userAgent {
    UIDevice *device = [UIDevice currentDevice];
    return [NSString stringWithFormat:@"%@, iOS %@, PartyContacts %@", device.modelName, device.systemVersion, kAppVersion];
}

+ (NSString *)modelName {
    UIDevice *device = [UIDevice currentDevice];
    return device.modelName;
}


@end
