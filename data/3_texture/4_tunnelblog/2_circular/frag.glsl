// Making it circular

#ifdef GL_ES
precision mediump float;
#endif

#define TAU 3.141592658 * 2.0

uniform vec2 iResolution;
uniform sampler2D texture;

void main(){
	vec2 p = (gl_FragCoord.xy / iResolution.xy) * 2.0 - 1.0;
	
	//vec2 uv = vec2(length(p), atan(p.y/p.x) / TAU);
	float x = length(p);
	float y = atan(p.y/p.x) / TAU;
	gl_FragColor = texture2D(texture, vec2(x,y));
}
