#version 150

#moj_import <vsh_util.glsl>
#moj_import <config.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec4 normal;

//パーティクルなどの描画
void main() {
    //UNIQUEの描画を呼び出す(include/position.glsl参照)
    #define UNIQUE
    #moj_import <position.glsl>
    ////カメラと頂点の距離？霧の描画に影響します
    vertexDistance = length((ModelViewMat * vec4(rotateX(ROTATEX / -57.0) * rotateY((ROTATEY - 180.0) / -57.0) * rotateZ(ROTATEZ / -90.0) * inverse(IViewRotMat) * viewpos * inverse(IViewRotMat), 1.0)).xyz);


    //通常の処理
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    normal = ProjMat * ModelViewMat * vec4(Normal, 0.0);
}
