#version 150

#moj_import <vsh_util.glsl>
#moj_import <config.glsl>

in vec3 Position;
in vec2 UV0;
in vec4 Color;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;

out vec2 texCoord0;
out vec4 vertexColor;

//エンドの空の描画
void main() {
    //もしGUIでもメニュー画面でも無い場合(include/vsh_util.glsl参照)
    if(isGUI(ProjMat) == false && isPanorama(ProjMat) == false) {
        //GENERALの描画を呼び出す(include/position.glsl参照)
        #define GENERAL
        #moj_import <position.glsl>
    } else {
        //通常の描画
        gl_Position = ProjMat * ModelViewMat * (vec4(Position, 1.0));
    }
    //通常の処理
    texCoord0 = UV0;
    vertexColor = Color;
}
