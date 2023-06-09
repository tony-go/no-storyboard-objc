#import <Cocoa/Cocoa.h>

#import "WindowController.h"
#import "ViewA.h"

// AppDelegate interface and implementation
@interface AppDelegate : NSObject <NSApplicationDelegate> {
  WindowController *windowController;
}
@end

@implementation AppDelegate
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  [self setupMainMenu];
  
  windowController = [[WindowController alloc] init];
  [windowController showWindow:self];

}

- (void)setupMainMenu {
  // Create main menu
  NSMenu *mainMenu = [[NSMenu alloc] init];
  
  // Create app menu and add "Quit" item
  NSMenuItem *appMenuItem = [[NSMenuItem alloc] init];
  NSMenu *appMenu = [[NSMenu alloc] init];
  NSMenuItem *quitItem = [[NSMenuItem alloc] initWithTitle:@"Quit" action:@selector(terminate:) keyEquivalent:@"q"];
  [quitItem setKeyEquivalentModifierMask:NSEventModifierFlagCommand];
  [appMenu addItem:quitItem];
  [appMenuItem setSubmenu:appMenu];
  
  // Add app menu to main menu
  [mainMenu addItem:appMenuItem];
  
  // Set main menu
  [NSApp setMainMenu:mainMenu];
}

@end

// Main function (runs the application)
int main(int argc, const char * argv[]) {
  AppDelegate *delegate = [[AppDelegate alloc] init];
  [NSApplication sharedApplication].delegate = delegate;
  return NSApplicationMain(argc, argv);
}

