# COBOL to Rust Conversion Samples

Real-world COBOL programs automatically converted to Rust using [Easy COBOL Migrator](https://mecanik.dev/en/products/easy-cobol-migrator/).

Every sample in this repository was transpiled from genuine COBOL source code and verified to compile and produce correct output.

## What Is This?

This repository contains before-and-after examples of COBOL-to-Rust conversion. Each sample folder includes:

- The original COBOL source (`.cbl`)
- The transpiled Rust output (`.rs`)
- Expected program output (`expected_output.txt`), where available

These samples demonstrate how Easy COBOL Migrator handles real COBOL constructs - packed decimals, arithmetic overflow, edited numerics, copybook replacement, and more - and produces compilable Rust code.

## Samples

| #   | Sample                                                  | Description                                                                            |
| --- | ------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| 01  | [Hello World](samples/01-hello-world/)                  | Minimal COBOL program transpiled to Rust                                               |
| 02  | [Packed Decimal Arithmetic](samples/02-packed-decimal/) | COMP-3 packed-decimal arithmetic with ROUNDED and GIVING clauses                       |
| 03  | [Arithmetic Overflow](samples/03-arithmetic-overflow/)  | ON SIZE ERROR handling for arithmetic overflow scenarios                               |
| 04  | [Edited Numeric Formats](samples/04-edited-numeric/)    | Edited numeric PIC formats (Z-suppression, floating $, asterisk fill, BLANK WHEN ZERO) |
| 05  | [COPY REPLACING](samples/05-copy-replacing/)            | COPY REPLACING to instantiate copybook templates with different prefixes               |
| 06  | [PERFORM Patterns](samples/06-perform-patterns/)        | MOVE/PERFORM patterns representing function-call-like constructs                       |

## Try It Yourself

Download the free demo of Easy COBOL Migrator and convert your own COBOL programs:

[Download Free Demo](https://mecanik.dev/en/products/easy-cobol-migrator/#download)

Easy COBOL Migrator supports conversion to C++, C#, Python, Rust, Go, and Java.

## Related Repositories

- [COBOL to C++ Conversion Samples](https://github.com/nicomecanik/COBOL-to-Cpp-Conversion-Samples)
- [COBOL to Python Conversion Samples](https://github.com/nicomecanik/COBOL-to-Python-Conversion-Samples)
- [COBOL to Go Conversion Samples](https://github.com/nicomecanik/COBOL-to-Go-Conversion-Samples)
- [COBOL to Java Conversion Samples](https://github.com/nicomecanik/COBOL-to-Java-Conversion-Samples)
- [COBOL to C# Conversion Samples](https://github.com/nicomecanik/COBOL-to-CSharp-Conversion-Samples)

## About Easy COBOL Migrator

[Easy COBOL Migrator](https://mecanik.dev/en/products/easy-cobol-migrator/) is a desktop COBOL transpiler that converts legacy COBOL programs to modern languages. It parses COBOL source code, builds an AST, and generates idiomatic output in your target language - no manual rewriting required.

## License

All code samples in this repository are Copyright (c) 2026 Mecanik Dev. They are provided for viewing and educational purposes only. You may not use the transpiled output code in production, redistribute it, or use it to train AI models. See the [LICENSE](LICENSE) file for full terms.

Easy COBOL Migrator is proprietary software by [Mecanik Dev](https://mecanik.dev/).

## Disclaimer

Easy COBOL Migrator is under active development. The transpiled output shown in these samples reflects the state of the tool at the time of generation. Some code may require minor manual adjustments to compile or run in your specific environment. As the migrator evolves, output quality and language coverage will continue to improve.
