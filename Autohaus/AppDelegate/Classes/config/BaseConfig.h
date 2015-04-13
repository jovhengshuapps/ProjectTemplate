//
//  BaseConfig.h
//  Autohaus
//
//  Created by IOS Developer on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#ifndef Autohaus_BaseConfig_h
#define Autohaus_BaseConfig_h

#define _CONFIG_BOOL_(ARG, DEFAULT_VALUE)	([[NSUserDefaults standardUserDefaults] objectForKey:ARG] != nil ? [[NSUserDefaults standardUserDefaults] boolForKey:ARG] : DEFAULT_VALUE)

#define _CONFIG_STRING_(ARG, DEFAULT_VALUE)	([[NSUserDefaults standardUserDefaults] objectForKey:ARG] != nil ? [[NSUserDefaults standardUserDefaults] stringForKey:ARG] : DEFAULT_VALUE)

#define _CONFIG_INT_(ARG, DEFAULT_VALUE)	([[NSUserDefaults standardUserDefaults] objectForKey:ARG] != nil ? [[NSUserDefaults standardUserDefaults] integerForKey:ARG] : DEFAULT_VALUE)

#define _CONFIG_DOUBLE_(ARG, DEFAULT_VALUE)	([[NSUserDefaults standardUserDefaults] objectForKey:ARG] != nil ? [[NSUserDefaults standardUserDefaults] doubleForKey:ARG] : DEFAULT_VALUE)



#endif


#ifdef AUTOHAUS
#import <Autohaus/app_headers/Constants.h>
#import <Autohaus/app_headers/WebserviceCallURL.h>
#elif CST
#import <CST_Trading/app_headers/Constants.h>
#import <CST_Trading/app_headers/WebserviceCallURL.h>
#endif
