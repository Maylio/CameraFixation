#version 150

#moj_import <vsh_util.glsl>
#moj_import <config.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat4 TextureMat;
uniform mat3 IViewRotMat;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

//エンチャのキラキラなどの描画
void main() {
    //もしGUIじゃ無い場合(include/vsh_util.glsl参照)
    if(isGUI(ProjMat) == false) {
        //GENERALの描画を呼び出す(include/position.glsl参照)
        #define GENERAL
        #moj_import <position.glsl>
        //カメラと頂点の距離？霧の描画に影響します
        vertexDistance = length((ModelViewMat * vec4(rotateX(ROTATEX) * rotateY(ROTATEY) * rotateZ(ROTATEZ) * viewpos, 1.0)).xyz);
    } else {
        //通常の処理
        gl_Position = ProjMat * ModelViewMat * (vec4(Position, 1.0));
        vertexDistance = length((ModelViewMat * vec4(Position, 1.0)).xyz);
    }
    //通常の処理
    vertexColor = Color;
    texCoord0 = (TextureMat * vec4(UV0, 0.0, 1.0)).xy;
}
