
#ifdef GL_ES
precision mediump int;
precision mediump float;
#endif

// this needs to get appended(?)
uniform vec2 iResolution;

#define PROCESSING_COLOR_SHADER

const float radius = 130.0;

void main(){
  // If the distance from the current coord lays inside the
  // circle's radius, draw that pixel white

  // distance() calculates the distance between two points
  // see also length()
  if( distance(vec2(iResolution.x/2.0, iResolution.y/2.0), vec2(gl_FragCoord)) < radius){
    gl_FragColor = vec4(1);
  }
  else{
    gl_FragColor = vec4(0);
  }
}
