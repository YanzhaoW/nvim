; extends

(import_declaration
  "import" @keyword.import)


(module_declaration
  [
    "module"
    "export"
  ] @keyword.import)

(export_declaration
  "export" @keyword.import)

(global_module_fragment_declaration
  "module" @keyword.import)

(private_module_fragment_declaration
  [
    "module"
    "private"
  ] @keyword.import)

(import_declaration
  name: (module_name) @module)

(module_name) @module
