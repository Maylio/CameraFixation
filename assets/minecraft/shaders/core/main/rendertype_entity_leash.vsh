#version 150

#moj_import <vsh_util.glsl>
#moj_import <config.glsl>

in vec3 Position;
in vec4 Color;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform vec4 ColorModulator;
uniform mat3 IViewRotMat;

out float vertexDistance;
flat out vec4 vertexColor;

//リードの描画
void main() {
    //GENERALの描画を呼び出す(include/position.glsl参照)
    #define GENERAL
    #moj_import <position.glsl>
    //カメラと頂点の距離？霧の描画に影響します
    vertexDistance = length((ModelViewMat * vec4(rotateX(ROTATEX) * rotateY(ROTATEY) * rotateZ(ROTATEZ) * viewpos, 1.0)).xyz);


    //通常の処理
    vertexColor = Color * ColorModulator * texelFetch(Sampler2, UV2 / 16, 0);
}
