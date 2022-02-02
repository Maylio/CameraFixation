# CameraFixation

## 説明
相対的なカメラの位置と回転を固定できるバニラシェーダーです。  
[CoreShadersCustomTemplateRP](https://github.com/onnowhere/core_shaders/tree/master/CoreShadersCustomTemplateRP)をお借りしています。

参考にさせていただいたサイト  
・https://minecraft.fandom.com/wiki/Shaders#Java_Edition  
・https://github.com/ShockMicro/Minecraft-Shaders/wiki  
・https://github.com/Godlander/objmc  

## 使い方
__Releases__ から最新版のリソースパックをダウンロードして、__.minecraft\resourcepacks__ 下においてください。

リソースパックを抜いた状態でF3を押し、自分のカメラの回転を確認しながら設定すると狙ったカメラ設定になりやすいです。

__注意：__ __三人称視点前方または後方での使用のみサポートしています。__


## 改造

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
  #define CAMERAZ -4.0
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
  
### おすすめのカメラ設定
斜め下から
```
//プレイヤーからの相対座標
//X座標
#define CAMERAX 0.0
//Y座標
#define CAMERAY 4.0
//Z座標
#define CAMERAZ 0.0

//回転させたい角度
//縦回転
#define ROTATEX 80.0
//横回転
#define ROTATEY 0.0
//傾き
#define ROTATEZ 0.0
```
真上から
```
//プレイヤーからの相対座標
//X座標
#define CAMERAX 0.0
//Y座標
#define CAMERAY 4.0
//Z座標
#define CAMERAZ 0.0

//回転させたい角度
//縦回転
#define ROTATEX 80.0
//横回転
#define ROTATEY 0.0
//傾き
#define ROTATEZ 0.0
```
  
## ライセンス
__MITライセンス__ が適用されます。

## スクリーンショット

![image](https://user-images.githubusercontent.com/67635981/152158811-cb897732-eec8-4c09-808f-dab6e8c383e9.png)
![image](https://user-images.githubusercontent.com/67635981/152158972-03111bdf-5d00-4876-9562-84681eda80e9.png)
![image](https://user-images.githubusercontent.com/67635981/152159017-1734a7f5-e035-4e1c-8251-0795a8787d86.png)

