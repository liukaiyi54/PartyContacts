//
//  Macros.h
//  PartyContacts
//
//  Created by Michael on 10/07/2017.
//  Copyright © 2017 Michael. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#ifndef SCREEN_WIDTH
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#endif

#ifndef SCREEN_HEIGHT
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#endif

#ifndef IOS_VERSION
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#endif

#ifndef kAppVersion
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#endif

#ifndef UIColorFromRGB
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((CGFloat)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((CGFloat)(rgbValue & 0x0000FF))/255.0 \
alpha:1.0]
#endif

#ifndef UIColorFromRGBA
#define UIColorFromRGBA(rgbValue, alphaValue) \
[UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((CGFloat)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((CGFloat)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]
#endif

#endif /* Macros_h */