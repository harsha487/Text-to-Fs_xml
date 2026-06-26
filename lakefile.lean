import Lake
open Lake DSL

package «Text-to-Fs_xml» where
  version := v!"0.1.0"

lean_lib TextToFsXml where
  roots := #[`TextToFsXml]

@[default_target]
lean_exe «text-to-fs-xml» where
  root := `Main
