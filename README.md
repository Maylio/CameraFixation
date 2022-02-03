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

__注意__
・1.18.1での動作のみサポートしています。
・三人称視点前方または後方での使用のみサポートしています。


## 改造

__assets/minecraft/shaders/include/config.glsl__ を編集してカメラの位置と回転の設定を変更できます。

### カメラの位置

プレイヤーからの __相対座標__ を入力してカメラを移動させることができます。デフォルトの値は下記の通りです。  
  ```
  //X座標
  #define CAMERAX 0.0
  //Y座標
  #define CAMERAY 0.0
  //Z座標
  #define CAMERAZ -4.0
  ```
  
### カメラの回転

 __F3で確認できる回転と同じ数値__ を入力してカメラを回転させることができます。デフォルトの値は下記の通りです。  
  ```
  //縦回転
  #define ROTATEX 0.0
  //横回転
  #define ROTATEY 0.0
  //傾き
  #define ROTATEZ 0.0
  ```
  
### おすすめのカメラ設定
斜め下から
```
//プレイヤーからの相対座標
//X座標
#define CAMERAX -1.0
//Y座標
#define CAMERAY -1.0
//Z座標
#define CAMERAZ 1.0

//回転させたい角度
//縦回転
#define ROTATEX -40.0
//横回転
#define ROTATEY 45.0
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

