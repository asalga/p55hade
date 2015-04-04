// Basic texturing
#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D texture;
uniform vec2 iResolution;

void main(){
	vec2 texel = vec2(gl_FragCoord.x/iResolution.x, gl_FragCoord.y/iResolution.y);
	gl_FragColor = texture2D(texture, texel);
}
