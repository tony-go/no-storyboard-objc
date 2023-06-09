#import <Cocoa/Cocoa.h>

@interface ViewA : NSView
@property (nonatomic, copy) void (^onButtonClicked)(void);
@end
