#version 150

#moj_import <projection.glsl>
#moj_import <vsh_util.glsl>
#moj_import <config.glsl>

in vec3 Position;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;

out vec4 texProj0;

//エンドポータルの描画
void main() {
    //GENERALの描画を呼び出す(include/position.glsl参照)
    #define GENERAL
    #moj_import <position.glsl>
    
    
    //通常の処理
    texProj0 = projection_from_position(gl_Position);
}
