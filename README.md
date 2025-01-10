# Polish Typography Widow Filter

A Lua script for XeLaTeX that prevents typographical widows (single-word lines) in Polish texts by adding non-breaking spaces before common short words.

## Overview

In Polish typography, it's considered poor style to leave very short words (like prepositions or conjunctions) at the end of a line. This script automatically adds non-breaking spaces before such words, ensuring they stay with the following text.

## Features

- Automatically detects common Polish short words (prepositions, conjunctions, etc.)
- Works with both paragraphs and headers
- Handles the following words: "o", "i", "a", "u", "w", "z", "że", "ku", "po", "na", "do", "za", "we", "od", "ze", "się"
- Case-insensitive matching

## Installation

1. Save the script as `polish-widows.lua` in your TeX project directory
2. Load the script in your XeLaTeX document using:

```latex
\usepackage{luacode}
\directlua{dofile("polish-widows.lua")}
```

## Usage

Once installed, the script automatically processes your document during compilation. No additional configuration is needed - it will prevent widows by adding non-breaking spaces (`~`) before the specified short words.

## How It Works

The script works by:
1. Identifying short words from a predefined list
2. Adding a non-breaking space after these words using LaTeX's `~` command
3. Processing both regular paragraphs and headers
