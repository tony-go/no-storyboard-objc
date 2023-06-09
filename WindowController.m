#import "WindowController.h"
#import "ViewA.h"
#import "ViewB.h"

@implementation WindowController {
  ViewA *_viewA;
  ViewB *_viewB;
}

- (instancetype)init {
  NSWindow *window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, 800, 800)
                                                 styleMask:(NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable | NSWindowStyleMaskMiniaturizable)
                                                   backing:NSBackingStoreBuffered
                                                     defer:NO];

  [window setTitle:@"macOS app without Storyboard"];
  self = [super initWithWindow:window];

  ViewA *viewA = [[ViewA alloc] initWithFrame:[[window contentView] bounds]];
  ViewB *viewB = [[ViewB alloc] initWithFrame:[[window contentView] bounds]];

  viewB.onButtonClicked = ^{
    [self switchView:viewA];
  };
  viewA.onButtonClicked = ^{
    [self switchView:viewB];
  };
  
  [self switchView:viewA];

  return self;
}

- (void)switchView:(NSView *)view {
  NSWindow *window = [self window];
  NSView *contentView = [window contentView];
  [contentView setSubviews:@[view]];
  [window makeFirstResponder:view];
  [window setTitle:[NSString stringWithFormat:@"macOS app without Storyboard - %@", [view class]]];
}

@end
