#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D textureUnit;
uniform vec2 iResolution;
uniform float iGlobalTime;

void main(){

	float t = iGlobalTime/10.0;
	vec2 uv = vec2(gl_FragCoord.x + t, 1.0 - gl_FragCoord.y);
	vec3 texel = vec3(texture2D(textureUnit, uv.xy / (iResolution.x/2.0)));
	gl_FragColor = vec4(texel, 1);
}
