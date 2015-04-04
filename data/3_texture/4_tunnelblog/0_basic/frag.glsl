#ifdef GL_ES
precision mediump float;
#endif

#define TAU 3.141592658 * 2.0

uniform vec2 iResolution;
uniform float iGlobalTime;
uniform sampler2D texture;

void main(){
	float t = iGlobalTime / 1000.0;

	// range is (-1 .. 1)
	vec2 p = (gl_FragCoord.xy / iResolution.xy) * 2.0 - 1.0;

	// r, len, distance
	float r = 1.0 / length(p) + t;
	float theta = atan(p.y/p.x) / TAU;

	// convert polar coords to cartesian
	vec2 texel = vec2(r, theta);

	vec4 fogColor = vec4( vec3(0.5) * length(p), 1.0);
	
	gl_FragColor = texture2D(texture, texel) * fogColor;
}
