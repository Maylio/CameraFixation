#version 150

#moj_import <light.glsl>
#moj_import <fog.glsl>
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
uniform vec3 ChunkOffset;
uniform mat3 IViewRotMat;
uniform int FogShape;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec4 normal;

//ブロックの描画
void main() {
    //BLOCKの描画を呼び出す(include/position.glsl参照)
    #define BLOCK
    #moj_import <position.glsl>


    //通常の処理
    vertexColor = Color * minecraft_sample_lightmap(Sampler2, UV2);
    texCoord0 = UV0;
    normal = ProjMat * ModelViewMat * vec4(Normal, 0.0);

}
