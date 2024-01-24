//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <firexcode/firexcode_plugin.h>
#include <image_editor_pro/image_editor_pro_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FirexcodePluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FirexcodePlugin"));
  ImageEditorProPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ImageEditorProPlugin"));
}
