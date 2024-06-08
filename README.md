# JavaScript/TypeScript Development Setup

This project provides a script to set up a development environment on Ubuntu for JavaScript/TypeScript. It supports multiple versions of Ubuntu and allows you to install a variety of tools interactively or in CI mode.

## Compatibility

| Ubuntu Version | Status |
| -------------- | ------ |
| Ubuntu 24.04   | ![Ubuntu 24.04](https://github.com/yourusername/my-js-ts-setup/actions/workflows/ci.yml/badge.svg?branch=main&event=push&job=test-setup&matrix=os=ubuntu-24.04) |
| Ubuntu 22.04   | ![Ubuntu 22.04](https://github.com/yourusername/my-js-ts-setup/actions/workflows/ci.yml/badge.svg?branch=main&event=push&job=test-setup&matrix=os=ubuntu-22.04) |
| Ubuntu 20.04   | ![Ubuntu 20.04](https://github.com/yourusername/my-js-ts-setup/actions/workflows/ci.yml/badge.svg?branch=main&event=push&job=test-setup&matrix=os=ubuntu-20.04) |

## Usage

Run the setup script with a single command:

```sh
curl -fsSL https://raw.githubusercontent.com/LilianDCode/js-ts-setup/main/setup.sh | sudo bash
```

## Tools Included

| Tool | Description |
| --- | --- |
| [Node.js](https://nodejs.org/) | JavaScript runtime built on Chrome's V8 JavaScript engine. |
| [npm](https://www.npmjs.com/) | Package manager for Node.js. |
| [Yarn](https://yarnpkg.com/) | Fast, reliable, and secure dependency management. |
| [TypeScript](https://www.typescriptlang.org/) | Typed superset of JavaScript that compiles to plain JavaScript. |

### VSCode extensions

In addition to the tools mentioned above, there are several Visual Studio Code extensions that can enhance your development experience. Here are some of the most useful ones:

| Extension | Description |
| --- | --- |
| [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) | Integrates ESLint into VS Code. |
| [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) | Code formatter using prettier. |
| [TypeScript TSLint Plugin](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-typescript-tslint-plugin) | TSLint support for TypeScript. |
| [JavaScript Snippets](https://marketplace.visualstudio.com/items?itemName=xabikos.JavaScriptSnippets) | Code snippets for JavaScript. |
| [npm Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.npm-intellisense) | IntelliSense for npm modules. |
| [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense) | IntelliSense for file paths. |

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
