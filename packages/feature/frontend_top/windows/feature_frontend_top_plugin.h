#ifndef FLUTTER_PLUGIN_FEATURE_FRONTEND_TOP_PLUGIN_H_
#define FLUTTER_PLUGIN_FEATURE_FRONTEND_TOP_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace feature_frontend_top {

class FeatureFrontendTopPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FeatureFrontendTopPlugin();

  virtual ~FeatureFrontendTopPlugin();

  // Disallow copy and assign.
  FeatureFrontendTopPlugin(const FeatureFrontendTopPlugin&) = delete;
  FeatureFrontendTopPlugin& operator=(const FeatureFrontendTopPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace feature_frontend_top

#endif  // FLUTTER_PLUGIN_FEATURE_FRONTEND_TOP_PLUGIN_H_
