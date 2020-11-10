

#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlatformViewTestPlugin : NSObject <FlutterPlugin>

@end

@interface PlatformViewPluginFactory : NSObject <FlutterPlatformViewFactory>

@property(nonatomic, assign) NSObject<FlutterPluginRegistrar> *registrar;

- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar;;


@end

@interface PlatformViewController : NSObject <FlutterPlatformView>

- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                        registrar:(id<FlutterPluginRegistrar>)registrar;

NS_ASSUME_NONNULL_END

@end
