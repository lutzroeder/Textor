#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

rm -f -r ../Build
mkdir -p ../Build/Debug
mkdir -p ../Build/Release

cp ../Samples/demo_canvaspad.html ../Build/Debug/
cp ../Samples/demo_canvaspad.html ../Build/Release/
cp ../Samples/demo_javascript.html ../Build/Debug/
cp ../Samples/demo_javascript.html ../Build/Release/
cp ../Samples/demo_html.html ../Build/Debug/
cp ../Samples/demo_html.html ../Build/Release/
cp ../Samples/demo_css.html ../Build/Debug/
cp ../Samples/demo_css.html ../Build/Release/

echo Building \'Debug/texteditor.js\'.
node tsc.js -target ES5 -out ../Build/Debug/texteditor.js ../Library/lib.d.ts ../Library/libex.d.ts ../Source/TextEditor/*.ts

if [ -f ../Build/Debug/texteditor.js ]; then
echo Building \'Debug/javascript.js\'.
node tsc.js -target ES5 -out ../Build/Debug/javascript.js ../Library/lib.d.ts ../Source/JavaScript/*.ts
echo Building \'Debug/css.js\'.
node tsc.js -target ES5 -out ../Build/Debug/css.js ../Library/lib.d.ts ../Source/Css/*.ts
echo Building \'Debug/html.js\'.
node tsc.js -target ES5 -out ../Build/Debug/html.js ../Library/lib.d.ts ../Source/Html/*.ts
fi

echo Building \'Release/textditor.js\'.
node minify.js ../Build/Debug/texteditor.js ../Build/Release/texteditor.js
echo Building \'Release/css.js\'.
node minify.js ../Build/Debug/css.js ../Build/Release/css.js
echo Building \'Release/javascript.js\'.
node minify.js ../Build/Debug/javascript.js ../Build/Release/javascript.js
echo Building \'Release/html.js\'.
node minify.js ../Build/Debug/html.js ../Build/Release/html.js

echo Done.
