//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <firexcode/firexcode_plugin.h>
#include <image_editor_pro/image_editor_pro_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) firexcode_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FirexcodePlugin");
  firexcode_plugin_register_with_registrar(firexcode_registrar);
  g_autoptr(FlPluginRegistrar) image_editor_pro_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ImageEditorProPlugin");
  image_editor_pro_plugin_register_with_registrar(image_editor_pro_registrar);
}
