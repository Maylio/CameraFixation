#version 150

#moj_import <vsh_util.glsl>
#moj_import <config.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in vec2 UV2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;

out vec4 vertexColor;
out vec2 texCoord0;
out vec2 texCoord2;

//モブの名前の黒い背景の描画
void main() {
    //GENERALの描画を呼び出す(include/position.glsl参照)
    #define GENERAL
    #moj_import <position.glsl>


    //通常の処理
    vertexColor = Color;
    texCoord0 = UV0;
    texCoord2 = UV2;
}
