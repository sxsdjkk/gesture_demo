

#import "PlatformViewTestPlugin.h"
#import <AVFoundation/AVFoundation.h>

#if !__has_feature(objc_arc)
#error Code Requires ARC.
#endif


@interface PlatformViewTestPlugin ()
@property(readonly, weak, nonatomic) NSObject<FlutterTextureRegistry>* registry;
@property(readonly, weak, nonatomic) NSObject<FlutterBinaryMessenger>* messenger;
@property(readonly, strong, nonatomic) NSObject<FlutterPluginRegistrar>* registrar;
@end

@implementation PlatformViewTestPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    PlatformViewTestPlugin* instance = [[PlatformViewTestPlugin alloc] initWithRegistrar:registrar];
    [registrar publish:instance];
    [registrar registerViewFactory:[[PlatformViewPluginFactory alloc] initWithRegistrar:registrar] withId:@"platform_view_test"];
    
}

- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    self = [super init];
    NSAssert(self, @"super init cannot be nil");
    _registry = [registrar textures];
    _messenger = [registrar messenger];
    _registrar = registrar;    
    return self;
}

@end

@implementation PlatformViewPluginFactory

- (instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    
    self = [super init];
    if (self) {
        _registrar = registrar;
    }
    return self;
}

- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args {
    return [[PlatformViewController alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args registrar:_registrar];
}

-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

@end


@interface PlatformViewController () <FlutterPlugin>

@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) int64_t viewId;
@property (nonatomic, copy) NSDictionary *args;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) FlutterMethodChannel *methodChannel;
@property (nonatomic, strong) FlutterEventChannel *eventChannel;

@end

@implementation PlatformViewController

- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                        registrar:(id<FlutterPluginRegistrar>)registrar {
    
    self = [super init];
    if (self) {
        _frame = frame;
        _viewId = viewId;
        _args = args;
        
        _view = [[UIView alloc] init];
        _view.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {}

- (nonnull UIView *)view {
    return _view;
}

- (void)dealloc {}

@end
