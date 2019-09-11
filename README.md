# Pharo Code Tokenizer

[![Build Status](https://travis-ci.org/olekscode/PharoCodeTokenizer.svg?branch=master)](https://travis-ci.org/olekscode/PharoCodeTokenizer)
[![Build status](https://ci.appveyor.com/api/projects/status/2rt11b48vfh7fsbw?svg=true)](https://ci.appveyor.com/project/olekscode/pharocodetokenizer)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/PharoCodeTokenizer/badge.svg?branch=master)](https://coveralls.io/github/olekscode/PharoCodeTokenizer?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/PharoCodeTokenizer/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

A tool for tokenizing Pharo source code by visiting the leaves of AST

## Installation
To install `PharoCodeTokenizer`, go to the Playground (`Ctrl+OW`) in your Pharo image and execute the following Metacello script (select it and press Do-it button or `Ctrl+D`):

```smalltalk
Metacello new
  baseline: 'PharoCodeTokenizer';
  repository: 'github://olekscode/PharoCodeTokenizer/src';
  load.
```
