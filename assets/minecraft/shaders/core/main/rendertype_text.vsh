#version 150

#moj_import <vsh_util.glsl>
#moj_import <config.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

//看板の文字やモブの名前の文字の描画
void main() {
    //もし看板の文字やモブの名前の文字の場合
    if(Position.z < 0.0) {
        //GENERALの描画を呼び出す(include/position.glsl参照)
        #define GENERAL
        #moj_import <position.glsl>
        //カメラと頂点の距離？霧の描画に影響します
        vertexDistance = length((ModelViewMat * vec4(rotateX(ROTATEX / -57.0) * rotateY((ROTATEY - 180.0) / -57.0) * rotateZ(ROTATEZ / -90.0) * viewpos, 1.0)).xyz);
    } else {
        //通常の描画
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        vertexDistance = length((ModelViewMat * vec4(Position, 1.0)).xyz);
    }
    //通常の処理
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
}