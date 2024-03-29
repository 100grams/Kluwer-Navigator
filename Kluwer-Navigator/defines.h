//
//  defines.h
//  Kluwer-Navigator
//
//  Created by Rotem Rubnov on 12/3/2012.
//  Copyright (c) 2012 100 grams. All rights reserved.
//

#ifndef Kluwer_Navigator_defines_h
#define Kluwer_Navigator_defines_h


// URLs
#define kCreatieUrl @"http://promoapp.kluwer.nl/web/guest/home?p_p_id=56_INSTANCE_7ve4uluk0ryW&p_p_state=exclusive"
//#define kCreatieUrl @"http://www.creatie.nl/creatie/xml/ipad/files.do"
#define kComScoreBasePixelURL @"http://nl.sitestat.com/kluwer/navpromo-app/s?"

//debug 
#define DBG_LEVEL DEBUG_LEVEL_VERBOSE

#define DEBUG_LEVEL_ERROR     0
#define DEBUG_LEVEL_RARE      1
#define DEBUG_LEVEL_SOME      2
#define DEBUG_LEVEL_THREADING 3
#define DEBUG_LEVEL_VERBOSE   5
#define DEBUG_LEVEL_PERFORMANCE 4
#define DEBUG_LEVEL_UI      6

#ifdef DEBUG
#define DLog(level, str, args...)\
if(level <= DBG_LEVEL) {\
NSLog(str , ## args);\
}
#else
#define DLog(level, str, args...) 
#endif


#endif
