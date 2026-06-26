# Text-to-FS_XML Converter

A comprehensive Lean-based tool to convert plain text documents into MSRSW FS.XML format (automotive software documentation standard).

## 🎯 Overview

This project provides a complete pipeline for transforming structured plain text input into valid MSRSW FS.XML files. It supports:

- **Multi-language documentation** (English, German, French, Italian)
- **Rich document elements** (paragraphs, images, requirements, sections)
- **Metadata management** (author, date, version, company info)
- **Element updates and modifications**
- **Comprehensive validation** against MSRSW standards
- **XML serialization** with proper formatting

## 📦 Features

✅ Parse structured text input with intuitive syntax  
✅ Generate MSRSW-compliant FS.XML documents  
✅ Support images with captions and references  
✅ Handle requirements tracking with unique IDs  
✅ Manage DSD (Document Structure Definition) IDs  
✅ Update and modify existing XML elements  
✅ Validate document structure and compliance  
✅ Pretty-print formatted XML output  
✅ Comprehensive error handling and reporting  
✅ Full test suite with integration tests  
✅ Complete API documentation  

## 🚀 Quick Start

### Building

```bash
lake build
```

### Running Examples

```bash
lake run -- examples/simple_example.txt output.xml
```

### Running Tests

```bash
lake test
```

## 📝 Input Syntax

### Basic Structure

```
[METADATA]
author: John Doe
date: 2026-06-26
version: 1.0.0
filename: mofbrk_co_fs
languages: en,de,fr,it
company: RB

[SECTION]
name: Brake Signal Acquisition
id: MoFBrk_Co
type: feature

[SUBSECTION]
name: Overview
id: OVERVIEW
type: chapter

[PARAGRAPH]
en: Acquisition of the brake signal for monitoring function.
de: Akquisition des Bremssignals für die Überwachungsfunktion.

[IMAGE]
alt: System Architecture
src: diagrams/system.png
caption: Main System Overview
id: IMG_001

[REQUIREMENT]
id: REQ_001
title: Brake Monitoring
description: The system must monitor brake status.

[DSD_ID]
id: DSD_MAIN_BRAKE
description: Main brake signal processing
```

## 📚 Documentation

- [User Guide](./docs/USER_GUIDE.md) - Complete usage guide
- [Syntax Reference](./docs/SYNTAX_REFERENCE.md) - Input text syntax
- [API Reference](./docs/API_REFERENCE.md) - Lean API documentation
- [MSRSW Format](./docs/MSRSW_FORMAT.md) - MSRSW XML format details

## 🔧 API Overview

### Core Modules

- **XMLElement.lean** - Core XML data structures
- **TextParser.lean** - Parse text input to AST
- **XMLBuilder.lean** - Build MSRSW XML structure
- **FSXmlSerializer.lean** - Serialize to XML string
- **ElementUpdater.lean** - Modify XML elements
- **Validator.lean** - Validate compliance
- **Utils.lean** - Helper functions

### Key Functions

```lean
-- Parse input
parseTextFile(path: String): Except String AST

-- Create document
createMSRSWDocument(meta: DocumentMeta, blocks: List TextBlock): XMLElement

-- Serialize
elementToString(elem: XMLElement): String
writeToFile(path: String, xml: String): IO Unit

-- Validate
validateDocument(elem: XMLElement): List String

-- Update
updateElement(root: XMLElement, path: List String, value: String): XMLElement
```

## 📋 Project Structure

```
Text-to-Fs_xml/
├── src/                    # Source files
│   ├── Main.lean
│   ├── XMLElement.lean
│   ├── TextParser.lean
│   ├── XMLBuilder.lean
│   ├── FSXmlSerializer.lean
│   ├── ElementUpdater.lean
│   ├── Validator.lean
│   └── Utils.lean
├── examples/               # Example files
│   ├── simple_example.txt
│   └── brake_system.txt
├── tests/                  # Test suite
│   ├── ParserTests.lean
│   ├── XMLBuilderTests.lean
│   └── ...
├── docs/                   # Documentation
│   ├── USER_GUIDE.md
│   ├── SYNTAX_REFERENCE.md
│   └── ...
└── lakefile.lean           # Project config
```

## 🔄 Workflow

1. **Parse** - Read and validate plain text input
2. **Build** - Convert to intermediate AST
3. **Generate** - Create MSRSW XML structure
4. **Serialize** - Format and write XML
5. **Validate** - Check compliance and structure

## 🧪 Testing

Run comprehensive test suite:

```bash
lake test
```

Test categories:
- Parser tests
- XML builder tests
- Serializer tests
- Validator tests
- Element updater tests
- Integration tests

## 📖 Example Usage

```lean
def example : IO Unit := do
  -- Parse input
  match ← parseTextFile "input.txt" with
  | .error err => IO.println s!"Error: {err}"
  | .ok ast => do
    -- Build document
    let doc := createMSRSWDocument ast.meta ast.blocks
    
    -- Validate
    let errors := validateDocument doc
    if !errors.isEmpty then
      IO.println "⚠ Validation issues:"
      for error in errors do
        IO.println s!"  - {error}"
    
    -- Write output
    let xml := elementToString doc
    ← writeToFile "output.xml" xml
    IO.println "✓ Document created: output.xml"
```

## 🔗 Related Resources

- [MSRSW DTD Documentation](https://www.asam.net/)
- [Lean Documentation](https://lean-lang.org/)
- [XML Standards](https://www.w3.org/XML/)

## 📄 License

[Add appropriate license]

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

## 📧 Contact

For questions and feedback, please open an issue on GitHub.

---

**Status**: Under Development  
**Last Updated**: 2026-06-26  
**Version**: 0.1.0
