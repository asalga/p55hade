#ifdef GL_ES
precision mediump int;
precision mediump float;
#endif

uniform vec2 iResolution;

uniform sampler2D textureUnit;

void main(){
	vec2 uv = gl_FragCoord.xy / (iResolution.x/5.0);
	
	// should we do this in pjs?
	uv.y = 1.0 - uv.y;

	gl_FragColor = texture2D(textureUnit, uv);
}
