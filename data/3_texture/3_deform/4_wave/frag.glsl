#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D textureUnit;
uniform vec2 iResolution;
uniform float iGlobalTime;

void main(){
	float t = iGlobalTime/100.0;
	
	float u = gl_FragCoord.x + iGlobalTime/5.0;
	float v = gl_FragCoord.y + (sin((gl_FragCoord.x/10.0) + t) * 5.0);
	vec2 uv = vec2(u, 1.0 - v);
	
	vec3 texel = vec3(texture2D(textureUnit, uv.xy / (iResolution.x/2.0)));

	gl_FragColor = vec4(texel, 1);
}
