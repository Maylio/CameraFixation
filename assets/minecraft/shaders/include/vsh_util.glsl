//ProjMatからGUIかを判断する
bool isGUI(mat4 ProjMat) {
    return abs(ProjMat[3][3] - 1.0) < 0.01;
}

//ProjMatからメニュー画面かを判断する
bool isPanorama(mat4 ProjMat) {
    float far = ProjMat[3][2] / (ProjMat[2][2] + 1);
    return far < 9.99996 && far > 9.99995;
}

//PositionとModelViewMatから太陽かを判断する
bool isSUN(vec3 Position, mat4 ModelViewMat) {
    return Position.y < 110.0  && Position.y > -110.0 && (ModelViewMat * vec4(Position, 1.0)).z > -110.0;
}


//入力されたfloatから回転行列を作る
mat3 rotateX(float angle) {
    return mat3(1.0,    0.0    ,     0.0    ,
                0.0, cos(angle), -sin(angle),
                0.0, sin(angle),  cos(angle));
}
mat3 rotateY(float angle) {
    return mat3(cos(angle), 0.0, sin(angle),
                   0.0    , 1.0,    0.0    ,
               -sin(angle), 0.0, cos(angle));
}
mat3 rotateZ(float angle) {
    return mat3(cos(angle), -sin(angle), 0.0,
                sin(angle),  cos(angle), 0.0,
                   0.0    ,    0.0     , 1.0);
}