#version 150

#moj_import <fog.glsl>
#moj_import <vsh_util.glsl>
#moj_import <config.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in vec3 Normal;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec4 normal;

//雲の描画
void main() {
    //三人称視点のカメラのずれ
    vec3 thirdpersonpos = inverse(mat3(ModelViewMat)) * vec3(0.0,0.0,4.0);
    //configで指定したカメラの座標(include/config.glsl参照)
    vec3 camerapos = vec3(CAMERAX,CAMERAY,CAMERAZ);
    //雲を広げてカメラのずれを軽減する
    vec3 viewpos = vec3(Position.x * 10.0 + thirdpersonpos.x - camerapos.x, Position.y / 1.3 + 10.0, Position.z * 10.0 + thirdpersonpos.z - camerapos.z);
    
    //ModelViewMatを無効化して計算した座標を乗算
    gl_Position = ProjMat * ModelViewMat * inverse(ModelViewMat) * vec4(rotateX(ROTATEX / -57.0) * rotateY((ROTATEY - 180.0) / -57.0) * rotateZ(ROTATEZ / -90.0) * viewpos, 1.0);
    ////カメラと頂点の距離？霧の描画に影響します
    vertexDistance = cylindrical_distance(ModelViewMat * inverse(ModelViewMat), rotateX(ROTATEX / -57.0) * rotateY((ROTATEY - 180.0) / -57.0) * rotateZ(ROTATEZ / -90.0) * viewpos);


    //通常の処理
    texCoord0 = UV0;
    vertexColor = Color;
    normal = ProjMat * ModelViewMat * vec4(Normal, 0.0);
}
