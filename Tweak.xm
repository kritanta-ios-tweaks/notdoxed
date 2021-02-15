@import Foundation;
@import UIKit;
#include <os/log.h>
#include <libgen.h>
#include <string.h>

#include <dlfcn.h>

#include <objc/runtime.h>
#include <crt_externs.h>
#define kProcessName (*(char ***)_NSGetArgv())[0]

@interface City : NSObject 
-(BOOL)isLocalWeatherCity;
@end

%hook City

-(NSString *)name
{
    //if ( strstr(kProcessName, "WeatherWidget") != NULL )
        return @"Weather"; 

    return %orig;
}

%end

%hook PSUIAppleAccountCell
- (UILabel *)textLabel
{
    UILabel *o = %orig;
    [o setText:@"Name"];
    return o;
}
%end
