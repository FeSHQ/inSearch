//
//  ISUtils.h
//  inSearch
//
//  Created by Sergey Lyubeznov on 10/07/15.
//  Copyright (c) 2015 Sergey Lyubeznov. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef UTILS
#define UTILS

#define PRODUCTION_BUILD 0
#define LOGS_ENABLED 1

#define mainStoryboard()[UIStoryboard storyboardWithName:@"Main" bundle:nil]

void ISLog(NSString* format, ...);

#endif