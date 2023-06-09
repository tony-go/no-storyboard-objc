#import <Cocoa/Cocoa.h>

@interface ViewB : NSView
@property (nonatomic, copy) void (^onButtonClicked)(void);
@end
