#version 150

#moj_import <vsh_util.glsl>
#moj_import <config.glsl>

in vec3 Position;
in vec4 Color;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;

out vec4 vertexColor;

//夕焼けや朝日の描画
void main() {
    //もしGUIじゃ無い場合(include/vsh_util.glsl参照)
    if(isGUI(ProjMat) == false) {
        //空の描画関連なのでプレイヤーの回転のみ無効化します
        vec3 pos = Position * inverse(IViewRotMat);
        gl_Position = ProjMat * ModelViewMat * (vec4(rotateX(ROTATEX) * rotateY(ROTATEY) * rotateZ(ROTATEZ) * pos, 1.0));
    } else {
        //通常の処理
        gl_Position = ProjMat * ModelViewMat * (vec4(Position, 1.0));
    }
    //通常の処理
    vertexColor = Color;
}
