import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'base_dialog_plugin_method_channel.dart';

abstract class BaseDialogPluginPlatform extends PlatformInterface {
  /// Constructs a BaseDialogPluginPlatform.
  BaseDialogPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static BaseDialogPluginPlatform _instance = MethodChannelBaseDialogPlugin();

  /// The default instance of [BaseDialogPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelBaseDialogPlugin].
  static BaseDialogPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BaseDialogPluginPlatform] when
  /// they register themselves.
  static set instance(BaseDialogPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
