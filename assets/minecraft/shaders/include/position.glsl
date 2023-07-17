//uniform vec3 Position : カメラを基準とした頂点の座標。
//uniform mat3 IViewRotMat : プレイヤーの回転が入った行列。ここにvec3の座標を乗算するとプレイヤーの回転を基準とした座標に変換される。
//uniform mat4 ProjMat : 射影行列。3次元の座標から2次元の座標に変換する。
//uniform mat4 ModelViewMat : オブジェクト座標から視点座標に変換する行列。

//inverse() : かっこ内の行列の逆配列に変換する。 かっこ内の行列によって変換された値に乗算すると変換されていない値にできる。
//mat3() : かっこ内の行列をmat3の行列に変換する。

//CAMERAX : include/config.glsl参照
//CAMERAY : include/config.glsl参照
//CAMERAZ : include/config.glsl参照
//ROTATEX : include/config.glsl参照
//ROTATEY : include/config.glsl参照
//ROTATEZ : include/config.glsl参照

//rotateX() : include/vsh_util.glsl参照
//rotateY() : include/vsh_util.glsl参照
//rotateZ() : include/vsh_util.glsl参照



//エンティティや多くの描画で使われる
#ifdef GENERAL
    //-----座標の計算-----
    //
    //プレイヤーの回転を無効化した頂点の座標(このままだと三人称視点の分ずれてる) = 通常の頂点の座標 * プレイヤーの回転の逆配列
    vec3 pos = Position * inverse(IViewRotMat);
    //
    //三人称視点の回転の中心からずれる座標の量 = プレイヤーの回転 * 4ブロック分の奥行
    vec3 thirdpersonpos = IViewRotMat * vec3(0.0,0.0,4.0);
    //
    //configで指定したカメラの座標(include/config.glsl参照)
    vec3 camerapos = vec3(CAMERAX,CAMERAY,CAMERAZ);
    //
    //
    //回転が無効化されてカメラが移動した座標 = 回転を無効化したずれの無い座標  +  configで指定した任意の座標
    vec3 viewpos = pos - camerapos + thirdpersonpos;
    //-------------------------------------------------------------------------------------------------------------------


    //-----描画-----              ↓どうしてvec4かというとProjMatとModelViewMatがmat4だからです。matとvecは後ろの数字が同じものしか乗算できません。
    //射影行列 * モデルビュー行列 * vec4(configで指定した数値から作った回転行列 * 回転が無効化されてカメラが移動した座標 , 描画のレイヤー位置？)
    gl_Position = ProjMat * ModelViewMat * vec4(rotateX(ROTATEX / -57.0) * rotateY((ROTATEY - 180.0) / -57.0) * rotateZ(ROTATEZ / -90.0) * viewpos, 1.0);
    //-------------------------------------------------------------------------------------------------------------------
#endif



//ブロックの描画でのみ使われる
#ifdef BLOCK
    //ブロックの描画の場合IViewRotMatの代わりにinverse(mat3(ModelViewMat))を使う。
    //
    //-----座標の計算-----
    //ブロックの描画の場合Positionにチャンクの情報を足す。
    vec3 pos = Position + ChunkOffset;
    //
    //
    //プレイヤーの回転を無効化した頂点の座標(このままだと三人称視点の分ずれてる) = 通常の頂点の座標 * プレイヤーの回転の逆配列
    pos = pos * inverse(IViewRotMat);
    //
    //三人称視点の回転の中心からずれる座標の量 = プレイヤーの回転 * 4ブロック分の奥行
    vec3 thirdpersonpos = inverse(mat3(ModelViewMat)) * vec3(0.0,0.0,4.0);
    //
    //configで指定したカメラの座標(include/config.glsl参照)
    vec3 camerapos = vec3(CAMERAX,CAMERAY,CAMERAZ);
    //
    //
    //回転が無効化されてカメラが移動した座標 = 回転を無効化したずれの無い座標  +  configで指定した任意の座標
    vec3 viewpos = pos - camerapos + thirdpersonpos;
    //-------------------------------------------------------------------------------------------------------------------


    //-----描画-----     (ModelViewMatは無効化します)
    //射影行列 * vec4(configで指定した数値から作った回転行列 * 回転が無効化されてカメラが移動した座標 , 描画のレイヤー位置？)
    gl_Position = ProjMat * ModelViewMat * inverse(ModelViewMat) * vec4(rotateX(ROTATEX / -57.0) * rotateY((ROTATEY - 180.0) / -57.0) * rotateZ(ROTATEZ / -90.0) * viewpos, 1.0);
    ////カメラと頂点の距離？霧の描画に影響します
    vertexDistance = fog_distance(ModelViewMat * inverse(ModelViewMat) , rotateX(ROTATEX / -57.0) * rotateY((ROTATEY - 180.0) / -57.0) * rotateZ(ROTATEZ / -90.0) * viewpos, FogShape);
    //-------------------------------------------------------------------------------------------------------------------
#endif



//法則性も処理内容もよく理解していないけどなんか動いちゃったやつら
#ifdef UNIQUE
    //-----座標の計算-----
    //
    //プレイヤーの回転を無効化した頂点の座標(このままだと三人称視点の分ずれてる) = 通常の頂点の座標 * プレイヤーの回転の逆配列
    vec3 pos = Position * inverse(IViewRotMat);
    //
    //                    ↓なんでIViewRotMat二回乗算してるの？？？なんでこれでうまく動くの？？？？？？
    //三人称視点の回転の中心からずれる座標の量 = プレイヤーの回転 * 4ブロック分の奥行
    vec3 thirdpersonpos = IViewRotMat * IViewRotMat * vec3(0.0,0.0,4.0);
    //
    //configで指定したカメラの座標(include/config.glsl参照)
    vec3 camerapos = vec3(CAMERAX,CAMERAY,CAMERAZ) * inverse(IViewRotMat);;
    //
    //
    //回転が無効化されてカメラが移動した座標 = 回転を無効化したずれの無い座標  +  configで指定した任意の座標
    vec3 viewpos = pos - camerapos + thirdpersonpos;
    //-------------------------------------------------------------------------------------------------------------------


    //-----描画-----              ↓どうしてinverse(IViewRotMat)でviewposを挟んだら動いたんですか？？？
    //射影行列 * モデルビュー行列 * vec4(configで指定した数値から作った回転行列 * 回転が無効化されてカメラが移動した座標 , 描画のレイヤー位置？)
    gl_Position = ProjMat * ModelViewMat * vec4(rotateX(ROTATEX / -57.0) * rotateY((ROTATEY - 180.0) / -57.0) * rotateZ(ROTATEZ / -90.0) * inverse(IViewRotMat) * viewpos * inverse(IViewRotMat), 1.0);
    //-------------------------------------------------------------------------------------------------------------------
#endif



//ブロックを見ている時に出る線
#ifdef LINE
    //gl_PositionがlinePosStartに、ModelViewMatがVIEW_SCALEに変わっただけです。
    //
    //-----座標の計算-----
    //
    //プレイヤーの回転を無効化した頂点の座標(このままだと三人称視点の分ずれてる) = 通常の頂点の座標 * プレイヤーの回転の逆配列
    vec3 pos = Position * inverse(IViewRotMat);
    //
    //三人称視点の回転の中心からずれる座標の量 = プレイヤーの回転 * 4ブロック分の奥行
    vec3 thirdpersonpos = IViewRotMat * vec3(0.0,0.0,4.0);
    //
    //configで指定したカメラの座標(include/config.glsl参照)
    vec3 camerapos = vec3(CAMERAX,CAMERAY,CAMERAZ);
    //
    //
    //回転が無効化されてカメラが移動した座標 = 回転を無効化したずれの無い座標  +  configで指定した任意の座標
    vec3 viewpos = pos - camerapos + thirdpersonpos;
    //-------------------------------------------------------------------------------------------------------------------


    //-----描画-----
    //射影行列 * 謎の変数 * vec4(configで指定した数値から作った回転行列 * 回転が無効化されてカメラが移動した座標 , 描画のレイヤー位置？)
    vec4 linePosStart = ProjMat * VIEW_SCALE * ModelViewMat * vec4(rotateX(ROTATEX / -57.0) * rotateY((ROTATEY - 180.0) / -57.0) * rotateZ(ROTATEZ / -90.0) * viewpos, 1.0);
    //-------------------------------------------------------------------------------------------------------------------
#endif

