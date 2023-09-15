<div align="center">
    <img width="256" src="https://github.com/mtynior/Xplunger/assets/6362174/ad2d0289-2959-4d20-ab09-b8c51002506d">
    <h1>Xplunger</h1>
    <h3>An utility app that unclogs Xcode's build processes.</h3>
</div>
<p align="center">
  <img src="https://img.shields.io/badge/language-Swift-orange" />
  <img src="https://img.shields.io/badge/license-MIT-blue.svg" />
</p>

<div align="center">
    <img width="578" alt="xplunger_screenshot" src="https://github.com/mtynior/Xplunger/assets/6362174/b42df63c-1a13-437e-84c6-6023400201a9">
</div>

This is a simple utility app that kills Xcode's build processes that are stuck. The app kills following processes:

* XCBBuildService
* SourceKitService
* lldb-rpc-server
* com.apple.dt.SKAgent
* swift-frontend

## Requirements
* Xcode 14+
* macOS 13+
