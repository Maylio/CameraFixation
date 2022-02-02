# CameraFixation

## 説明
相対的なカメラの位置と回転を固定できるバニラシェーダーです。

[CoreShadersCustomTemplateRP](https://github.com/onnowhere/core_shaders/tree/master/CoreShadersCustomTemplateRP)をお借りしています。

## 使い方

__include/config.glsl__ を編集してカメラの位置と回転の設定を変更できます。

### カメラの位置

プレイヤーからの __相対座標__ を入力してカメラを移動できます。デフォルトの値は下記の通りです。

  __X座標__
  ```
  #define CAMERAX 0.0
  ```
  __Y座標__
  ```
  #define CAMERAY 0.0
  ```
  __Z座標__
  ```
  #define CAMERAZ 4.0
  ```
  
### カメラの回転

 __(180.0,0.0)を基準__ としてカメラを回転させることができます。デフォルトの値は下記の通りです。


  __縦回転__
  ```
  #define ROTATEX 0.0
  ```
  __横回転__
  ```
  #define ROTATEY 0.0
  ```
  __傾き__
  ```
  #define ROTATEZ 0.0
  ```

## スクリーンショット
