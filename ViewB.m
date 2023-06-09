#import "ViewB.h"

@implementation ViewB

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        
        // Create the wrapper view
        CGFloat wrapperWidth = 200;
        CGFloat wrapperHeight = 100;
        CGFloat wrapperX = (frameRect.size.width - wrapperWidth) / 2;
        CGFloat wrapperY = (frameRect.size.height - wrapperHeight) / 2;
        NSView *wrapperView = [[NSView alloc] initWithFrame:NSMakeRect(wrapperX, wrapperY, wrapperWidth, wrapperHeight)];
        
        // Add a label to the wrapper view
        NSTextField *label = [[NSTextField alloc] initWithFrame:NSMakeRect(0, wrapperHeight - 30, wrapperWidth, 30)];
        [label setStringValue:@"View B"];
        [label setBezeled:NO];
        [label setDrawsBackground:NO];
        [label setEditable:NO];
        [label setSelectable:NO];
        [label setAlignment:NSTextAlignmentCenter]; // Text alignment within the label
        [wrapperView addSubview:label];

        // Add a button to the wrapper view
        NSButton *button = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, wrapperWidth, 30)];
        [button setTitle:@"Go to view A"];
        [button setButtonType:NSButtonTypeMomentaryPushIn];
        [button setTarget:self];
        [button setAction:@selector(buttonClicked:)];
        [wrapperView addSubview:button];

        [self addSubview:wrapperView];
    }
    return self;
}

- (void)buttonClicked:(id)sender {
  if (self.onButtonClicked) {
      self.onButtonClicked();
  }
}

@end
