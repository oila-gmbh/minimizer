#import "MinimizerPlugin.h"

@implementation MinimizerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"minimizer"
            binaryMessenger:[registrar messenger]];
  MinimizerPlugin* instance = [[MinimizerPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"toPreviousApp" isEqualToString:call.method]) {
    toPreviousApp();
//     result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

void toPreviousApp() {
  Ivar sysNavIvar = class_getInstanceVariable(UIApplication.class, "_systemNavigationAction");
  UIApplication* app = UIApplication.sharedApplication;
  UISystemNavigationAction* action = object_getIvar(app, sysNavIvar);
  if (!action) {
      return;
  }
  NSUInteger destination = action.destinations.firstObject.unsignedIntegerValue;
  [action sendResponseForDestination:destination];
  return;
}

@end
