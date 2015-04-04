#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform float iGlobalTime;
uniform vec2 iResolution;

void main(){
	gl_FragColor = vec4(0,0,1,1);
}
