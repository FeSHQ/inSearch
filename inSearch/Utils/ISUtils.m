//
//  ISUtils.m
//  inSearch
//
//  Created by Sergey Lyubeznov on 10/07/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import "ISUtils.h"

void ISLog(NSString* format, ...) {
    
#if LOGS_ENABLED
    
    va_list argumentList;
    va_start(argumentList, format);
    
    NSLogv(format, argumentList);
    
#endif
    
}
