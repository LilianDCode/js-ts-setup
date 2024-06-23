#!/bin/sh

SUCCESS_INSTALLATION=1
EXIT_CODE=0

echo "Checking installed tools..."

command -v npm >/dev/null 2>&1 && echo "npm installed ✅" || { echo "ERROR: npm not installed ❌"; SUCCESS_INSTALLATION=0; }
command -v node >/dev/null 2>&1 && echo "node installed ✅" || { echo "ERROR: node not installed ❌"; SUCCESS_INSTALLATION=0; }
command -v tsc >/dev/null 2>&1 && echo "typescript installed ✅" || { echo "ERROR: typescript not installed ❌"; SUCCESS_INSTALLATION=0; }
command -v eslint >/dev/null 2>&1 && echo "eslint installed ✅" || { echo "ERROR: eslint not installed ❌"; SUCCESS_INSTALLATION=0; }
command -v prettier >/dev/null 2>&1 && echo "prettier installed ✅" || { echo "ERROR: prettier not installed ❌"; SUCCESS_INSTALLATION=0; }
command -v jest >/dev/null 2>&1 && echo "jest installed ✅" || { echo "ERROR: jest not installed ❌"; SUCCESS_INSTALLATION=0; }

if [ "$SUCCESS_INSTALLATION" -eq 1 ]; then
    echo "All tools are successfully installed! ✅"
else
    EXIT_CODE=1
    echo "Error during installation process. ❌ Please check logs for more details."
fi

# Check VSCode extensions if insllation successful

if [ "$SUCCESS_INSTALLATION" -eq 1 ]; then
    EXTENSIONS_INSTALLED=1

    echo "Checking VSCode extensions..."

    EXTENSIONS=$(code --list-extensions)
    EXPECTED_EXTENSIONS="dbaeumer.vscode-eslint esbenp.prettier-vscode ms-vscode.vscode-typescript-tslint-plugin xabikos.javascriptsnippets christian-kohler.npm-intellisense christian-kohler.path-intellisense"

    for EXTENSION in $EXPECTED_EXTENSIONS; do
        if ! echo "$EXTENSIONS" | grep -q "$EXTENSION"; then
            echo "VS Code extension $EXTENSION not installed correctly. ❌"
            EXTENSIONS_INSTALLED=0
        else
            echo "VS Code extension $EXTENSION installed ✅"
        fi
    done

    if [ "$EXTENSIONS_INSTALLED" -eq 1 ]; then
        echo "All VSCode extensions are successfully installed! ✅"
    else
        EXIT_CODE=1
        echo "Error during installation of vscode extensions. ❌ Please check logs for more details."
    fi
fi

exit $EXIT_CODE
