//
//  UISourceSwitch.h
//  ContextDemo
//
//  Created by Felix on 22.01.10.
//  Copyright 2010 Felix Mueller (felixmueller@mac.com). All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UISourceSwitch : UISwitch {
	
	NSString *source;
	
}

@property (nonatomic, retain) NSString *source;

@end
