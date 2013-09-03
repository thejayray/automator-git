//
//  git_commit.h
//

#import <Cocoa/Cocoa.h>
#import <Automator/AMBundleAction.h>

@interface git_commit : AMBundleAction 
{}

- (id)runWithInput:(id)input fromAction:(AMAction *)anAction error:(NSDictionary **)errorInfo;

@end
