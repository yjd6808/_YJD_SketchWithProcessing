void setup()
{
    _init();
    size(600, 800, P3D);
}

void draw()
{
    _draw_prologue();    // 공통 draw 프로시저 처리(카메라가 월드 중앙을 바라보도록..)

    _stroke(COLOR_RED);
    box(5);

    _darw_epilogue();
}

// ==============================================================================================
// 규칙.
// 1. 내가 정의 모든 함수는 언더바로 무조건 시작하도록 한다.
// 변수들
final PVector MIN_X               = new PVector(-1000, 0, 0);
final PVector MIN_Y               = new PVector(0, -1000, 0);
final PVector MIN_Z               = new PVector(0, 0, -1000);

final PVector MAX_X               = new PVector(1000, 0, 0);
final PVector MAX_Y               = new PVector(0, 1000, 0);
final PVector MAX_Z               = new PVector(0, 0, 1000);

final PVector RIGHT               = new PVector(1, 0, 0);
final PVector UP                  = new PVector(0, 1, 0);
final PVector FORWARD             = new PVector(0, 0, 1);
final PVector[] COLORS            = new PVector[30];

final float AXIS_SPACING            = 3.0f;
final float POINT_SIZE              = 2.0f;

final int COLOR_RED                 = 0;
final int COLOR_GREEN               = 1;
final int COLOR_BLUE                = 2;
final int COLOR_YELLOW              = 3;
final int COLOR_CYAN                = 4;
final int COLOR_MAGENTA             = 5;
final int COLOR_ORANGE              = 6;
final int COLOR_PURPLE              = 7;
final int COLOR_PINK                = 8;
final int COLOR_BLACK               = 9;
final int COLOR_WHITE               = 10;
final int COLOR_GRAY                = 11;
final int COLOR_SILVER              = 12;
final int COLOR_OLIVE               = 13;
final int COLOR_MAROON              = 14;
final int COLOR_DARK_GREEN          = 15;
final int COLOR_TEAL                = 16;
final int COLOR_INDIGO              = 17;
final int COLOR_DEEP_PINK           = 18;
final int COLOR_CHOCOLATE           = 19;
final int COLOR_SEA_GREEN           = 20;
final int COLOR_DARK_SLATE_GRAY     = 21;
final int COLOR_TOMATO              = 22;
final int COLOR_GOLDENROD           = 23;
final int COLOR_SADDLE_BROWN        = 24;
final int COLOR_LIGHT_BLUE          = 25;
final int COLOR_KHAKI               = 26;
final int COLOR_PALE_GREEN          = 27;
final int COLOR_PALE_VIOLET_RED     = 28;
final int COLOR_SANDY_BROWN         = 29;

void _init()
{
    COLORS[0]  = new PVector(255, 0, 0);        // Red
    COLORS[1]  = new PVector(0, 255, 0);        // Green
    COLORS[2]  = new PVector(0, 0, 255);        // Blue
    COLORS[3]  = new PVector(255, 255, 0);      // Yellow
    COLORS[4]  = new PVector(0, 255, 255);      // Cyan
    COLORS[5]  = new PVector(255, 0, 255);      // Magenta
    COLORS[6]  = new PVector(255, 165, 0);      // Orange
    COLORS[7]  = new PVector(128, 0, 128);      // Purple
    COLORS[8]  = new PVector(255, 192, 203);    // Pink
    COLORS[9]  = new PVector(0, 0, 0);          // Black
    COLORS[10] = new PVector(255, 255, 255);    // White
    COLORS[11] = new PVector(128, 128, 128);    // Gray
    COLORS[12] = new PVector(192, 192, 192);    // Silver
    COLORS[13] = new PVector(128, 128, 0);      // Olive
    COLORS[14] = new PVector(128, 0, 0);        // Maroon
    COLORS[15] = new PVector(0, 128, 0);        // Dark Green
    COLORS[16] = new PVector(0, 128, 128);      // Teal
    COLORS[17] = new PVector(75, 0, 130);       // Indigo
    COLORS[18] = new PVector(255, 20, 147);     // Deep Pink
    COLORS[19] = new PVector(210, 105, 30);     // Chocolate
    COLORS[20] = new PVector(46, 139, 87);      // Sea Green
    COLORS[21] = new PVector(47, 79, 79);       // Dark Slate Gray
    COLORS[22] = new PVector(255, 99, 71);      // Tomato
    COLORS[23] = new PVector(218, 165, 32);     // Goldenrod
    COLORS[24] = new PVector(139, 69, 19);      // Saddle Brown
    COLORS[25] = new PVector(173, 216, 230);    // Light Blue
    COLORS[26] = new PVector(240, 230, 140);    // Khaki
    COLORS[27] = new PVector(152, 251, 152);    // Pale Green
    COLORS[28] = new PVector(219, 112, 147);    // Pale Violet Red
    COLORS[29] = new PVector(244, 164, 96);     // Sandy Brown
}

void _draw_prologue()
{
    // 카메라 세팅
    camera(100, 100, -100, 0, 0, 0, 0, -1, 0); // opengl gluLookAt 함수와 유사함 https://registry.khronos.org/OpenGL-Refpages/gl2.1/xhtml/gluLookAt.xml
    
    _point(40, 0, 0, COLOR_RED);
    _point(0, 40, 0, COLOR_GREEN);
    _point(0, 0, 40, COLOR_BLUE);

    // 좌표계 세팅
    _draw_axis(3);
}

void _darw_epilogue()
{
}

void _draw_axis(int _axisCount)
{
    if (_axisCount <= 2)
    {
        _line_dotted(MIN_X, MAX_X, AXIS_SPACING, COLOR_RED);      // X축
        _line_dotted(MIN_Y, MAX_Y, AXIS_SPACING, COLOR_GREEN);    // y축
    }
    else
    {
        _line_dotted(MIN_X, MAX_X, AXIS_SPACING, COLOR_RED);      // X축
        _line_dotted(MIN_Z, MAX_Z, AXIS_SPACING, COLOR_BLUE);     // z축
        _line_dotted(MIN_Y, MAX_Y, AXIS_SPACING, COLOR_GREEN);    // y축
    }
}

void _draw_vector(PVector _src, PVector _dst)
{
    stroke(0);
    strokeWeight(2);

    line(_src.x, _src.y, _src.z, _src.x + _dst.x, _src.y + _dst.y, _src.z + _dst.z);
}

void _stroke(int _color)
{
    stroke(COLORS[_color].x, COLORS[_color].y, COLORS[_color].z);
}

void _fill(int _color)
{
    fill(COLORS[_color].x, COLORS[_color].y, COLORS[_color].z);
}

void _line_dotted(PVector _start, PVector _end, float _spacing, int _color)
{
    pushStyle(); // https://processing.org/reference/pushStyle_.html
    _stroke(_color);

    PVector dir = _sub(_end, _start);
    PVector dir_unit = _normalize(dir);
    PVector cur_start = null;
    PVector cur_end = null;

    float dir_length = dir.mag();
    float dot_line_length = 3.0f;

    for (float i = 0; i < dir_length;)    // i는 그려지기 시작하는 magnitude
    {
        cur_start = _add(_start, _mul(dir_unit, i));
        cur_end = _add(cur_start, _mul(dir_unit, dot_line_length));
        _line_native(cur_start, cur_end);

        i += dot_line_length + _spacing;
    }

    popStyle();
}

void _line_solid(PVector _start, PVector _end, int _color)
{
    pushStyle();
    _stroke(_color);
    line(_start.x, _start.y, _start.z, _end.x, _end.y, _end.z);
    popStyle();
}

void _line_native(PVector _start, PVector _end)
{
    line(_start.x, _start.y, _start.z, _end.x, _end.y, _end.z);
}

PVector _add(PVector _src, PVector _dst) 
{ 
    return PVector.add(_src, _dst); 
}

PVector _sub(PVector _src, PVector _dst) 
{ 
    return PVector.sub(_src, _dst); 
}

PVector _mul(PVector _src, float _scalar) 
{ 
    return PVector.mult(_src, _scalar); 
}

PVector _normalize(PVector _src) 
{ 
    PVector normal = new PVector(_src.x, _src.y, _src.z);
    normal.normalize();
    return normal;
}

void _sphere(PVector _pos, float _radious, int _color)
{
    pushMatrix();
    _fill(_color);
    _stroke(_color);
    translate(_pos.x, _pos.y, _pos.z);
    sphere(_radious);
    popMatrix();
}

void _point(PVector _pos, int _color)
{
    _sphere(_pos, POINT_SIZE / 2.0f, _color);
}

void _point(float _x, float _y, float _z, int _color)
{
    _sphere(new PVector(_x, _y, _z), POINT_SIZE / 2.0f, _color);
}