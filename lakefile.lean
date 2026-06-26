import Lake
open Lake DSL

package «Text-to-Fs_xml» where
  version := v!"0.1.0"
  -- add package configuration options here

lean_lib «TextToFsXml» where
  -- add library configuration options here

@[default_target]
lean_exe «text-to-fs-xml» where
  root := `Main
